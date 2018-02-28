#coding: UTF-8

import re
import sys

argvs = sys.argv
argc = len(argvs)
if argc < 2:
    print "Too Few Arguments. " + str(argc)
    print "Usage:: python pro_analysis.py [ProfileFileName]"
    sys.exit()
TARGET = (argvs[1].split("_",1))[0]

print "Loading "+TARGET+"_profile.txt"

PROFILE = TARGET + "_profile.txt"
ASM = TARGET + ".asm"
RESULT = TARGET + "_analysis.txt"

#�I�v�V�����t���O
COUNTSORT = False


f = open(PROFILE,'r')
pro_lines = f.readlines()
f.close()
f = open(ASM,'r')
asm_lines = f.readlines()
f.close()

main_start = 0
main_end = 0

class Cycle:
    def __init__(self,cycle):
        self.MyCycle = cycle
        self.MyCount = 1
        
class Inst:
    def __init__(self,name,cycle):
        self.name = name
        self.Cycle_list = []
        self.Cycle_list.append(cycle)

Inst_list = []


def parse_options():
    global argvs
    global argc
    global COUNTSORT
    options = [option for option in argvs if option.startswith('-')]
    if '-c' in options:
        COUNTSORT = True

def find_main():
    flag = 0
    global main_start
    global main_end
    for line in asm_lines:
        if re.search("<_main>:",line):
            data = line[:-1].split(' ')
            main_start = data[0]
            flag = 1
        if flag == 1 and re.search("jmp",line):
            line = line.replace(' ','')
            data = line[:-1].split(':')
            main_end = data[0]
            flag = 0
    print "main = %s - %s" %(main_start,main_end)

    
def insert_list(name,cycle):
    global Inst_list
    gosa = 0
    for inst in Inst_list:
        if inst.name == name:
            for item in inst.Cycle_list:
                if cycle == item.MyCycle:
                    item.MyCount += 1
                    return
            cur_cycle = Cycle(cycle)
            inst.Cycle_list.append(cur_cycle)
            return
    cur_cycle = Cycle(cycle)
    inst = Inst(name,cur_cycle)
    Inst_list.append(inst)
    return


def profile_analysis():
    flag = 0
    Before_cycle = 0
    Cur_cycle = 0
    New_cycle = 0
    Before_inst = ''
    Cur_inst = ''
    Cur_Step = ''
    New_inst = ''
    for line in pro_lines:
        if flag == 1:
            if Before_inst == '':
                data = line[:-1].split()
                Before_inst = data[5]
                Before_cycle = data[2]
            elif Cur_inst == '':
                data = line[:-1].split()
                Cur_inst = data[5]
                Cur_cycle = data[2]
            else:
                data = line[:-1].split()
                New_inst = data[5]
                New_cycle = data[2]
                if not Cur_cycle == Before_cycle:
                    insert_list(Before_inst,int(Cur_cycle)-int(Before_cycle))
                    Before_inst = Cur_inst
                    Cur_inst = New_inst
                    New_inst = ''
                    Before_cycle = Cur_cycle
                    Cur_cycle = New_cycle
                    New_cycle = 0
                elif Cur_cycle == New_cycle:
                    print "This program does not compatible with parallel"\
                    "execution more than two ways."
                    sys.exit()
                else:
                    cycle = 1.0*(int(New_cycle)-int(Cur_cycle))/2.0
                    insert_list(Before_inst,cycle)
                    insert_list(Cur_inst,cycle)
                    Before_inst = New_inst
                    Before_cycle = New_cycle
                    Cur_inst = ''
                    Cur_cycle = 0
                    New_inst = ''
                    New_cycle = 0
            if re.search(main_end,line):
                data = line[:-1].split()
                if int(data[3],16) == int(main_end,16):
                    flag = 2
        elif flag == 2:
            if not Cur_inst == '':
                data = line[:-1].split()
                New_inst = data[5]
                New_cycle = data[2]
                if not Cur_cycle == Before_cycle:
                    insert_list(Before_inst,int(Cur_cycle)-int(Before_cycle))
                    insert_list(Cur_inst,int(New_cycle)-int(Cur_cycle))
                else:
                    cycle = 1.0*(int(New_cycle)-int(Cur_cycle))/2.0
                    insert_list(Before_inst,cycle)
                    insert_list(Cur_inst,cycle)
            return
        elif re.search(main_start,line):
            flag = 1

parse_options()
find_main()
profile_analysis()
Best = 0
Worst = 0
f = open(RESULT,'w')
for inst in Inst_list:
    f.write('{:10}\n'.format(inst.name))
    if COUNTSORT:
        inst.Cycle_list = sorted(inst.Cycle_list,reverse=True,key=lambda x:x.MyCount)
    else:
        inst.Cycle_list = sorted(inst.Cycle_list,key=lambda x:x.MyCycle)
    for item in inst.Cycle_list:
        f.write('\t{:>5,.2f},{:>5}\n'.format(item.MyCycle,item.MyCount))
f.close()

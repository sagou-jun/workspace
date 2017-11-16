#ifndef IR_SIM_REGS_H
#define IR_SIM_REGS_H
#include"IRSimKinds.hpp"

namespace IRSIM{
#define RegID_width 5
#define Name_width 6
#define Value_width 8
#define default_precision 4

  class RegTableELE;
  
  class IRegs{
  public:
    virtual ~IRegs(){};
    virtual int getInt() = 0;
    virtual double getDouble() = 0;
    virtual unsigned getAdd() = 0;
    virtual void ValueTransfer(RegTableELE *RXRegister) = 0;
  };
  
  template<typename t>
  class RegValue;
  
  class RegTableELE:public IRegs{
  protected:
    unsigned RegID;
    string Name;
    KINDS Kind;
    bool trace;
    RegTableELE(unsigned id,string name,KINDS k);
  public:
    RegTableELE(const RegTableELE &obj)
    {
      RegID = obj.RegID;
      Name = obj.Name;
      Kind = obj.Kind;
      trace = obj.trace;
    };
    operator=(const RegTableELE &obj)
    {
      RegID = obj.RegID;
      Name = obj.Name;
      Kind = obj.Kind;
      trace = obj.trace;
    };
    virtual ~RegTableELE();
    virtual void print() = 0;
    virtual void dump() = 0;
    string getName(){return Name;};
    KINDS getKind(){return Kind;};
    unsigned getRegID(){return RegID;};
    void setName(const string name){Name = name;};
    void setKind(const KINDS kind){Kind = kind;};
    void setTrace(){trace = true;};
    void setTrace(unsigned ID){trace = (ID == RegID)?true:false; };
    virtual void setValue(int i) = 0;
    virtual void setValue(double d) = 0;
    virtual void setValue(unsigned u) = 0;
    /*�����^�̃��W�X�^�Ԃł̒l�̓]�����s��*/
    /*�^���������Ƃ��m�F���Ă���g������*/
    virtual void ValueTransfer(RegTableELE *RXRegister) = 0;
  };
  
  class RegTable{
  public:
    using RegTableVec = PtrVec<RegTableELE>;
    using RegTableMap = PtrMap<unsigned,RegTableVec>;
    using iterator = RegTableMap::iterator;
    using const_iterator = RegTableVec::const_iterator;
  private:
    unsigned lastRegID;			//�Ō�ɓo�^�������W�X�^��ID
    unsigned lastRegTableID;		//�Ō�ɓo�^�������W�X�^�e�[�u����ID
    deque<unsigned> RegTableIDStack;	// �o�^�������W�X�^�e�[�u��ID�̃X�^�b�N n�Ԗڂɓo�^�����e�[�u����ID��n-1�ɂȂ�.�O���[�o���e�[�u����ID�͕K��0
    RegTableMap RTMap;			//�X�R�[�v�𕪂��邽�߂Ɋ֐����Ƀ��W�X�^�e�[�u���𕪂���
    unsigned CurrentTableID;		//���ݎQ�Ƃ��Ă��郌�W�X�^�e�[�u����ID
    RegTableVec *CurrentTable;		//���ݎQ�Ƃ��Ă��郌�W�X�^�e�[�u���̖{��
    RegTableVec *GlobalTable;		//�O���[�o���ϐ��̃��W�X�^�e�[�u���̖{��
    RegTable(const RegTable &obj){};
    operator=(const RegTable &obj){};
    iterator begin(){return RTMap.begin();};
    iterator end(){return RTMap.end();};
  public:
    RegTable();
    ~RegTable(){};
    RegTableELE *RegLookUp(string Name);
    RegTableELE *RegLookUp(unsigned RegisterID);
    //setReg�֐��@���O��Name�ł��郌�W�X�^�����݂���΁C���̃��W�X�^�ւ̃|�C���^��Ԃ��D���̂Ƃ�setValue��true�Ȃ烌�W�X�^�̒l���X�V����
    //		 ���݂��Ȃ���Έ����ɂ��������ă��W�X�^�𐶐�����
    RegTableELE *setRegInt(int value,string Name,bool setValue = true);
    RegTableELE *setRegDouble(double value,string Name,bool setValue = true);
    RegTableELE *setRegAdd(unsigned value,string Name,bool setValue = true);
    unsigned getLastRegID(){return lastRegID;};
    //PassingArgument��ReturnValue�͂��ꂼ�������n�������Ɩ߂�l��Ԃ������C�ǂ������̃��W�X�^�ԂŒl�̓]�����s���D���M���̃��W�X�^�̖��O��TXRegName�ɁC��M���̃��W�X�^�̒l��RXRegName�ɂ��Ă�����
    //PassingArgumentTR��CallProcess�̌��ReturnValueTR��RetProcess�̑O�ɌĂяo���K�v������
    void PassingArgument(string TXRegName,string RXRegName,KINDS k);
    //���l����p
    void PassingArgument(IRegs *TX,string RXRegName,KINDS k);
    void ReturnValue(string TXRegName,unsigned RXRegID);
    void ReturnValue(IRegs *Tx,unsigned RXRegID);
    void CallProcess();			//���W�X�^�e�[�u����V���ɐ������C�Ăяo����̃X�R�[�v�̃e�[�u���ɐ؂�ւ���
    void RetProcess();			//���W�X�^�e�[�u���Ăяo�����̃X�R�[�v�̃e�[�u���ɖ߂�
    void print();
    void dump();
    const_iterator const_begin(){return CurrentTable->const_begin();};
    const_iterator const_end(){return CurrentTable->const_end();};
  };
  
  template<typename t>
  class RegValue:public RegTableELE{
  private:
    t Value;
  public:
    RegValue(t value,unsigned id,string name,KINDS k);
    ~RegValue(){/*cerr<<"RegValue deleted"<<endl;*/};
    RegValue(const RegValue &obj){Value = obj.Value;};
    operator=(const RegValue &obj){Value = obj.Value;}
    RegValue<t> *getPointer(){return this;};
    virtual void print();
    virtual void dump();
    virtual int getInt(){cerr<<"RegValue::This Object does not have Int Value"<<endl;}
    virtual unsigned getAdd(){cerr<<"RegValue::This Object does not have Unsigned Value"<<endl;};
    virtual double getDouble(){cerr<<"RegValue::This Object does not have Double Value"<<endl;};
    virtual void ValueTransfer(RegTableELE *RXRegister){};
    virtual void setValue(int i){};
    virtual void setValue(double d){};
    virtual void setValue(unsigned u){};
  };
  
  template<typename t>
  RegValue<t>::RegValue(t value,unsigned id,string name,KINDS k):RegTableELE(id,name,k){
    Value = value;
  }

  template<typename t>
  void RegValue<t>::print(){
    cout<<setw(RegID_width)<<RegTableELE::RegID<<":";
    cout<<setw(Name_width)<<RegTableELE::Name<<":";
    cout<<setw(Value_width)<<fixed<<setprecision(default_precision)<<Value<<":";
    cout<<IRSIM::str_Kind(RegTableELE::Kind)<<endl;
  }

  template<typename t>
  void RegValue<t>::dump()
  {
    cerr<<setw(RegID_width)<<RegTableELE::RegID<<":";
    cerr<<setw(Name_width)<<RegTableELE::Name<<":";
    cerr<<setw(Value_width)<<fixed<<setprecision(default_precision)<<Value<<":";
    cerr<<IRSIM::str_Kind(RegTableELE::Kind)<<endl;
  }
  
  template<>
  int RegValue<int>::getInt();
  template<>
  unsigned RegValue<unsigned>::getAdd();
  template<>
  double RegValue<double>::getDouble();
  template<>
  void RegValue<int>::setValue(int i);
  template<>
  void RegValue<unsigned>::setValue(unsigned u);
  template<>
  void RegValue<double>::setValue(double d);
  template<>
  void RegValue<int>::ValueTransfer(RegTableELE *RXRegister);
  template<>
  void RegValue<unsigned>::ValueTransfer(RegTableELE *RXRegister);
  template<>
  void RegValue<double>::ValueTransfer(RegTableELE *RXRegister);
  
  template<typename T>
  class ImmediateValue:public IRegs{
  private:
    T Value;
  public:
    ImmediateValue(){};
    ImmediateValue(T value):Value(value){};
    ~ImmediateValue(){};
    void setValue(T value){Value = value;};
    virtual unsigned getAdd(){cerr<<"ImmediateValue::This Object does not have Unsigned Value"<<endl;};
    virtual double getDouble(){cerr<<"ImmediateValue::This Object does not have Double Value"<<endl;};
    virtual int getInt(){cerr<<"ImmediateValue::This Object does not have Int Value"<<endl;};
    virtual void ValueTransfer(RegTableELE *RXRegister){cerr<<"ImmediateValue::ValueTransfer error"<<endl;};
  };

  template<>
  int ImmediateValue<int>::getInt();
  template<>
  double ImmediateValue<double>::getDouble();
  template<>
  unsigned ImmediateValue<unsigned>::getAdd();
  template<>
  void ImmediateValue<int>::ValueTransfer(RegTableELE *RXRegister);
  template<>
  void ImmediateValue<unsigned>::ValueTransfer(RegTableELE *RXRegister);
  template<>
  void ImmediateValue<double>::ValueTransfer(RegTableELE *RXRegister);
  
} // end namespace IRSIM
#endif
  

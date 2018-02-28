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
    /*同じ型のレジスタ間での値の転送を行う*/
    /*型が同じことを確認してから使うこと*/
    virtual void ValueTransfer(RegTableELE *RXRegister) = 0;
  };
  
  class RegTable{
  public:
    using RegTableVec = PtrVec<RegTableELE>;
    using RegTableMap = PtrMap<unsigned,RegTableVec>;
    using iterator = RegTableMap::iterator;
    using const_iterator = RegTableVec::const_iterator;
  private:
    unsigned lastRegID;			//最後に登録したレジスタのID
    unsigned lastRegTableID;		//最後に登録したレジスタテーブルのID
    deque<unsigned> RegTableIDStack;	// 登録したレジスタテーブルIDのスタック n番目に登録したテーブルのIDはn-1になる.グローバルテーブルのIDは必ず0
    RegTableMap RTMap;			//スコープを分けるために関数毎にレジスタテーブルを分ける
    unsigned CurrentTableID;		//現在参照しているレジスタテーブルのID
    RegTableVec *CurrentTable;		//現在参照しているレジスタテーブルの本体
    RegTableVec *GlobalTable;		//グローバル変数のレジスタテーブルの本体
    RegTable(const RegTable &obj){};
    operator=(const RegTable &obj){};
    iterator begin(){return RTMap.begin();};
    iterator end(){return RTMap.end();};
  public:
    RegTable();
    ~RegTable(){};
    RegTableELE *RegLookUp(string Name);
    RegTableELE *RegLookUp(unsigned RegisterID);
    //setReg関数　名前がNameであるレジスタが存在すれば，そのレジスタへのポインタを返す．そのときsetValueがtrueならレジスタの値を更新する
    //		 存在しなければ引数にしたがってレジスタを生成する
    RegTableELE *setRegInt(int value,string Name,bool setValue = true);
    RegTableELE *setRegDouble(double value,string Name,bool setValue = true);
    RegTableELE *setRegAdd(unsigned value,string Name,bool setValue = true);
    unsigned getLastRegID(){return lastRegID;};
    //PassingArgumentとReturnValueはそれぞれ引数を渡す処理と戻り値を返す処理，どちらも二つのレジスタ間で値の転送を行う．送信側のレジスタの名前をTXRegNameに，受信側のレジスタの値をRXRegNameにしていする
    //PassingArgumentTRはCallProcessの後にReturnValueTRはRetProcessの前に呼び出す必要がある
    void PassingArgument(string TXRegName,string RXRegName,KINDS k);
    //即値代入用
    void PassingArgument(IRegs *TX,string RXRegName,KINDS k);
    void ReturnValue(string TXRegName,unsigned RXRegID);
    void ReturnValue(IRegs *Tx,unsigned RXRegID);
    void CallProcess();			//レジスタテーブルを新たに生成し，呼び出し先のスコープのテーブルに切り替える
    void RetProcess();			//レジスタテーブル呼び出し元のスコープのテーブルに戻す
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
  

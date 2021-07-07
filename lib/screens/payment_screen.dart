import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:paymentscreen/billing_type/discount.dart';
import 'package:paymentscreen/billing_type/redeem.dart';
import 'package:paymentscreen/billing_type/shipping.dart';
import 'package:paymentscreen/billing_type/split_payment.dart';
import 'package:http/http.dart' as http;
import 'package:paymentscreen/void.dart';


class PaymentScreen extends StatefulWidget {
  double Ammount=0.0;
  double Balance=0.0;
  PaymentScreen({ Key? key, required this.Ammount,required this.Balance}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}
class _PaymentScreenState extends State<PaymentScreen> {
  static double paymentAmount =0;
  var size,height,width;
  double tipAmount =0.0;
  // double balanceAmount=0.00;
  String toBePaid ='0';
  int _currentIndex = 0;
  bool isClicked1 = true;
  bool isClicked2 = true;
  bool isClicked3 = true;
  bool isClicked4 = true;
  bool isClicked5 = true;
  bool value =false;
  bool isEnabled = false;
  bool isEnabledBalance = false;

  final _tipController = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  setBottomBarIndex(index){
    setState(() {
      _currentIndex = index;
    });
  }
  String totalAmount(){
    tipAmount =double.parse(_tipController.text);

    setState(() {
      isEnabled ?
      widget.Balance = ( widget.Balance+ tipAmount)
      :widget.Balance = ( widget.Balance-tipAmount);
    });
    return widget.Balance.toStringAsFixed(2);
  }

  List<String> _payMeth =["","","","","",];
  _PaymentScreenState() {
    fetchData().then((val) => setState(() {
      _payMeth= val;
    }));
  }

  Future<List<String>> fetchData() async {
    Map data = await getData();
    List<String> paymentMethod = [
      data['cash'],
      data['card'],
      data['cheque'],
      data['bank_transfer'],
      data['other'],
    ];
    return paymentMethod;
  }
  @override
  void initState() {
    fetchData();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    paymentAmount=widget.Ammount;
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              // button 1
              IconButton(
                icon: Icon(Icons.home_sharp,
                  color: _currentIndex == 0 ? Color(0xFFFFD45F) : Colors.grey[800],
                ),
                onPressed: (){
                  setBottomBarIndex(0);
                },
                splashColor: Colors.white,
              ),

              // button 2
              IconButton(
                  icon: Icon(Icons.border_all_rounded,
                    color: _currentIndex == 1 ? Color(0xFFFFD45F) : Colors.grey[800],
                  ),
                  onPressed: (){
                    setBottomBarIndex(1);
                  }),

              // button 3
              IconButton(
                  icon: Icon(Icons.shopping_cart,
                    color: _currentIndex == 2 ? Color(0xFFFFD45F) : Colors.grey[800],
                  ),
                  onPressed: (){
                    setBottomBarIndex(2);
                  }),

              // button 4
              IconButton(
                  icon: Icon(Icons.open_in_browser_sharp,
                    color: _currentIndex == 3 ? Color(0xFFFFD45F) : Colors.grey[800],
                  ),
                  onPressed: (){
                    setBottomBarIndex(3);
                  }),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft:Radius.circular(30),bottomRight:Radius.circular(30),),
                color :const Color(0xFFFFD45F),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: const Offset(
                      1.0,
                      1.0,
                    ), //Offset
                    blurRadius: 6.0,
                    spreadRadius: 2.0,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.white,
                    offset: const Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ),],
              ),
              height:180,

              child: Padding(
                padding: const EdgeInsets.only(top:30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          alignment: Alignment.topLeft,
                          icon: const Icon(Icons.menu),
                          onPressed: () {
                            setState(() {
                            });
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:8),
                          child: Text("TABLE -11",
                            style: TextStyle(fontSize: 23,fontWeight: FontWeight.w500),),
                        ),
                        IconButton(
                          alignment:Alignment.topRight,
                          icon: const Icon(Icons.notifications,
                            size: 30,
                          ),
                          onPressed: () {
                            setState(() {
                            });
                          },
                        ),
                        CircleAvatar(
                            backgroundImage: NetworkImage('https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500')
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              OutlineButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context){
                                        return Discount(Ammount: widget.Ammount, Balance: widget.Balance,);
                                      }
                                  );
                                },
                                highlightedBorderColor: Colors.black87,
                                textColor: Colors.black87,
                                // splashColor: isClickedButton? Colors.white : Color(0xFFFFD45F),
                                child: Icon(
                                  Icons.sell_outlined,
                                  size: 24,
                                ),
                                padding: EdgeInsets.all(16),
                                shape: CircleBorder(),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 2),
                                child: Text('Discount',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  ),),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              OutlineButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context){
                                        return SplitPay(Ammount: widget.Ammount,);
                                      }
                                  );
                                },
                                highlightedBorderColor: Colors.black87,
                                textColor: Colors.black87,
                                child: Icon(
                                  Icons.safety_divider,
                                  size: 32,
                                ),
                                padding: EdgeInsets.all(16),
                                shape: CircleBorder(),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 2),
                                child: Text('Split',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  ),),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              OutlineButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context){
                                        return RedeemPoint(Ammount: widget.Ammount, Balance: widget.Ammount,);
                                      }
                                  );
                                },
                                highlightedBorderColor: Colors.black87,
                                textColor: Colors.black87,
                                child: Icon(
                                  Icons.redeem_rounded,
                                  size: 24,
                                ),
                                padding: EdgeInsets.all(16),
                                shape: CircleBorder(),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 2),
                                child: Text('Points',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  ),),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              OutlineButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context){
                                        return Shipping(Ammount: widget.Ammount, Balance: widget.Balance,);
                                      }
                                  );
                                },
                                highlightedBorderColor: Colors.black87,
                                textColor: Colors.black87,
                                child: Icon(
                                  Icons.local_shipping,
                                  size: 24,
                                ),
                                padding: EdgeInsets.all(16),
                                shape: CircleBorder(),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 2),
                                child: Text('Shipping',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  ),),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 170 ,
              width: width,
              child: Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('PAYMENT MODE',
                            style: TextStyle(
                                fontSize: 18,fontWeight: FontWeight.bold)
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:25,right: 12),
                            child: Container(
                              child: GestureDetector(
                                child: Container(
                                  child:Center(child: Text(_payMeth[0],
                                    style: TextStyle(fontWeight:FontWeight.w600,
                                        fontSize: 18,
                                      color: Colors.black
                                    ),
                                  )),
                                  decoration: BoxDecoration(
                                    color: isClicked1 ? Colors.white : Color(0xFFFFD45F),
                                    borderRadius: BorderRadius.circular(35),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        offset: const Offset(
                                          1.0,
                                          1.0,
                                        ), //Offset
                                        blurRadius: 6.0,
                                        spreadRadius: 2.0,
                                      ), //BoxShadow
                                      BoxShadow(
                                        color: Colors.white,
                                        offset: const Offset(0.0, 0.0),
                                        blurRadius: 0.0,
                                        spreadRadius: 0.0,
                                      ),],
                                  ),
                                  height: 45,
                                  width: 100,
                                ),
                                onTap: (){
                                  setState(() {
                                    isClicked1 =! isClicked1;
                                    isClicked2 = true;
                                    isClicked3 = true;
                                    isClicked4 = true;
                                    isClicked5=true;
                                  });
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:15,right: 12),
                            child: Container(
                              child: GestureDetector(
                                child: Container(
                                  child:Center(child: Text(_payMeth[1],style: TextStyle(fontWeight:FontWeight.w600,
                                      fontSize: 18
                                  ),
                                  ),

                                  ),
                                  decoration: BoxDecoration(
                                    color: isClicked2 ? Colors.white : Color(0xFFFFD45F),
                                    borderRadius: BorderRadius.circular(35),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        offset: const Offset(
                                          1.0,
                                          1.0,
                                        ), //Offset
                                        blurRadius: 6.0,
                                        spreadRadius: 2.0,
                                      ), //BoxShadow
                                      BoxShadow(
                                        color: Colors.white,
                                        offset: const Offset(0.0, 0.0),
                                        blurRadius: 0.0,
                                        spreadRadius: 0.0,
                                      ),],
                                  ),
                                  height: 45,
                                  width: 100,
                                ),
                                onTap: (){
                                  setState(() {
                                    isClicked2 =! isClicked2;
                                    isClicked1 = true;
                                    isClicked3 = true;
                                    isClicked4 = true;
                                    isClicked5=true;
                                  });
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:20,right: 8),
                            child: Container(
                              child: GestureDetector(
                                child: Container(
                                  child:Center(child: Text(_payMeth[2],style: TextStyle(fontWeight:FontWeight.w600,
                                      fontSize: 18
                                  ),)),
                                  decoration: BoxDecoration(
                                    color: isClicked3 ? Colors.white : Color(0xFFFFD45F),
                                    borderRadius: BorderRadius.circular(35),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        offset: const Offset(
                                          1.0,
                                          1.0,
                                        ), //Offset
                                        blurRadius: 6.0,
                                        spreadRadius: 2.0,
                                      ), //BoxShadow
                                      BoxShadow(
                                        color: Colors.white,
                                        offset: const Offset(0.0, 0.0),
                                        blurRadius: 0.0,
                                        spreadRadius: 0.0,
                                      ),],
                                  ),
                                  height: 45,
                                  width: 100,
                                ),
                                onTap: (){
                                  setState(() {
                                    isClicked3 =! isClicked3;
                                    isClicked2 = true;
                                    isClicked4 = true;
                                    isClicked1 = true;
                                    isClicked5=true;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:25,right: 15),
                            child: Container(
                              child: GestureDetector(
                                child: Container(
                                  child:Center(child: Text(_payMeth[3],style: TextStyle(fontWeight:FontWeight.w600,
                                      fontSize: 18
                                  ),)),
                                  decoration: BoxDecoration(
                                    color: isClicked4 ? Colors.white : Color(0xFFFFD45F),
                                    borderRadius: BorderRadius.circular(35),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        offset: const Offset(
                                          1.0,
                                          1.0,
                                        ), //Offset
                                        blurRadius: 6.0,
                                        spreadRadius: 2.0,
                                      ), //BoxShadow
                                      BoxShadow(
                                        color: Colors.white,
                                        offset: const Offset(0.0, 0.0),
                                        blurRadius: 0.0,
                                        spreadRadius: 0.0,
                                      ),],
                                  ),
                                  height: 45,
                                  width: 150,
                                ),
                                onTap: (){
                                  setState(() {
                                    isClicked4 =! isClicked4;
                                    isClicked2 = true;
                                    isClicked3= true;
                                    isClicked1 = true;
                                    isClicked5=true;
                                  });
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:15,right: 12),
                            child: Container(
                              child: GestureDetector(
                                child: Container(
                                  child:Center(child: Text(_payMeth[4],style: TextStyle(fontWeight:FontWeight.w600,
                                      fontSize: 18
                                  ),)),
                                  decoration: BoxDecoration(
                                    color: isClicked5 ? Colors.white : Color(0xFFFFD45F),
                                    borderRadius: BorderRadius.circular(35),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        offset: const Offset(
                                          1.0,
                                          1.0,
                                        ), //Offset
                                        blurRadius: 6.0,
                                        spreadRadius: 2.0,
                                      ), //BoxShadow
                                      BoxShadow(
                                        color: Colors.white,
                                        offset: const Offset(0.0, 0.0),
                                        blurRadius: 0.0,
                                        spreadRadius: 0.0,
                                      ),],
                                  ),
                                  height: 45,
                                  width: 100,
                                ),
                                onTap: (){
                                  setState(() {
                                    isClicked5 =! isClicked5;
                                    isClicked2 = true;
                                    isClicked3= true;
                                    isClicked1 = true;
                                    isClicked4=true;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 30,right: 30),
              child: Divider(
                height: 0,
                thickness: 3,
                color: Colors.grey[300],
              ),
            ),
            Container(
              height: 210 ,
              width: width,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('CARD',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            )
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20,right: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 8,left: 8),
                                        child: Text('Payment Amount',
                                          style:TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400
                                          ) ,),
                                      ),
                                      Container(
                                        height: 50,
                                        child: TextField(
                                          enableInteractiveSelection: false,
                                          focusNode: new AlwaysDisabledFocusNode(),
                                          keyboardType:TextInputType.number,
                                          decoration: InputDecoration(
                                            hintText: '\$'+paymentAmount.toStringAsFixed(2),
                                            hintStyle: TextStyle(
                                              fontWeight: FontWeight.bold
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30),
                                              borderSide: BorderSide(color:Colors.brown),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30),
                                              borderSide: BorderSide(color:Colors.brown),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20,right: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 8,left: 8),
                                        child: Text('Tip Amount',
                                          style:TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400
                                          ) ,),
                                      ),
                                      Container(
                                        height: 50,
                                        child: Form(
                                          key: _formKey,
                                          child: TextFormField(
                                            readOnly: isEnabled,
                                            validator: (value) {
                                              if (value == null || value.isEmpty) {
                                                return 'Please enter tip amount';
                                              }
                                              return null;
                                            },
                                            controller: _tipController,
                                            keyboardType:TextInputType.number,
                                            decoration: InputDecoration(
                                              prefix: Text('\$'),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(30),
                                                borderSide: BorderSide(color:Colors.brown),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(30),
                                                borderSide: BorderSide(color:Colors.brown),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20,right: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 8,left: 8),
                                        child: Text('Card Number',
                                          style:TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400
                                          ) ,),
                                      ),
                                      Container(
                                        height: 50,
                                        child: TextFormField(

                                          keyboardType:TextInputType.number,
                                          obscureText: true,
                                          decoration: InputDecoration(

                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30),
                                              borderSide: BorderSide(color:Colors.brown),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30),
                                              borderSide: BorderSide(color:Colors.brown),
                                            ),
                                          ),

                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 8,),
                                      child: Text('Balance Amount',
                                        style:TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,

                                        ) ,),
                                    ),
                                    Container(
                                        child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(35),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey,
                                                  offset: const Offset(
                                                    1.0,
                                                    1.0,
                                                  ), //Offset
                                                  blurRadius: 6.0,
                                                  spreadRadius: 2.0,
                                                ), //BoxShadow
                                                BoxShadow(
                                                  color: Colors.white,
                                                  offset: const Offset(0.0, 0.0),
                                                  blurRadius: 0.0,
                                                  spreadRadius: 0.0,
                                                ),],
                                              color :Color(0xFFFFD45F),
                                            ),
                                            width: 160,
                                            height: 50,
                                            child: Center(
                                                child: Text(
                                                  '\$'+widget.Balance.toStringAsFixed(2),
                                                  textScaleFactor: 1.0,
                                                  style: TextStyle(fontWeight: FontWeight.bold),
                                                ))),

                                      ),
                                  ]
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 30,right: 30),
              child: Divider(
                height: 0,
                thickness: 3,
                color: Colors.grey[300],
              ),
            ),
            _currentIndex == 3 ?  new Container(
              height: 70,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: const Offset(
                      1.0,
                      1.0,
                    ), //Offset
                    blurRadius: 6.0,
                    spreadRadius: 2.0,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.white,
                    offset: const Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ),],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      IconButton(
                        onPressed:(){
                          setState(() {
                          });
                        },
                        iconSize: 25,
                        icon: Icon(Icons.table_chart_outlined,
                          color: Colors.grey[800],
                        ),
                      ),
                      Text('Tables',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),)
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed:(){
                          setState(() {
                          });
                        },
                        iconSize: 29,
                        icon: Icon(Icons.play_arrow_sharp,
                          color: Colors.grey[800],
                        ),
                      ),
                      Text('Resume',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),
                      )
                    ],
                  ),Column(
                    children: [
                      IconButton(
                        onPressed:(){
                            showDialog(
                                context: context,
                                builder: (context){
                                  return VoidBill(Ammount: widget.Ammount);
                                }
                            );
                        },
                        iconSize: 25,
                        icon: Icon(Icons.delete,
                          color: Colors.grey[800],
                        ),
                      ),
                      Text('Void',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),)
                    ],
                  ),Column(
                    children: [
                      IconButton(
                        onPressed:(){
                          setState(() {
                          });
                        },
                        iconSize: 25,
                        icon: Icon(Icons.clear_all_sharp,
                          color: Colors.grey[800],
                        ),
                      ),
                      Text('Clear',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),)
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed:(){
                          setState(() {
                            Navigator.push(context,
                              MaterialPageRoute(builder: (context) => PaymentScreen(Ammount: widget.Ammount, Balance: widget.Balance,)),
                            );
                          });
                        },
                        iconSize: 40,
                        icon: Icon(Icons.keyboard_arrow_down_outlined,
                          color: Colors.grey[800],
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ):Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: this.isEnabled,
                      activeColor: Color(0xFFFFD45F),
                      onChanged: (value) {
                        setState(() {
                          if(_formKey.currentState!.validate())
                          {
                            this.isEnabled = value!;
                            totalAmount();
                          }
                        });
                      },
                    ),
                    Text(
                      'Continue',
                    )
                  ],
                ),
                Container(
                  child: InkWell(
                    onTap:isEnabled ? ()=> print('hello'): null,
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: const Offset(
                                1.0,
                                1.0,
                              ), //Offset
                              blurRadius: 6.0,
                              spreadRadius: 2.0,
                            ), //BoxShadow
                            BoxShadow(
                              color: Colors.white,
                              offset: const Offset(0.0, 0.0),
                              blurRadius: 0.0,
                              spreadRadius: 0.0,
                            ),],
                          color : isEnabled  ?  Color(0xFFFFD45F):Colors.grey,
                        ),
                        margin: EdgeInsets.only(top: 10),
                        width: 200,
                        height: 45,
                        child: Center(
                            child: Text(
                              'Pay:'+widget.Balance.toStringAsFixed(2),
                              textScaleFactor: 1.0,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ))),

                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
Future<Map<String, dynamic>> getData() async {
  String myUrl = "https://pos.sero.app/connector/api/payment-methods";
  http.Response response = await http.get((Uri.parse(myUrl)), headers: {
    'Authorization':
    'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjlhNTYwNGYxZDAxMzU2NTRhY2YyYjE4MmEyOGUwMjA4M2QxOGUxY2Y1ZTY0MzM1MzdmNzc3MzFkMTMzZjNmNWQ5MTU3ZTEwOTQ5NDE3ZmQ3In0.eyJhdWQiOiIzIiwianRpIjoiOWE1NjA0ZjFkMDEzNTY1NGFjZjJiMTgyYTI4ZTAyMDgzZDE4ZTFjZjVlNjQzMzUzN2Y3NzczMWQxMzNmM2Y1ZDkxNTdlMTA5NDk0MTdmZDciLCJpYXQiOjE2MjM2NjAxMzksIm5iZiI6MTYyMzY2MDEzOSwiZXhwIjoxNjU1MTk2MTM5LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.WGLAu9KVi-jSt0q9yUyENDoEQnSLF1o0tezej5YozBFXJVQuEvSykvA9T6nnJghujQ2uU-nxUCRftLBhYzGjsu26YoKZBin70k1cqoYDfIWlVZ-fNkJi1vAXYOk9Pzxz7YFBa6hgz1MyUlDOI1LsSSsJh87hGBzIN6Ib_cYmGoo8KHVEfqbDtCNnZdOq68vjhwf6dwYEJUtxanaocuC-_XHkdM7769JiO48Ot93BqZjmRuVwvK9zE_8bilmhktlgD65ahgKOSS2yQlMdpgpsqP1W5Mfy_SBu32BkqTpAc5v2QWRTVhevES-blsfqdoZ59aw0OzrxyC8PvipyuhGQjs6V7eCrKK0jOei9g4RyhKlQueDXxxrWrqsStIsPzkn-kXA5k2NINIFgr2MlLtypTR76xnncWE5rCqm39K5V2_q3aXDQvCHdl3SVBKDqwNCUKq1CxbJlkF8r1R1mxXxN76TBZbcalO7wUX0F-D1j9oWkwXSZBe7L6vQQqvhC2AsQO2LB4QiByuFi1-J4h05vM3Kab0nmRvVeNYekhNP9HtTGWCH_UDuiDAp23VqUhMTrFygUAPEASU0fnw-rMKhrll_O0wMaBE33ZfItsV0o6pHCQhUjsDKwfmgVynOyYu0rX_huVN_PUBSYQVuCiabUMp8Q5Dv7n8Ky7_yI8XypQK4'
  });
  return json.decode(response.body);
}
class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

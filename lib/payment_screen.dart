import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:paymentscreen/billing_type.dart';
import 'package:paymentscreen/redeem.dart';
import 'package:paymentscreen/split_payment.dart';
import 'package:paymentscreen/void.dart';
import 'package:http/http.dart' as http;

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}
class _PaymentScreenState extends State<PaymentScreen> {
  var size,height,width;
  int _currentIndex = 0;
  bool isClickedCash = true;
  bool isClickedCard = true;
  bool isClickedPayTm = true;
  bool isClickedZomato = true;
  bool isClickedUpi = true;

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
    // print(data['cash']);
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
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFFFFD45F),
        unselectedItemColor: Colors.grey[800],
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() => _currentIndex = value);
        },
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.home_sharp),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.border_all_rounded),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.add_circle_outlined),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.person),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.shopping_cart),
          ),
        ],
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
                        Text("TABLE -11",
                          style: TextStyle(fontSize: 23,fontWeight: FontWeight.w500),),
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
                                        return Discount();
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
                                        return SplitPay();
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
                                        return RedeemPoint();
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
                                        return VoidBill();
                                      }
                                  );
                                },
                                highlightedBorderColor: Colors.black87,
                                textColor: Colors.black87,
                                child: Icon(
                                  Icons.highlight_off_outlined,
                                  size: 24,
                                ),
                                padding: EdgeInsets.all(16),
                                shape: CircleBorder(),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 2),
                                child: Text('Void',
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
                                    color: isClickedCash ? Colors.white : Color(0xFFFFD45F),
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
                                    isClickedCash =! isClickedCash;
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
                                    color: isClickedCard ? Colors.white : Color(0xFFFFD45F),
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
                                    isClickedCard =! isClickedCard;
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
                                    color: isClickedPayTm ? Colors.white : Color(0xFFFFD45F),
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
                                    isClickedPayTm =! isClickedPayTm;
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
                                    color: isClickedZomato ? Colors.white : Color(0xFFFFD45F),
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
                                    isClickedZomato =! isClickedZomato;
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
                                    color: isClickedUpi ? Colors.white : Color(0xFFFFD45F),
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
                                    isClickedUpi =! isClickedUpi;
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
              height: 190 ,
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
                                  child: Container(
                                    height: 70,
                                    child: TextField(
                                      keyboardType:TextInputType.number,
                                      decoration: InputDecoration(
                                        prefix: Text('\$'),
                                        helperText: 'Payment Amount',
                                        helperStyle: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500
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
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20,right: 20),
                                  child: Container(
                                    height: 70,
                                    child: TextFormField(
                                      keyboardType:TextInputType.number,
                                      decoration: InputDecoration(
                                        prefix: Text('\$'),
                                        helperText: 'Tip Amount',
                                        helperStyle: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500
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
                                  child: Container(
                                    height: 70,
                                    child: TextFormField(
                                      keyboardType:TextInputType.number,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        helperText: 'Card Number',
                                        helperStyle: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500
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
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20,right: 20),
                                  child: Container(
                                    height: 70,
                                    child: TextFormField(
                                      keyboardType:TextInputType.number,
                                      decoration: InputDecoration(
                                        prefix: Text('\$'),
                                        helperText: 'Balance Amount',
                                        helperStyle: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500
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
            Container(
              child: GestureDetector(
                onTap: () {
                  setState(() => _currentIndex );
                },
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
                      color : const Color(0xFFFFD45F),
                    ),
                    margin: EdgeInsets.only(top: 10),
                    width: 330,
                    height: 60,
                    child: Center(
                        child: Text(
                          'Pay:\$32.44',
                          textScaleFactor: 3.5,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ))),

              ),
            )
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
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFFfad586),
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

      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft:Radius.circular(30),bottomRight:Radius.circular(30),),
              color :const Color(0xFFfad586),
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
                              onPressed: () {},
                              highlightedBorderColor: Colors.black87,
                              textColor: Colors.black87,
                              child: Icon(
                                Icons.camera_alt,
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
                              onPressed: () {},
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
                              onPressed: () {},
                              highlightedBorderColor: Colors.black87,
                              textColor: Colors.black87,
                              child: Icon(
                                Icons.card_giftcard,
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
                              onPressed: () {},
                              highlightedBorderColor: Colors.black87,
                              textColor: Colors.black87,
                              child: Icon(
                                Icons.animation_outlined,
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
                                child:Center(child: Text('Cash',
                                  style: TextStyle(fontWeight:FontWeight.w600,
                                      fontSize: 18
                                  ),
                                )),
                                decoration: BoxDecoration(
                                  color: isClickedCash ? Colors.white : Color(0xFFfad586),
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
                                child:Center(child: Text('Card',style: TextStyle(fontWeight:FontWeight.w600,
                                    fontSize: 18
                                ),
                                ),

                                ),
                                decoration: BoxDecoration(
                                  color: isClickedCard ? Colors.white : Color(0xFFfad586),
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
                                child:Center(child: Text('PayTM',style: TextStyle(fontWeight:FontWeight.w600,
                                    fontSize: 18
                                ),)),
                                decoration: BoxDecoration(
                                  color: isClickedPayTm ? Colors.white : Color(0xFFfad586),
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
                                child:Center(child: Text('Zomato',style: TextStyle(fontWeight:FontWeight.w600,
                                    fontSize: 18
                                ),)),
                                decoration: BoxDecoration(
                                  color: isClickedZomato ? Colors.white : Color(0xFFfad586),
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
                                child:Center(child: Text('UPI',style: TextStyle(fontWeight:FontWeight.w600,
                                    fontSize: 18
                                ),)),
                                decoration: BoxDecoration(
                                  color: isClickedUpi ? Colors.white : Color(0xFFfad586),
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
                              fontSize: 18,fontWeight: FontWeight.bold )
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
                                padding: const EdgeInsets.only(left: 20,right: 28),
                                child: Container(
                                  height: 40,
                                  child:
                                  // Text('hello'),
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: "Demo Text",
                                      hintStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.red),
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
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Demo Text",
                                    hintStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.red),
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
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20,right: 20),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Demo Text",
                                    hintStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.red),
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
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20,right: 20),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Demo Text",
                                    hintStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.red),
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
                    color : const Color(0xFFfad586),
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
    );
  }
}

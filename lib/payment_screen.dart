import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  var size,height,width;

  int _currentIndex = 0;

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
              ),
              height:160,

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
                        Text("Table -11",
                          style: TextStyle(fontSize: 23,fontWeight: FontWeight.w500),),
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: Icon(Icons.person,color: Colors.black,),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            ),
            Container(
              padding: EdgeInsets.only(left: 30,right: 30),
              child: Divider(
                height: 0,
                thickness: 3,
              ),
            ),
            Container(
              height: 190 ,
              width: width,
            ),
            Container(
              padding: EdgeInsets.only(left: 30,right: 30),
              child: Divider(
                height: 0,
                thickness: 3,
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

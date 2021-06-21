import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _currentIndex = 0;
  var size,height,width;
  int _counter =1;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  void _decrementCounter() {
    setState(() {
      if(_counter>1)
      _counter--;
    });
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
              height:150,
              child:Padding(
              padding: const EdgeInsets.only(top:30),
                child: Row(
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
                    Text("ORDER",
                      style: TextStyle(fontSize: 23,fontWeight: FontWeight.w500),),
                    CircleAvatar(
                        backgroundImage: NetworkImage('https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500')
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25,left: 25,right: 25,bottom: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Table-11',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15
                          ),),
                          Text('John Smith',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15
                            ),),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                            borderRadius: BorderRadius.circular(35),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: const Offset(
                                  0.0,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left:15,right: 10),
                                child: Text('Chicken Burger',
                                style: TextStyle(
                                  fontSize: 17                                ),),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    IconButton(
                                      onPressed:_decrementCounter,
                                      icon:Icon(Icons.remove_circle),
                                      splashRadius: 30,
                                    ),
                                    Text(
                                        '$_counter',
                                        style: TextStyle(
                                            fontSize: 20
                                        )
                                    ),
                                    IconButton(
                                      onPressed:_incrementCounter,
                                      icon:Icon(Icons.add_circle_outlined),
                                      splashRadius: 30,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:15,right: 10),
                                child: Text('\$4.99',
                                  style: TextStyle(
                                      fontSize: 17                                ),),
                              ),
                              IconButton(
                                color: Colors.red,
                                onPressed:_incrementCounter,
                                icon:Icon(Icons.cancel),
                                splashRadius: 30,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(35),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: const Offset(
                                  0.0,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left:15,right:45),
                                child: Text('Coca Cola',
                                  style: TextStyle(
                                      fontSize: 17                                ),),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    IconButton(
                                      onPressed:_decrementCounter,
                                      icon:Icon(Icons.remove_circle),
                                      splashRadius: 30,
                                    ),
                                    Text(
                                        '$_counter',
                                        style: TextStyle(
                                            fontSize: 20
                                        )
                                    ),
                                    IconButton(
                                      onPressed:_incrementCounter,
                                      icon:Icon(Icons.add_circle_outlined),
                                      splashRadius: 30,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15,right: 10),
                                child: Text('\$4.99',
                                  style: TextStyle(
                                      fontSize: 17     ),),
                              ),
                              IconButton(
                                color: Colors.red,
                                onPressed:_incrementCounter,
                                icon:Icon(Icons.cancel),
                                splashRadius: 30,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(35),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: const Offset(
                                  0.0,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left:15,right: 10),
                                child: Text('Double Cheese',
                                  style: TextStyle(
                                      fontSize: 17                                ),),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    IconButton(
                                      onPressed:_decrementCounter,
                                      icon:Icon(Icons.remove_circle),
                                      splashRadius: 30,
                                    ),
                                    Text(
                                        '$_counter',
                                        style: TextStyle(
                                            fontSize: 20
                                        )
                                    ),
                                    IconButton(
                                      onPressed:_incrementCounter,
                                      icon:Icon(Icons.add_circle_outlined),
                                      splashRadius: 30,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:15,right: 10),
                                child: Text('\$4.99',
                                  style: TextStyle(
                                      fontSize: 17                                ),),
                              ),
                              IconButton(
                                color: Colors.red,
                                onPressed:_incrementCounter,
                                icon:Icon(Icons.cancel),
                                splashRadius: 30,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(35),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: const Offset(
                                  0.0,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left:15,right: 10),
                                child: Text('Supreme Pizza',
                                  style: TextStyle(
                                      fontSize: 17                                ),),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    IconButton(
                                      onPressed:_decrementCounter,
                                      icon:Icon(Icons.remove_circle),
                                      splashRadius: 30,
                                    ),
                                    Text(
                                        '$_counter',
                                        style: TextStyle(
                                            fontSize: 20
                                        )
                                    ),
                                    IconButton(
                                      onPressed:_incrementCounter,
                                      icon:Icon(Icons.add_circle_outlined),
                                      splashRadius: 30,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:15,right: 10),
                                child: Text('\$4.99',
                                  style: TextStyle(
                                      fontSize: 17                                ),),
                              ),
                              IconButton(
                                color: Colors.red,
                                onPressed:_incrementCounter,
                                icon:Icon(Icons.cancel),
                                splashRadius: 30,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(35),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: const Offset(
                                  0.0,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left:15,right: 10),
                                child: Text('Supreme Pizza',
                                  style: TextStyle(
                                      fontSize: 17                                ),),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    IconButton(
                                      onPressed:_decrementCounter,
                                      icon:Icon(Icons.remove_circle),
                                      splashRadius: 30,
                                    ),
                                    Text(
                                        '$_counter',
                                        style: TextStyle(
                                            fontSize: 20
                                        )
                                    ),
                                    IconButton(
                                      onPressed:_incrementCounter,
                                      icon:Icon(Icons.add_circle_outlined),
                                      splashRadius: 30,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:15,right: 10),
                                child: Text('\$4.99',
                                  style: TextStyle(
                                      fontSize: 17                                ),),
                              ),
                              IconButton(
                                color: Colors.red,
                                onPressed:_incrementCounter,
                                icon:Icon(Icons.cancel),
                                splashRadius: 30,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(35),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: const Offset(
                                  0.0,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left:15,right: 10),
                                child: Text('Supreme Pizza',
                                  style: TextStyle(
                                      fontSize: 17                                ),),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    IconButton(
                                      onPressed:_decrementCounter,
                                      icon:Icon(Icons.remove_circle),
                                      splashRadius: 30,
                                    ),
                                    Text(
                                        '$_counter',
                                        style: TextStyle(
                                            fontSize: 20
                                        )
                                    ),
                                    IconButton(
                                      onPressed:_incrementCounter,
                                      icon:Icon(Icons.add_circle_outlined),
                                      splashRadius: 30,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:15,right: 10),
                                child: Text('\$4.99',
                                  style: TextStyle(
                                      fontSize: 17                                ),),
                              ),
                              IconButton(
                                color: Colors.red,
                                onPressed:_incrementCounter,
                                icon:Icon(Icons.cancel),
                                splashRadius: 30,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(35),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: const Offset(
                                  0.0,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left:15,right: 10),
                                child: Text('Supreme Pizza',
                                  style: TextStyle(
                                      fontSize: 17                                ),),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    IconButton(
                                      onPressed:_decrementCounter,
                                      icon:Icon(Icons.remove_circle),
                                      splashRadius: 30,
                                    ),
                                    Text(
                                        '$_counter',
                                        style: TextStyle(
                                            fontSize: 20
                                        )
                                    ),
                                    IconButton(
                                      onPressed:_incrementCounter,
                                      icon:Icon(Icons.add_circle_outlined),
                                      splashRadius: 30,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:15,right: 10),
                                child: Text('\$4.99',
                                  style: TextStyle(
                                      fontSize: 17                                ),),
                              ),
                              IconButton(
                                color: Colors.red,
                                onPressed:_incrementCounter,
                                icon:Icon(Icons.cancel),
                                splashRadius: 30,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            // Container(
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.only(topLeft:Radius.circular(30),topRight:Radius.circular(30),),
            //     color :const Color(0xFFfad586),
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.grey,
            //         offset: const Offset(
            //           1.0,
            //           1.0,
            //         ), //Offset
            //         blurRadius: 6.0,
            //         spreadRadius: 2.0,
            //       ), //BoxShadow
            //       BoxShadow(
            //         color: Colors.white,
            //         offset: const Offset(0.0, 0.0),
            //         blurRadius: 0.0,
            //         spreadRadius: 0.0,
            //       ),],
            //   ),
            //   height:120,
            //   child:Padding(
            //     padding: const EdgeInsets.only(top:30),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceAround,
            //       children: [
            //         Text('\$32.44'),
            //         GestureDetector(
            //
            //         )
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),

      ),
    );
  }
}

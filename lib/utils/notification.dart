import 'package:flutter/material.dart';

class OnlineOrder extends StatefulWidget {
  OnlineOrder({Key? key}) : super(key: key);

  @override
  _OnlineOrderState createState() => _OnlineOrderState();
}

class _OnlineOrderState extends State<OnlineOrder> {
  bool isClickedAdd = true;
  bool isClickedCancel = true;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        insetPadding: EdgeInsets.only(left: 20,right: 20,top: 140),
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        elevation: 16,
        child:
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: SingleChildScrollView(
            child: Container(
                height: 430,
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('ONLINE ORDER',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold
                          ),),
                        Padding(
                          padding: const EdgeInsets.only(top: 80,right: 40,left: 40),
                          child: Column(
                            children: [
                              Text('You Have Recieved an Online Order',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 150),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                child: Container(
                                  child:Center(child: Text('Accept',
                                    style: TextStyle(fontWeight:FontWeight.bold,

                                        fontSize: 30
                                    ),
                                  ),

                                  ),
                                  decoration: BoxDecoration(
                                    color: isClickedAdd ? Colors.white : Color(0xFFFFD45F),
                                    borderRadius: BorderRadius.circular(45),

                                  ),
                                  height: 60,
                                  width: 130,
                                ),
                                onTap: (){
                                  setState(() {
                                    isClickedAdd =! isClickedAdd;
                                  });
                                },
                              ),
                              GestureDetector(
                                child: Container(
                                  child:Center(child: Text('Cancel',style: TextStyle(fontWeight:FontWeight.bold,
                                      fontSize: 30
                                  ),
                                  ),

                                  ),
                                  decoration: BoxDecoration(
                                    color: isClickedCancel ? Colors.white : Color(0xFFFFD45F),
                                    borderRadius: BorderRadius.circular(45),
                                  ),
                                  height: 60,
                                  width: 130,
                                ),
                                onTap :(){
                                  Navigator.pop(
                                    context,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )
            ),
          ),
        )
    );
  }
}

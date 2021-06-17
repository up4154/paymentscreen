import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Discount extends StatefulWidget {
  @override
  _DiscountState createState() => _DiscountState();
}

class _DiscountState extends State<Discount> {
  bool isClickedDiscount= true;
  bool isClickedDiscountCash= true;
  bool isClicked1= true;
  bool isClicked2= true;
  bool isClicked3= true;
  bool isClicked4= true;
  bool isClickedAdd= true;
  bool isClickedCancel= true;

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
              children: <Widget>[
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          child: Container(
                            child:Center(child: Text('%',style: TextStyle(fontWeight:FontWeight.bold,
                                fontSize: 18
                            ),
                            ),

                            ),
                            decoration: BoxDecoration(
                              color: isClickedDiscount ? Colors.white : Color(0xFFfad586),
                              borderRadius: BorderRadius.circular(35),

                            ),
                            height: 35,
                            width: 100,
                          ),
                          onTap: (){
                            setState(() {
                              isClickedDiscount =! isClickedDiscount;
                            });
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            child:Center(child: Text('\$',style: TextStyle(fontWeight:FontWeight.bold,
                                fontSize: 18
                            ),
                            ),

                            ),
                            decoration: BoxDecoration(
                              color: isClickedDiscountCash ? Colors.white : Color(0xFFfad586),
                              borderRadius: BorderRadius.circular(35),
                            ),
                            height: 35,
                            width: 100,
                          ),
                          onTap: (){
                            setState(() {
                              isClickedDiscountCash =! isClickedDiscountCash;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15,left: 50),
                  child: Text('Amount',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:4,left: 45,bottom: 20,right: 45),
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextFormField(
                      keyboardType:TextInputType.number,
                      decoration: InputDecoration(
                        prefix: Text('\%'),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      child: Container(
                        child:Center(child: Text('5%',style: TextStyle(fontWeight:FontWeight.bold,
                            fontSize: 18
                        ),
                        ),

                        ),
                        decoration: BoxDecoration(
                          color: isClicked1 ? Colors.white : Color(0xFFfad586),
                          borderRadius: BorderRadius.circular(15),

                        ),
                        height: 90,
                        width: 90,
                      ),
                      onTap: (){
                        setState(() {
                          isClicked1 =! isClicked1;
                        });
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        child:Center(child: Text('10%',style: TextStyle(fontWeight:FontWeight.bold,
                            fontSize: 18
                        ),
                        ),

                        ),
                        decoration: BoxDecoration(
                          color: isClicked2 ? Colors.white : Color(0xFFfad586),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        height: 90,
                        width: 90,
                      ),
                      onTap: (){
                        setState(() {
                          isClicked2 =! isClicked2;
                        });
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        child: Container(
                          child:Center(child: Text('15%',style: TextStyle(fontWeight:FontWeight.bold,
                              fontSize: 18
                          ),
                          ),
                          ),
                          decoration: BoxDecoration(
                            color: isClicked3 ? Colors.white : Color(0xFFfad586),
                            borderRadius: BorderRadius.circular(15),

                          ),
                          height: 90,
                          width: 90,
                        ),
                        onTap: (){
                          setState(() {
                            isClicked3 =! isClicked3;
                          });
                        },
                      ),
                      GestureDetector(
                        child: Container(
                          child:Center(child: Text('20%',style: TextStyle(fontWeight:FontWeight.bold,
                              fontSize: 18
                          ),
                          ),
                          ),
                          decoration: BoxDecoration(
                            color: isClicked4 ? Colors.white : Color(0xFFfad586),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          height: 90,
                          width: 90,
                        ),
                        onTap: (){
                          setState(() {
                            isClicked4 =! isClicked4;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      child: Container(
                        child:Center(child: Text('Add',
                          style: TextStyle(fontWeight:FontWeight.bold,

                            fontSize: 30
                        ),
                        ),

                        ),
                        decoration: BoxDecoration(
                          color: isClickedAdd ? Colors.white : Color(0xFFfad586),
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
                          color: isClickedCancel ? Colors.white : Color(0xFFfad586),
                          borderRadius: BorderRadius.circular(45),
                        ),
                        height: 60,
                        width: 130,
                      ),
                      onTap: (){
                        setState(() {
                          isClickedCancel =! isClickedCancel;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplitPay extends StatefulWidget {
  const SplitPay({Key? key}) : super(key: key);

  @override
  _SplitPayState createState() => _SplitPayState();
}

class _SplitPayState extends State<SplitPay> {
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
                  Padding(
                    padding: const EdgeInsets.only(top: 30,bottom: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text('Payment Amount',
                                  style: TextStyle(
                                      color: Colors.white
                                  ),),
                                Padding(
                                  padding: const EdgeInsets.only(top:4,bottom: 20),
                                  child: Container(
                                    height: 40,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: TextFormField(
                                      keyboardType:TextInputType.number,
                                      decoration: InputDecoration(
                                        prefix: Text('\$'),
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
                              ],
                            ),
                            Column(
                              children: [
                                Text('Payment Mode',
                                  style: TextStyle(
                                      color: Colors.white
                                  ),),
                                Padding(
                                  padding: const EdgeInsets.only(top:4,bottom: 20),
                                  child: Container(
                                    height: 40,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: TextFormField(
                                      keyboardType:TextInputType.number,
                                      decoration: InputDecoration(
                                        prefix: Text('\$'),
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
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text('Payment Amount',
                                  style: TextStyle(
                                      color: Colors.white
                                  ),),
                                Padding(
                                  padding: const EdgeInsets.only(top:4,bottom: 20),
                                  child: Container(
                                    height: 40,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: TextFormField(
                                      keyboardType:TextInputType.number,
                                      decoration: InputDecoration(
                                        prefix: Text('\$'),
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
                              ],
                            ),
                            Column(
                              children: [
                                Text('Payment Amount',
                                  style: TextStyle(
                                      color: Colors.white
                                  ),),
                                Padding(
                                  padding: const EdgeInsets.only(top:4,bottom: 20),
                                  child: Container(
                                    height: 40,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: TextFormField(
                                      keyboardType:TextInputType.number,
                                      decoration: InputDecoration(
                                        prefix: Text('\$'),
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
                              ],
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        )
    );
  }
}

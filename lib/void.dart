import 'package:flutter/material.dart';
import 'package:paymentscreen/payment_screen.dart';

class VoidBill extends StatefulWidget {
  const VoidBill({Key? key}) : super(key: key);

  @override
  _VoidBillState createState() => _VoidBillState();
}

class _VoidBillState extends State<VoidBill> {
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
                        Text('VOID BILL',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold
                          ),),
                        Padding(
                          padding: const EdgeInsets.only(top: 80,right: 30,left: 30),
                          child: Column(
                            children: [
                              Text('Are you Sure You want to Void this Bill.Once Voided it cannot be reversed',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
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
                                  child:Center(child: Text('Yes',
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
                                  child:Center(child: Text('No',style: TextStyle(fontWeight:FontWeight.bold,
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => PaymentScreen()),
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
    );;
  }
}

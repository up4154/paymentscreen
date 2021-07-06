import 'package:flutter/material.dart';
import 'package:paymentscreen/screens/payment_screen.dart';

class RedeemPoint extends StatefulWidget {
  double Ammount=0.0;
  double Balance=0.0;
  RedeemPoint({Key? key,required this.Ammount,required this.Balance}) : super(key: key);

  @override
  _RedeemPointState createState() => _RedeemPointState();
}

class _RedeemPointState extends State<RedeemPoint> {
  bool isClickedAdd = true;
  bool isClickedCancel = true;
  int points=250;
  double redeemAmount =0.0;
  String redeemedAmount ='0';

  final pointscontroller= new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String totalAmounttype(){
    redeemAmount =double.parse(pointscontroller.text);
    double totalAmount = (widget.Balance - redeemAmount);
    setState(() {
      redeemedAmount =totalAmount.toStringAsFixed(2);
    });
    return redeemedAmount;
  }
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
                height: 450,
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('$points POINTS',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold
                          ),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 40,top: 20),
                              child: Text('Redeem Points',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18
                                ),),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15,left: 30,right: 20),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                            ),
                            child: Form(
                              key: _formKey,
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter points to be redeemed';
                                  }
                                  return null;
                                },
                                controller: pointscontroller,
                                keyboardType:TextInputType.number,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(color:Colors.brown),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(color:Colors.brown),
                                    ),
                                    hintText: 'How many Points to Redeem'
                                ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 40,top: 20),
                              child: Text('Coupon Code',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18
                                ),),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15,left: 30,right: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color:Colors.brown),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color:Colors.brown),
                                ),
                                hintText: 'Enter Coupon Code',
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 130),
                          child: Row(
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
                                    color:  Color(0xFFFFD45F),
                                    borderRadius: BorderRadius.circular(45),

                                  ),
                                  height: 60,
                                  width: 130,
                                ),
                                onTap: (){
                                  setState(() {
                                    if(_formKey.currentState!.validate()){
                                    totalAmounttype();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => PaymentScreen(Ammount:widget.Ammount , Balance:double.parse(redeemedAmount) ,)),
                                    );}
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
                                    color: Color(0xFFFFD45F),
                                    borderRadius: BorderRadius.circular(45),
                                  ),
                                  height: 60,
                                  width: 130,
                                ),
                                onTap :(){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => PaymentScreen(Ammount: widget.Ammount, Balance: widget.Balance,)),
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
    );;;
  }
}

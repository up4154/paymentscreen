import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paymentscreen/payment_screen.dart';

class Discount extends StatefulWidget {
   double Ammount=0.0;
   Discount({ Key? key, required this.Ammount}) : super(key: key);

  @override
  _DiscountState createState() => _DiscountState();
}

class _DiscountState extends State<Discount> {
  double discountAmount =0.0;
  bool isClickedDiscount= true;
  bool isClickedDiscountCash= true;
  bool isClicked1= true;
  bool isClicked2= true;
  bool isClicked3= true;
  bool isClicked4= true;
  bool isClickedAdd= true;
  bool isClickedCancel= true;
  String  discountedAmount ='0';

  String dropdownValue ='Percentage %';
  final _amountController = new TextEditingController();
  String totalAmount(){
    discountAmount =double.parse(_amountController.text);
    if(dropdownValue=='Percentage %'){
    double totalAmount = (widget.Ammount - (widget.Ammount*discountAmount/100));
    setState(() {
      discountedAmount = totalAmount.toStringAsFixed(2);
    });}
    else{
      {
        double totalAmount = (widget.Ammount - discountAmount);
        setState(() {
          discountedAmount = totalAmount.toStringAsFixed(2);
        });}
          }
    return discountedAmount;
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
            height: 430,
            child: ListView(
              children: <Widget>[
                Column(
                  children: [
                    Container(
                      height: 40,
                      width: 140,
                      decoration: BoxDecoration(
                        color:Color(0xFFFFD45F) ,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          items: [
                            DropdownMenuItem(
                              value: 'Percentage %',
                              child: Text('Percentage %',
                              ),
                            ),
                            DropdownMenuItem(
                              value: 'Fixed \$',
                              child: Text('Fixed \$',
                                ),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              dropdownValue = value!;
                            });
                          },
                        ),
                      ),
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
                      controller: _amountController,
                      keyboardType:TextInputType.number,
                      decoration: InputDecoration(
                        prefix: dropdownValue =='Percentage %' ? Text('%') : Text('\$'),
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
                        child:Center(child: dropdownValue =='Percentage %' ? Text('5%',style: TextStyle(fontWeight:FontWeight.bold,
                            fontSize: 18
                        ),
                        ):Text('\$5',style: TextStyle(fontWeight:FontWeight.bold,
                            fontSize: 18
                        ),
                        ),

                        ),
                        decoration: BoxDecoration(
                          color: isClicked1 ? Colors.white : Color(0xFFFFD45F),
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
                        child:Center(child: dropdownValue =='Percentage %' ? Text('10%',style: TextStyle(fontWeight:FontWeight.bold,
                            fontSize: 18
                        ),
                        ):Text('\$10',style: TextStyle(fontWeight:FontWeight.bold,
                            fontSize: 18
                        ),
                        ),

                        ),
                        decoration: BoxDecoration(
                          color: isClicked2 ? Colors.white : Color(0xFFFFD45F),
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
                          child:Center(child: dropdownValue =='Percentage %' ? Text('15%',style: TextStyle(fontWeight:FontWeight.bold,
                              fontSize: 18
                          ),
                          ):Text('\$15',style: TextStyle(fontWeight:FontWeight.bold,
                              fontSize: 18
                          ),
                          ),

                          ),
                          decoration: BoxDecoration(
                            color: isClicked3 ? Colors.white : Color(0xFFFFD45F),
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
                          child:Center(child: dropdownValue =='Percentage %' ? Text('20%',style: TextStyle(fontWeight:FontWeight.bold,
                              fontSize: 18
                          ),
                          ):Text('\$20',style: TextStyle(fontWeight:FontWeight.bold,
                              fontSize: 18
                          ),
                          ),

                          ),
                          decoration: BoxDecoration(
                            color: isClicked4 ? Colors.white : Color(0xFFFFD45F),
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
                    InkWell(
                      child: Container(
                        child:Center(child: Text('Add',
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
                          totalAmount();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PaymentScreen(Ammount: double.parse(discountedAmount),)),
                          );
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PaymentScreen(Ammount: widget.Ammount,)),
                        );
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

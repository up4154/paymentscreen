import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paymentscreen/screens/payment_screen.dart';

class Shipping extends StatefulWidget {
  double Ammount=0.0;
  Shipping({Key? key, required this.Ammount}) : super(key: key);

  @override
  _ShippingState createState() => _ShippingState();
}

class _ShippingState extends State<Shipping> {
  double shipAmount=0.0;
  double packageAmount=0.0;
  String dropdownValue1 ='Driver Contact';
  bool isClickedAdd = true;
  bool isClickedCancel = true;
  String shippingCharge ='0';
  final _shipChargeController = new TextEditingController();
  final _packageChargeController = new TextEditingController();
  String totalAmounttype(){
    shipAmount =double.parse(_shipChargeController.text);
    packageAmount =double.parse(_packageChargeController.text);
    double totalAmount = (widget.Ammount + shipAmount+packageAmount);
    setState(() {
      shippingCharge =totalAmount.toStringAsFixed(2);
    });
    return shippingCharge;
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
                height: 500,
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text('ADD SHIPPING',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                                fontWeight: FontWeight.bold
                            ),),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 15,left: 50,bottom: 8),
                              child: Text('Shipping Cost',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),),
                            ),
                          ],
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
                              controller: _shipChargeController,
                              keyboardType:TextInputType.number,
                              decoration: InputDecoration(
                                prefix:  Text('\$'),
                                hintText: 'Enter Shipping Cost here',
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 15,left: 50,bottom: 8),
                              child: Text('Packaging Cost',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),),
                            ),
                          ],
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
                              controller: _packageChargeController,
                              keyboardType:TextInputType.number,
                              decoration: InputDecoration(
                                prefix:  Text('\$'),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color:Colors.brown),
                                ),
                                hintText: 'Enter Packaging Cost here',
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color:Colors.brown),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 15,left: 50,bottom: 8),
                              child: Text('Select Driver',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:4,bottom: 20),
                          child: Container(
                            height: 40,
                            width: 280,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0,bottom: 8.0,
                                  left: 25),
                              child: DropdownButton<String>(
                                value: dropdownValue1,
                                items: [
                                  DropdownMenuItem(
                                    value: 'Driver Contact',
                                    child: Text('Ramesh - 9804048393'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Driver Contact1',
                                    child: Text('Suresh - 9804048393'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Driver Contact2',
                                    child: Text('Manish - 9804048393'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Driver Contact3 ',
                                    child: Text('Hari - 9804048393'),
                                  ),
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    dropdownValue1 = value!;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                child: Container(
                                  child:Center(child: Text('Ship',
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
                                    totalAmounttype();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => PaymentScreen(Ammount: double.parse(shippingCharge),)),
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

import 'package:flutter/material.dart';

class SplitPay extends StatefulWidget {
  double Ammount=0.0;

  SplitPay({Key? key,required this.Ammount}) : super(key: key);

  @override
  _SplitPayState createState() => _SplitPayState();
}

class _SplitPayState extends State<SplitPay> {

  int items=2;
  String dropdownValue1 ='Cash';
  String dropdownValue2 ='Card';
  bool isClickedAdd= true;
  bool isClickedCancel= true;
  bool addRow = false;
  List<String> split =[];
  String temp ='0';
  bool isActive = true;
  @override
  Widget build(BuildContext context) {
    return Dialog(
        insetPadding: EdgeInsets.only(left: 20,right: 20,top: 140),
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        elevation: 16,
        child:SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                  child: ListView.builder(
                    itemCount:items ,
                    padding: const EdgeInsets.all(8),
                    itemBuilder: (BuildContext context, int index) {
                      return  Row(
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
                                    onFieldSubmitted: (text) {
                                      setState(() {
                                        temp=text;
                                      });
                                      print(temp);
                                      print(split);
                                    },
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
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0,bottom: 8.0,
                                        left: 25),
                                    child: DropdownButton<String>(
                                      value: dropdownValue1,
                                      items: [
                                        DropdownMenuItem(
                                          value: 'Cash',
                                          child: Text('Cash'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'Card',
                                          child: Text('Card'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'PayTM',
                                          child: Text('PayTM'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'UPI',
                                          child: Text('UPI'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'Other',
                                          child: Text('Other'),
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
                              )
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              GestureDetector(
                  child: Container(
                    child:Center(child: Text('Add Row',
                      style: TextStyle(fontWeight:FontWeight.bold,
                          fontSize: 20
                      ),
                    ),
                    ),
                    decoration: BoxDecoration(
                      color: isClickedAdd ? Colors.white : Color(0xFFFFD45F),
                      borderRadius: BorderRadius.circular(45),
                    ),
                    height: 60,
                    width: 120,
                  ),
                  onTap:(){
                    setState(() {
                      items++;
                    });
                  }
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  child: InkWell(
                    onTap:isActive ? ()=> print('hello'): null,
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
                          color : isActive ?  Color(0xFFFFD45F):Colors.grey,
                        ),
                        width: 130,
                        height: 40,
                        child: Center(
                            child: Text(
                              'Proceed to Pay',
                              textScaleFactor: 1.0,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ))),

                  ),
                ),
              ),
              // Container(
              //   child: GestureDetector(
              //     onTap: () {
              //       setState((){
              //         print('active');
              //       } );
              //     },
              //     child: Container(
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(35),
              //           boxShadow: [
              //             BoxShadow(
              //               color: Colors.grey,
              //               offset: const Offset(
              //                 1.0,
              //                 1.0,
              //               ), //Offset
              //               blurRadius: 6.0,
              //               spreadRadius: 2.0,
              //             ), //BoxShadow
              //             BoxShadow(
              //               color: Colors.white,
              //               offset: const Offset(0.0, 0.0),
              //               blurRadius: 0.0,
              //               spreadRadius: 0.0,
              //             ),],
              //           color : const Color(0xFFFFD45F),
              //         ),
              //         margin: EdgeInsets.only(top: 10),
              //         width: 330,
              //         height: 60,
              //         child: Center(
              //             child: Text(
              //               'Pay:\$'+widget.Ammount.toStringAsFixed(2),
              //               textScaleFactor: 2.0,
              //               style: TextStyle(fontWeight: FontWeight.bold),
              //             ))),
              //   ),
              // )
            ],
          ),
        )

    );
  }
}

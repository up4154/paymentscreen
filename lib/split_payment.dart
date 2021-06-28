import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplitPay extends StatefulWidget {
  const SplitPay({Key? key}) : super(key: key);

  @override
  _SplitPayState createState() => _SplitPayState();
}

class _SplitPayState extends State<SplitPay> {
  String dropdownValue1 ='Cash';
  String dropdownValue2 ='Card';
  bool isClickedAdd= true;
  bool isClickedCancel= true;
  int _currentIndex = 0;
  bool addRow = false;
  bool isClickedRow = false;
  get index => null;

  void _changed(bool visibility, String field) {
    setState(() {
      if (field == "add") {
        addRow = visibility;
      }
    });
  }

  void _addMulRow(){
    setState(() {
      addRow ? null : _changed(true, "add");
    });
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
                                        value: dropdownValue2,
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
                                            dropdownValue2 = value!;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        addRow ? Row(
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
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 8.0,bottom: 8.0,
                                          left: 25),
                                      child: DropdownButton<String>(
                                        value: dropdownValue2,
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
                                            dropdownValue2 = value!;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ):new Container(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
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
                                    _addMulRow();
                                    print('added');
                                  });
                                }
                              // _addMulRow,
                            )
                          ],
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
                                  color : const Color(0xFFFFD45F),
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
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}


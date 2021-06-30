import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlaceOrder extends StatefulWidget {
  @override
  _PlaceOrderState createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  int _sliding = 0;
  bool hcSlider = false;
  int quantity = 1;
  String _cup;
  String _size;

  _buildToppingItem(
      Icon icon, String toppingName, String topping, int quantityTopping) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              icon,
              Text(
                toppingName,
                style: TextStyle(
                  fontFamily: 'nunito',
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFB5B1AF),
                ),
              ),
            ],
          ),
          SizedBox(width: 20.0),
          Container(
            width: 220,
            decoration: BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(30.0)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (quantityTopping > 0) quantityTopping--;

                        print(quantityTopping);
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFD6AD78),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Icon(
                            CupertinoIcons.minus,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  //SizedBox(width: 20.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      '${quantityTopping.toString()} $topping',
                      style: TextStyle(
                        fontFamily: 'nunito',
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  //SizedBox(width: 20.0),
                  InkWell(
                    onTap: () {
                      setState(() {
                        quantityTopping++;

                        print(quantityTopping);
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFD6AD78),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Icon(
                            CupertinoIcons.plus,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF737373), //Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    child: Center(
                      child: Icon(
                        Icons.close_rounded,
                        size: 30.0,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Temperature',
                  style: TextStyle(
                      fontFamily: 'nunito',
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Text(
                    'Quantity',
                    style: TextStyle(
                        fontFamily: 'nunito',
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Color(0xFFF5F5F5),
                    ),
                    child: CupertinoSlidingSegmentedControl(
                        backgroundColor: Colors.transparent,
                        thumbColor: Color(0xFF453B37),
                        children: {
                          0: Text(
                            'Hot',
                            style: TextStyle(
                                fontFamily: 'nunito',
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: hcSlider
                                    ? Color(0xFFB5B1AF)
                                    : Colors.white),
                          ),
                          1: Text(
                            'Cold',
                            style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color:
                                  hcSlider ? Colors.white : Color(0xFFB5B1AF),
                            ),
                          )
                        },
                        groupValue: _sliding,
                        onValueChanged: (newValue) {
                          setState(() {
                            _sliding = newValue;
                            if (_sliding == 0)
                              hcSlider = false;
                            else
                              hcSlider = true;
                            print(_sliding);
                          });
                        }),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (quantity > 0) quantity--;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFD6AD78),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Icon(
                              CupertinoIcons.minus,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        quantity.toString(),
                        style: TextStyle(
                          fontFamily: 'varela',
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          quantity++;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFD6AD78),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Icon(
                              CupertinoIcons.plus,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 15.0),
            Container(
              height: 0.5,
              color: Color(0xFFC6C4C4),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Select Cup',
                      style: TextStyle(
                          fontFamily: 'nunito',
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    SizedBox(width: 15),
                    Container(
                      height: 40,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: DropdownButton<String>(
                            focusColor: Colors.white,
                            value: _cup,
                            style: TextStyle(color: Colors.white),
                            iconEnabledColor: Colors.grey,
                            icon: Icon(Icons.keyboard_arrow_down),
                            items: <String>[
                              '1',
                              '2',
                              '3',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'varela',
                                      fontSize: 16),
                                ),
                              );
                            }).toList(),
                            hint: Text(
                              "1",
                              style: TextStyle(
                                fontFamily: 'varela',
                                color: Colors.black,
                                fontSize: 16,
                                //    fontWeight: FontWeight.bold,
                              ),
                            ),
                            onChanged: (String value) {
                              setState(() {
                                _cup = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Select Size',
                      style: TextStyle(
                          fontFamily: 'nunito',
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    SizedBox(width: 15),
                    Container(
                      height: 40,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: DropdownButton<String>(
                            focusColor: Colors.white,
                            value: _size,
                            style: TextStyle(color: Colors.white),
                            iconEnabledColor: Colors.grey,
                            icon: Icon(Icons.keyboard_arrow_down),
                            items: <String>[
                              'S',
                              'M',
                              'L',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'varela',
                                      fontSize: 16),
                                ),
                              );
                            }).toList(),
                            hint: Text(
                              "M",
                              style: TextStyle(
                                fontFamily: 'varela',
                                color: Colors.black,
                                fontSize: 16,
                                //    fontWeight: FontWeight.bold,
                              ),
                            ),
                            onChanged: (String value) {
                              setState(() {
                                _size = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15.0),
            Container(
              height: 0.5,
              color: Color(0xFFC6C4C4),
            ),
            SizedBox(height: 10.0),
            Column(
              children: [
                _buildToppingItem(
                    Icon(
                      CupertinoIcons.cube,
                      size: 30,
                    ),
                    'Sugar',
                    'cubes',
                    3),
                _buildToppingItem(
                    Icon(
                      CupertinoIcons.cube,
                      size: 30,
                    ),
                    'Ice',
                    'cubes',
                    5),
                _buildToppingItem(
                    Icon(
                      CupertinoIcons.cube,
                      size: 30,
                    ),
                    'Cream',
                    'cubes',
                    2),
              ],
            ),
            SizedBox(height: 15.0),
            Container(
              height: 0.5,
              color: Color(0xFFC6C4C4),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        fontFamily: 'nunito',
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '\$9.50',
                      style: TextStyle(
                        fontFamily: 'nunito',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFD6AD78),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 250,
                  decoration: BoxDecoration(
                    color: Color(0xFF453B37),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: (Text(
                        'Place Order',
                        style: TextStyle(
                          fontFamily: 'nunito',
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pinto_customer_flutter/constant.dart';

class AddressCard extends StatelessWidget {
  int id = 0;
  String addressName = '';
  String address = '';
  var function;

  AddressCard(
      {required this.id,
        required this.addressName,
        required this.address,
        required this.function});


  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: function,
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        // height: screenHeight*0.15,
        width: screenWidth*0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            addressName,
                            textAlign: TextAlign.left,
                            style: kHeadingTextStyle,
                          ),
                          SizedBox(
                            width: screenWidth*0.7,
                            child: Text(
                              address,
                              textAlign: TextAlign.left,
                              style: kContentTextBlack,
                              maxLines: 4,
                              // softWrap: true,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            const Divider(
              // height: 20,
              thickness: 1,
              color: Colors.black12,
            ),
          ],
        ),
      ),
    );
  }
}

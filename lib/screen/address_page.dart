import 'package:flutter/material.dart';
import 'package:pinto_customer_flutter/component/pinto_button.dart';
import 'package:pinto_customer_flutter/constant.dart';

class AddressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    String defaultAddress = 'ค่าเริ่มต้น';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepGreen,
        title: Text(
          'ที่อยู่ที่บันทึกไว้',
          style: kAppbarTextStyle,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding:
                      EdgeInsets.fromLTRB(30, 20, 30, 20),
                  child: Column(
                    children: [
                      Container(
                        //one adress one container
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'บ้าน [$defaultAddress]',
                              textAlign: TextAlign.left,
                              style: kHeadingTextStyle,
                            ),
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum arcu eget '
                              'nulla elementum, scelerisque elementum ligula porttitor. In ac convallis augue. Etiam '
                              'ac mauris viverra diam ultricies dapibus a a sapien.',
                              textAlign: TextAlign.left,
                              style: kContentTextBlack,
                              maxLines: 3,
                              softWrap: true,
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        height: 20,
                        thickness: 1,
                        color: Colors.black12,
                      ),
                      Container(
                        //one adress one container
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'หอพัก',
                              textAlign: TextAlign.left,
                              style: kHeadingTextStyle,
                            ),
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum arcu eget '
                              'nulla elementum, scelerisque elementum ligula porttitor. In ac convallis augue. Etiam '
                              'ac mauris viverra diam ultricies dapibus a a sapien.',
                              textAlign: TextAlign.left,
                              style: kContentTextBlack,
                              maxLines: 3,
                              softWrap: true,
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        height: 20,
                        thickness: 1,
                        color: Colors.black12,
                      ),
                      Container(
                        //one adress one container
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'หอพัก',
                              textAlign: TextAlign.left,
                              style: kHeadingTextStyle,
                            ),
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum arcu eget '
                              'nulla elementum, scelerisque elementum ligula porttitor. In ac convallis augue. Etiam '
                              'ac mauris viverra diam ultricies dapibus a a sapien.',
                              textAlign: TextAlign.left,
                              style: kContentTextBlack,
                              maxLines: 3,
                              softWrap: true,
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        height: 20,
                        thickness: 1,
                        color: Colors.black12,
                      ),
                      Container(
                        //one adress one container
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'หอพัก',
                              textAlign: TextAlign.left,
                              style: kHeadingTextStyle,
                            ),
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum arcu eget '
                              'nulla elementum, scelerisque elementum ligula porttitor. In ac convallis augue. Etiam '
                              'ac mauris viverra diam ultricies dapibus a a sapien.',
                              textAlign: TextAlign.left,
                              style: kContentTextBlack,
                              maxLines: 3,
                              softWrap: true,
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        height: 20,
                        thickness: 1,
                        color: Colors.black12,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: PintoButton(
                  width: 200,
                  label: 'เพิ่มที่อยูใหม่่',
                  buttonColor: lightGreen,function: () {
                Navigator.pushNamed(context, '/address/create');
              },
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

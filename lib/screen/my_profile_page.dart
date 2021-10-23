// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:pinto_customer_flutter/constant.dart';
import 'package:pinto_customer_flutter/component/side_menu.dart';
import 'package:pinto_customer_flutter/service/auth.dart';

class MyProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: SideMenu.defaultMenu('โปรไฟล์ของฉัน'),
      appBar: AppBar(
        backgroundColor: deepGreen,
        title: Text(
          'โปรไฟล์ของฉัน',
          style: kAppbarTextStyle,
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(0.1 * screenWidth, 0.02 * screenHeight, 0.1 * screenWidth, 0.02 * screenHeight),
          // decoration: BoxDecoration(color: deepWhite),
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 10),
                      width: 90,
                      height: 90,
                      child: Image.asset('assets/images/Icons.jpg'),
                    ),
                    Container(
                      width: 0.48 * screenWidth,
                      child: Text(
                        'firstname \nlastname \ncustomer',
                        // '${Auth.user.firstname} \n${Auth.user.lastname} \n${Auth.user.role}',
                        textAlign: TextAlign.left,
                        style: kHeadingTextStyle,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        print('${Auth.user.firstname} เข้าสู่หน้าแก้ไขโปรไฟล์ของฉัน');
                        Navigator.defaultRouteName;
                        //TODO:My edit profile page
                      },
                      icon: Icon(Icons.edit),
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 20,
                thickness: 1,
                color: Colors.black12,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        '/address',
                      );
                    },
                    child: Container(
                      width: 0.8 * screenWidth,
                      padding: EdgeInsets.only(top: 5),
                      child: Row(
                        children: [
                          Icon(Icons.account_box_outlined),
                          Container(
                            child: Text(
                              ' ที่อยู่ที่บันทึกไว้',
                              textAlign: TextAlign.left,
                              style: kContentTextBlack,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const Divider(
                height: 20,
                thickness: 1,
                color: Colors.black12,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        '/inorder/history',
                      );
                    },
                    child: Container(
                      width: 0.8 * screenWidth,
                      padding: EdgeInsets.only(top: 5),
                      child: Row(
                        children: [
                          Icon(Icons.history),
                          Container(
                            child: Text(
                              ' ประวัติการซื้อ',
                              textAlign: TextAlign.left,
                              style: kContentTextBlack,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const Divider(
                height: 20,
                thickness: 1,
                color: Colors.black12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                            context,
                            '/inorder/pre-ordering',
                          );
                        },
                        child: Container(
                          width: 0.2 * screenWidth,
                          padding: EdgeInsets.only(top: 5),
                          child: Column(
                            children: [
                              Icon(Icons.timelapse),
                              Container(
                                padding: EdgeInsets.only(top: 5),
                                child: Text(
                                  'ที่กำลังจอง',
                                  textAlign: TextAlign.left,
                                  style: kContentTextBlack,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                            context,
                            '/inorder/paying',
                          );
                        },
                        child: Container(
                          width: 0.2 * screenWidth,
                          padding: EdgeInsets.only(top: 5),
                          child: Column(
                            children: [
                              Icon(Icons.account_balance_wallet_outlined),
                              Container(
                                padding: EdgeInsets.only(top: 5),
                                child: Text(
                                  'ที่ต้องชำระ',
                                  textAlign: TextAlign.left,
                                  style: kContentTextBlack,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                            context,
                            '/inorder/sending',
                          );
                        },
                        child: Container(
                          width: 0.2 * screenWidth,
                          padding: EdgeInsets.only(top: 5),
                          child: Column(
                            children: [
                              Icon(Icons.backpack_outlined),
                              Container(
                                padding: EdgeInsets.only(top: 5),
                                child: Text(
                                  'ที่ต้องจัดส่ง',
                                  textAlign: TextAlign.left,
                                  style: kContentTextBlack,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                            context,
                            '/inorder/receiving',
                          );
                        },
                        child: Container(
                          width: 0.2 * screenWidth,
                          padding: EdgeInsets.only(top: 5),
                          child: Column(
                            children: [
                              Icon(Icons.directions_car_outlined),
                              Container(
                                padding: EdgeInsets.only(top: 5),
                                child: Text(
                                  'ที่ต้องได้รับ',
                                  textAlign: TextAlign.left,
                                  style: kContentTextBlack,
                                ),
                              )
                            ],
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
      ),
    );
  }
}

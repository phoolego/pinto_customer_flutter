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
        title: const Text(
          'โปรไฟล์ของฉัน',
          style: kAppbarTextStyle,
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(0.05 * screenWidth, 0.02 * screenHeight, 0.05 * screenWidth, 0.02 * screenHeight),
          // decoration: BoxDecoration(color: deepWhite),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(right: 10),
                      width: 90,
                      height: 90,
                      child: Image.asset('assets/images/Icons.jpg'),
                    ),
                    Container(

                      child: Text(
                        '${Auth.user.firstname} \n${Auth.user.lastname}',
                        textAlign: TextAlign.left,
                        style: kHeadingTextStyle,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/profile/edit');
                      },
                      icon: Icon(Icons.edit),
                      alignment: Alignment.topCenter,
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
                      Navigator.pushNamed(
                        context,
                        '/address',
                      );
                    },
                    child: Container(
                      width: 0.9 * screenWidth,
                      padding: const EdgeInsets.only(top: 5),
                      child: Row(
                        children: [
                          const Icon(Icons.account_box_outlined),
                          Container(
                            child: const Text(
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
                      Navigator.pushNamed(
                        context,
                        '/inorder/history',
                      );
                    },
                    child: Container(
                      width: 0.9 * screenWidth,
                      padding: const EdgeInsets.only(top: 5),
                      child: Row(
                        children: [
                          Icon(Icons.history),
                          Container(
                            child: const Text(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/inorder/pre-ordering',
                          );
                        },
                        child: Container(
                          width: 0.225 * screenWidth,
                          padding: const EdgeInsets.only(top: 5),
                          child: Column(
                            children: [
                              const Icon(Icons.timelapse),
                              Container(
                                padding: EdgeInsets.only(top: 5),
                                child: const Text(
                                  'ที่กำลังจอง',
                                  textAlign: TextAlign.center,
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
                          Navigator.pushNamed(
                            context,
                            '/inorder/paying',
                          );
                        },
                        child: Container(
                          width: 0.225 * screenWidth,
                          padding: EdgeInsets.only(top: 5),
                          child: Column(
                            children: [
                              const Icon(Icons.account_balance_wallet_outlined),
                              Container(
                                padding: const EdgeInsets.only(top: 5),
                                child: const Text(
                                  'ที่ต้องชำระ',
                                  textAlign: TextAlign.center,
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
                          Navigator.pushNamed(
                            context,
                            '/inorder/confirming',
                          );
                        },
                        child: Container(
                          width: 0.225 * screenWidth,
                          padding: const EdgeInsets.only(top: 5),
                          child: Column(
                            children: [
                              const Icon(Icons.backpack_outlined),
                              Container(
                                padding: EdgeInsets.only(top: 5),
                                child: const Text(
                                  'รอการยืนยัน',
                                  textAlign: TextAlign.center,
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
                          Navigator.pushNamed(
                            context,
                            '/inorder/sending',
                          );
                        },
                        child: Container(
                          width: 0.225 * screenWidth,
                          padding: EdgeInsets.only(top: 5),
                          child: Column(
                            children: [
                              const Icon(Icons.directions_car_outlined),
                              Container(
                                padding: const EdgeInsets.only(top: 5),
                                child: const Text(
                                  'ที่ต้องได้รับ',
                                  textAlign: TextAlign.center,
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

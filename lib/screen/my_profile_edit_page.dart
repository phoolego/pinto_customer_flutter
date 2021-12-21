import 'package:flutter/material.dart';
import 'package:pinto_customer_flutter/component/pinto_button.dart';
import 'package:pinto_customer_flutter/service/auth.dart';

import '../constant.dart';

class MyProfileEditPage extends StatefulWidget {
  @override
  State<MyProfileEditPage> createState() => _MyProfileEditPageState();
}

class _MyProfileEditPageState extends State<MyProfileEditPage> {
  final _formKey = GlobalKey<FormState>();
  String _errorMessage = '';

  String firstname = Auth.user.firstname;
  String lastname = Auth.user.lastname;
  String address = Auth.user.address;
  String contact = Auth.user.contact;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepGreen,
        title: const Text(
          'แก้ไขโปรไฟล์',
          style: kAppbarTextStyle,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
              top: 0.01 * screenHeight, bottom: 0.01 * screenHeight),
          width: screenWidth,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          top: 0.01 * screenHeight,
                          bottom: 0.01 * screenHeight),
                      width: 0.8 * screenWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('ชื่อ', style: kHeadingTextStyle),
                          TextFormField(
                            initialValue: Auth.user.firstname,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding:
                              EdgeInsets.symmetric(horizontal: 10),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'กรุณากรอกชื่อ';
                              } else {
                                return null;
                              }
                            },
                            onChanged: (value) {
                              firstname = value;
                            },
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: 0.01 * screenHeight,
                          bottom: 0.01 * screenHeight),
                      width: 0.8 * screenWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('นามสกุล', style: kHeadingTextStyle),
                          TextFormField(
                            initialValue: Auth.user.lastname,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding:
                              EdgeInsets.symmetric(horizontal: 10),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'กรุณากรอกนามสกุล';
                              } else {
                                return null;
                              }
                            },
                            onChanged: (value) {
                              lastname = value;
                            },
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: 0.01 * screenHeight,
                          bottom: 0.01 * screenHeight),
                      width: 0.8 * screenWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('ที่อยู่', style: kHeadingTextStyle),
                          TextFormField(
                            minLines: 3,
                            maxLines: 5,
                            initialValue: Auth.user.address,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                            validator: (String? val) {
                              if (val!.isEmpty) {
                                return 'กรุณากรอกที่อยู่';
                              } else {
                                return null;
                              }
                            },
                            onChanged: (val) {
                              address = val;
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: 0.01 * screenHeight,
                          bottom: 0.01 * screenHeight),
                      width: 0.8 * screenWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('เบอร์โทรศัพท์ที่ติดต่อได้',
                              style: kHeadingTextStyle),
                          TextFormField(
                            initialValue: Auth.user.contact,
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                            validator: (String? val) {
                              if (val!.isEmpty) {
                                return 'กรุณากรอกเบอร์โทรศัพท์ที่ติดต่อได้';
                              } else {
                                return null;
                              }
                            },
                            onChanged: (val) {
                              contact = val;
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 0.01 * screenHeight),
                      child: Column(
                        children: [
                          PintoButton(
                            width: 200,
                            label: 'ยืนยันการแก้ไข',
                            function: () async {
                              if (_formKey.currentState!.validate()) {
                                try {
                                  // await Auth.updateFarmer(farmName, maxArea,
                                  //     firstname, lastname, address, contact);
                                  // Navigator.pop(context);
                                  // Navigator.pushReplacementNamed(
                                  //     context, '/profile');
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                          title: const Text('คำเตือน',
                                              style: kHeadingTextStyle),
                                          content: const Text(
                                              'กด "ตกลง" เพื่อทำรายการต่อ',
                                              style: kHeadingTextStyle),
                                          actions: <Widget>[
                                            InkWell(
                                                child: const Text(
                                                  'ยกเลิก',
                                                  style: kHeadingTextStyle,
                                                ),
                                                onTap: () {
                                                  Navigator.pop(context);
                                                }),
                                            InkWell(
                                              child: const Text(
                                                'ตกลง',
                                                style: kHeadingTextStyle,
                                              ),
                                              onTap: () async {
                                                await Auth.updateUser(
                                                    firstname, lastname, address, contact);
                                                Navigator.pop(context);
                                                Navigator.pushReplacementNamed(
                                                    context, '/profile');
                                              },
                                            )
                                          ],
                                        ),
                                  );
                                } catch (err) {
                                  setState(() {
                                    _errorMessage = err.toString();
                                  });
                                }
                              }
                            },
                            buttonColor: deepGreen,
                            textStyle: buttonWhiteTextStyle,
                          ),
                          Text(
                            _errorMessage,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}

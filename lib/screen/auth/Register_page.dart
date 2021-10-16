import 'package:flutter/material.dart';
import 'package:pinto_customer_flutter/component/pinto_button.dart';
import 'package:pinto_customer_flutter/constant.dart';
import 'package:pinto_customer_flutter/component/pinto_text_field.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepGreen,
        title: Text(
          'ลงทะเบียนลูกค้า',
          style: kAppbarTextStyle,
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child:
                Text('ลงทะเบียน',style: kLoginHeadingTextStyle,),
              ),
              PintoTextFieldWithoutHintText(
                label: 'อีเมล',
                validator: (String? val) {},
                onChanged: (val) {},
              ),
              PintoTextFieldWithoutHintText(
                label: 'ชื่อจริง',
                validator: (String? val) {},
                onChanged: (val) {},
              ),
              PintoTextFieldWithoutHintText(
                label: 'นามสกุล',
                validator: (String? val) {},
                onChanged: (val) {},
              ),
              PintoTextFieldWithoutHintText(
                label: 'รหัสผ่าน',
                validator: (String? val) {},
                onChanged: (val) {},
              ),
              PintoTextFieldWithoutHintText(
                label: 'ยืนยันรหัสผ่าน',
                validator: (String? val) {},
                onChanged: (val) {},
              ),
              Container(
                alignment: Alignment.center,
                child: PintoButton(
                  label: 'ลงทะเบียน',function: (){
                    Navigator.pushNamed(context, '/login');
                    print('Register');
                },buttonColor: deepGreen,
                ),
              ),
              SizedBox(height: screenHeight * 0.05,),
            ],
          ),
      ),
    );
  }
}

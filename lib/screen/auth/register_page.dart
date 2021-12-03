import 'package:flutter/material.dart';
import 'package:pinto_customer_flutter/component/pinto_button.dart';
import 'package:pinto_customer_flutter/constant.dart';
import 'package:pinto_customer_flutter/component/pinto_text_field.dart';
import 'package:pinto_customer_flutter/service/auth.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _firstname = '';
  String _lastname = '';
  String _email = '';
  String _password = '';
  String _address = '';
  String _contact = '';
  String _errorMessage = '';
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepGreen,
        title: const Text(
          'ลงทะเบียนลูกค้า',
          style: kAppbarTextStyle,
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child:
                const Text('ลงทะเบียน',style: kLoginHeadingTextStyle,),
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
                    try{
                      Auth.register(_firstname,_lastname, _email, _password, _address, _contact);
                      Navigator.pushNamed(context, '/');
                    }catch(err){
                      setState(() {
                        _errorMessage = err.toString();
                      });
                    }
                },buttonColor: deepGreen,
                ),
              ),
              Text(_errorMessage,style: const TextStyle(color: Colors.red),),
              SizedBox(height: screenHeight * 0.05,),
            ],
          ),
      ),
    );
  }
}

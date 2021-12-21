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
  final _formKey = GlobalKey<FormState>();
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
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  child:
                  const Text('ลงทะเบียน',style: kLoginHeadingTextStyle,),
                ),
                PintoTextFieldWithoutHintText(
                  label: 'อีเมล',
                  validator: (String? val) {
                    if (val!.isEmpty) {
                      return 'กรุณากรอกอีเมล';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (val) {
                    _email = val;
                  },
                ),
                PintoTextFieldWithoutHintText(
                  label: 'รหัสผ่าน',
                  isPassword: true,
                  validator: (String? val) {
                    if (val!.isEmpty) {
                      return 'กรุณากรอกรหัสผ่าน';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (val) {
                    _password = val;
                  },
                ),
                PintoTextFieldWithoutHintText(
                  label: 'ยืนยันรหัสผ่าน',
                  isPassword: true,
                  validator: (String? val) {
                    if (val!.isEmpty) {
                      return 'กรุณากรอกรหัสผ่าน';
                    } else if(val!=_password){
                      return 'รหัสผ่านไม่ตรงกัน';
                    }else {
                      return null;
                    }
                  },
                  onChanged: (val) {
                  },
                ),
                PintoTextFieldWithoutHintText(
                  label: 'ชื่อจริง',
                  validator: (String? val) {
                    if (val!.isEmpty) {
                      return 'กรุณากรอกชื่อ';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (val) {
                    _firstname = val;
                  },
                ),
                PintoTextFieldWithoutHintText(
                  label: 'นามสกุล',
                  validator: (String? val) {
                    if (val!.isEmpty) {
                      return 'กรุณากรอกนามสกุล';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (val) {
                    _lastname = val;
                  },
                ),
                PintoTextFieldWithoutHintText(
                  label: 'ที่อยู่',
                  validator: (String? val) {
                    if (val!.isEmpty) {
                      return 'กรุณากรอกที่อยู่';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (val) {
                    _address = val;
                  },
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'เบอร์โทรศัพท์ที่ติดต่อได้',
                          style: kContentTextBlack,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.zero,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.phone,
                          validator: (String? val) {
                            if (val!.isEmpty) {
                              return 'กรุณากรอกเบอร์โทรศัพท์ที่ติดต่อได้';
                            } else {
                              return null;
                            }
                          },
                          onChanged: (val) {
                            _contact = val;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: PintoButton(
                    label: 'ลงทะเบียน',function: ()async{
                      if(_formKey.currentState!.validate()){
                        try{
                          await Auth.register(_firstname,_lastname, _email, _password, _address, _contact);
                          Navigator.pushNamed(context, '/');
                        }catch(err){
                          setState(() {
                            _errorMessage = err.toString();
                          });
                        }
                      }
                  },buttonColor: deepGreen,
                  ),
                ),
                Text(_errorMessage,style: const TextStyle(color: Colors.red),),
                SizedBox(height: screenHeight * 0.05,),
              ],
            ),
          ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pinto_customer_flutter/component/pinto_button.dart';
import 'package:pinto_customer_flutter/constant.dart';
import 'package:pinto_customer_flutter/component/pinto_text_field.dart';
import 'package:pinto_customer_flutter/service/user_address_service.dart';

class AddressCreatePage extends StatefulWidget {
  @override
  _AddressCreatePageState createState() => _AddressCreatePageState();
}

class _AddressCreatePageState extends State<AddressCreatePage> {
  final _formKey = GlobalKey<FormState>();
  String address = '';
  String addressName = '';
  String _errorMessage = '';
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepGreen,
        title: const Text(
          'เพิ่มที่อยู่',
          style: kAppbarTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.fromLTRB(2,10,2,20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                PintoTextFieldWithoutHintText(
                  label: 'ชื่อที่ต้องการบันทึก',
                  validator: (String? val) {
                    if (val!.isEmpty) {
                      return 'กรุณากรอกชื่อที่ต้องการบันทึก';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (val) {
                    addressName = val;
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
                    address = val;
                  },
                ),
                Container(
                  alignment: Alignment.center,
                  child: PintoButton(
                    label: 'ลงทะเบียน',function: ()async{
                    if(_formKey.currentState!.validate()){
                      try{
                        await UserAddressService.insertUserAddress(addressName, address);
                        Navigator.popUntil(context, ModalRoute.withName('/profile'));
                        Navigator.pushNamed(context, '/address');
                      }catch(err){
                        setState(() {
                          _errorMessage = err.toString();
                        });
                      }
                    }
                  },buttonColor: deepGreen,
                  ),
                ),
                Text(_errorMessage,style: const TextStyle(color: Colors.red),textAlign: TextAlign.center,),
                SizedBox(height: screenHeight * 0.05,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pinto_customer_flutter/component/pinto_button.dart';
import 'package:pinto_customer_flutter/constant.dart';
import 'package:pinto_customer_flutter/component/pinto_text_field.dart';
import 'package:pinto_customer_flutter/model/user_address.dart';
import 'package:pinto_customer_flutter/service/user_address_service.dart';

class AddressEditPage extends StatefulWidget {
  UserAddress userAddress;
  AddressEditPage({Key? key, required this.userAddress}) : super(key: key);

  @override
  _AddressEditPageState createState() => _AddressEditPageState();
}

class _AddressEditPageState extends State<AddressEditPage> {
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
        title: Text(
          'แก้ไขที่อยู่${widget.userAddress.inUse?' (ใช้งาน)':''}',
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
                  initValue: widget.userAddress.addressName,
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
                  initValue: widget.userAddress.address,
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
                    label: 'บันทึกการแก้ไข',function: ()async{
                    if(_formKey.currentState!.validate()){
                      try{
                        await UserAddressService.updateUserAddress(widget.userAddress.id,addressName, address);
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
                SizedBox(height: screenHeight * 0.01,),
                widget.userAddress.inUse?SizedBox():
                PintoButton(label: 'ใช้เป็นที่อยู่จัดส่ง',
                  buttonColor: lightGreen,
                  textStyle: buttonWhiteTextStyle,
                  function: () async {
                    if(_formKey.currentState!.validate()){
                      try{
                        await UserAddressService.updateUserAddress(widget.userAddress.id,addressName, address);
                        await UserAddressService.setDefaultAddress(widget.userAddress.id);
                        Navigator.popUntil(context, ModalRoute.withName('/profile'));
                        Navigator.pushNamed(context, '/address');
                      }catch(err){
                        setState(() {
                          _errorMessage = err.toString();
                        });
                      }
                    }
                  },
                ),
                SizedBox(height: screenHeight * 0.01,),
                widget.userAddress.inUse?SizedBox():
                PintoButton(label: 'ลบที่อยู่นี้',
                  buttonColor: notYetRed,
                  textStyle: buttonWhiteTextStyle,
                  function: () async {
                    await UserAddressService.deleteAddress(widget.userAddress.id);
                    Navigator.popUntil(context, ModalRoute.withName('/profile'));
                    Navigator.pushNamed(context, '/address');
                  },
                ),
                SizedBox(height: screenHeight * 0.01,),
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

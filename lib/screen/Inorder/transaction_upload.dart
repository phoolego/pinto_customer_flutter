import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pinto_customer_flutter/component/pinto_button.dart';
import 'package:pinto_customer_flutter/constant.dart';
import 'package:pinto_customer_flutter/service/order_service.dart';

class TransactionUpload extends StatefulWidget {
  int orderId;
  TransactionUpload({Key? key,required this.orderId}) : super(key: key);

  @override
  _TransactionState createState() => _TransactionState();
}

class _TransactionState extends State<TransactionUpload> {
  File? pic;
  final picker = ImagePicker();
  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(
        source: ImageSource.camera, maxHeight: 1024, maxWidth: 1024);
    setState(() {
      pic = File(pickedFile!.path);
    });
  }

  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(
        source: ImageSource.gallery, maxHeight: 1024, maxWidth: 1024);
    setState(() {
      pic = File(pickedFile!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepGreen,
        title: const Text(
          'เพิ่มหลักฐานการชำระเงิน',
          style: kAppbarTextStyle,
          textAlign: TextAlign.left,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth*0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              pic != null ? Container(
                width: screenWidth*0.8,
                height: screenWidth*1.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: FileImage(pic!),
                  ),
                ),
              ):
              Container(
                  width: screenWidth*0.8,
                  height: screenWidth*1.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: deepGrayBackground
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('เพิ่มหลักฐานการชำระเงิน'),
                      SizedBox(
                        height: screenHeight * 0.01,
                      ),
                      PintoButton(
                        label: '+ คลังรูปภาพ',
                        function: getImageFromGallery,
                        buttonColor: mediumGrayBackground,
                        textStyle: buttonBlackTextStyle,
                        // width: screenWidth * 0.25,
                      ),
                      SizedBox(
                        height: screenHeight * 0.01,
                      ),
                      PintoButton(
                        label: '+ ถ่ายภาพ',
                        function: getImageFromCamera,
                        buttonColor: mediumGrayBackground,
                        textStyle: buttonBlackTextStyle,
                        // width: screenWidth * 0.25,
                      ),
                    ],
                  )
              ),
              SizedBox(height: screenHeight * 0.05),
              PintoButton(
                label: 'ยืนยัน',
                buttonColor: deepGreen,
                function: () async {
                  try{
                    await OrderService.payOrder(widget.orderId, pic);
                    Navigator.popUntil(context, ModalRoute.withName('/profile'));
                  }catch(err){
                    print(err.toString());
                  }
                })
            ],
          ),
        ),
      )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pinto_customer_flutter/component/address_card.dart';
import 'package:pinto_customer_flutter/component/pinto_button.dart';
import 'package:pinto_customer_flutter/constant.dart';
import 'package:pinto_customer_flutter/model/user_address.dart';
import 'package:pinto_customer_flutter/service/user_address_service.dart';

class AddressPage extends StatefulWidget {
  // UserAddress userAddress;
  AddressPage({Key? key}) : super(key: key);
  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    String defaultAddress = 'ค่าเริ่มต้น';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepGreen,
        title: const Text(
          'ที่อยู่ที่บันทึกไว้',
          style: kAppbarTextStyle,
        ),
      ),
      body: SafeArea(
        child: FutureBuilder<List<UserAddress>>(
          future: UserAddressService.getUserAddress(),
          builder: (BuildContext context, AsyncSnapshot<List<UserAddress>> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            else {
              List<UserAddress> listUserAddress = snapshot.data!;
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: listUserAddress.length,
                      itemBuilder: (context,index)=>
                        Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                          child: AddressCard(
                            id: listUserAddress[index].id,
                            addressName: listUserAddress[index].addressName,
                            address: listUserAddress[index].address,
                            inUse: listUserAddress[index].inUse,
                            function: (){

                            },
                        )
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Center(
                    child: PintoButton(
                      width: 200,
                      label: 'เพิ่มที่อยูใหม่่',
                      buttonColor: lightGreen, function: () {
                      Navigator.pushNamed(context, '/address/create');
                    },
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
                ],
              );
            }
          }
        )
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pinto_customer_flutter/constant.dart';
import 'package:pinto_customer_flutter/component/side_menu.dart';
import 'package:pinto_customer_flutter/component/in_market_product_card.dart';
import 'package:pinto_customer_flutter/screen/product_detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSearch = false;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        drawer: SideMenu.withoutAny(),
        appBar: AppBar(
          backgroundColor: deepGreen,
          title: !isSearch
              ? Text(
                  'ปิ่นโต บางกะเจ้า',
                  textAlign: TextAlign.left,
                  style: kAppbarTextStyle,
                )
              : Container(
                  padding: EdgeInsets.only(bottom: 10),
                  child: TextField(
                    style: kContentTextWhite,
                    decoration: InputDecoration(
                      hintText: 'ค้นหา',
                      hintStyle: kContentTextWhite,
                      //fillColor: Colors.white
                    ),
                  ),
                ),
          actions: [
            !isSearch
                ? IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      setState(() {
                        this.isSearch = !this.isSearch;
                      });
                    },
                  )
                : IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      setState(() {
                        this.isSearch = !this.isSearch;
                      });
                    },
                  )
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(screenWidth * 0.03),
              child: Column(
                children: [
                  InmarketProductCard(
                    productId: 1,
                    productName: 'ผักกาดขาว',
                    statusNumber: 1,
                    farmName: 'แดง นักสู้',
                    functionBasket: () {},
                    functionCard: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetailPage(
                                productId: 1,
                                productName: 'ผักกาดขาว',
                                farmName: 'แดง นักสู้',
                                status: 1,
                                price: 20.0,
                                unit: 'กก',
                              )
                          )
                      );
                    },
                    functionOrdering: () {},
                  ),
                  InmarketProductCard(
                    productId: 2,
                    productName: 'เห็ด',
                    statusNumber: 2,
                    farmName: 'เขียว นักซิ่ง',
                    functionBasket: () {},
                    functionCard: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetailPage(
                                productId: 1,
                                productName: 'เห็ด',
                                farmName: 'เขียว นักซิ่ง',
                                status: 2,
                                price: 10.0,
                                unit: 'กก',
                              )
                          )
                      );
                    },
                    functionOrdering: () {},
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

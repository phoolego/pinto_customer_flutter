import 'package:flutter/material.dart';
import 'package:pinto_customer_flutter/constant.dart';
import 'package:pinto_customer_flutter/component/side_menu.dart';
import 'package:pinto_customer_flutter/component/in_market_product_card.dart';
import 'package:pinto_customer_flutter/model/product_preview.dart';
import 'package:pinto_customer_flutter/screen/product_detail_page.dart';
import 'package:pinto_customer_flutter/service/product_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSearch = false;
  String searchKeyword = '';

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        drawer: SideMenu.defaultMenu('หน้าหลัก'),
        appBar: AppBar(
          backgroundColor: deepGreen,
          title: !isSearch
              ? const Text(
                  'ปิ่นโต บางกะเจ้า',
                  textAlign: TextAlign.left,
                  style: kAppbarTextStyle,
                )
              : Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: TextField(
                    style: kContentTextWhite,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      hintText: 'ค้นหา',
                      hintStyle: kContentTextWhite,
                      //fillColor: Colors.white
                    ),
                    onChanged: (value){
                      setState(() {
                        searchKeyword = value;
                      });
                    },
                  ),
                ),
          actions: [
            !isSearch
                ? IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      setState(() {
                        isSearch = !isSearch;
                      });
                    },
                  )
                : IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      setState(() {
                        isSearch = !isSearch;
                      });
                    },
                  )
          ],
        ),
        body: SafeArea(
          child: FutureBuilder<List<ProductPreview>>(
            future: ProductService.getProductPreviews(),
            builder: (BuildContext context,
            AsyncSnapshot<List<ProductPreview>> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                List<ProductPreview> listProductPreview = snapshot.data!;
                // List<ProductPreview> listProductPreview = searchOperation(searchKeyword, snapshot.data!);
                return ListView.builder(
                  itemCount: listProductPreview.length,
                  itemBuilder: (context,index)=> Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                    child: InMarketProductCard(
                      product: listProductPreview[index],
                      statusNumber: listProductPreview[index].sellType == 'PRE-ORDER' ?1:2,
                    )
                ));
              }
            }
          )
          // child: SingleChildScrollView(
          //   child: Container(
          //     padding: EdgeInsets.all(screenWidth * 0.03),
          //     child: Column(
          //       children: [
          //         InmarketProductCard(
          //           productId: 1,
          //           productName: 'ผักกาดขาว',
          //           statusNumber: 1,
          //           farmName: 'แดง นักสู้',
          //           functionBasket: () {},
          //           functionCard: (){
          //             Navigator.push(
          //                 context,
          //                 MaterialPageRoute(
          //                     builder: (context) => ProductDetailPage(
          //                       productId: 1,
          //                       productName: 'ผักกาดขาว',
          //                       farmName: 'แดง นักสู้',
          //                       status: 1,
          //                       price: 20.0,
          //                       unit: 'กก',
          //                     )
          //                 )
          //             );
          //           },
          //           functionOrdering: () {},
          //         ),
          //         InmarketProductCard(
          //           productId: 2,
          //           productName: 'เห็ด',
          //           statusNumber: 2,
          //           farmName: 'เขียว นักซิ่ง',
          //           functionBasket: () {},
          //           functionCard: (){
          //             Navigator.push(
          //                 context,
          //                 MaterialPageRoute(
          //                     builder: (context) => ProductDetailPage(
          //                       productId: 1,
          //                       productName: 'เห็ด',
          //                       farmName: 'เขียว นักซิ่ง',
          //                       status: 2,
          //                       price: 10.0,
          //                       unit: 'กก',
          //                     )
          //                 )
          //             );
          //           },
          //           functionOrdering: () {},
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        )
    );
  }
  List<ProductPreview> searchOperation(String keyword, List<ProductPreview> listProduct) {
    List<ProductPreview> result = [];
    if(keyword.isNotEmpty){
      for (int index = 0; index < listProduct.length; index++) {
        if (listProduct[index].name.contains(keyword)) {
          result.add(listProduct[index]);
        }
      }
      return result;
    }else{
      return listProduct;
    }
  }
}

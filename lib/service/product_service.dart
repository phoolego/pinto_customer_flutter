import 'package:pinto_customer_flutter/api/api.dart';
import 'package:pinto_customer_flutter/model/product.dart';
import 'package:pinto_customer_flutter/model/stock.dart';
import 'package:pinto_customer_flutter/model/product_preview.dart';
import 'package:dio/dio.dart';
import 'package:pinto_customer_flutter/model/stock_product.dart';
import 'package:pinto_customer_flutter/service/auth.dart';
import 'package:pinto_customer_flutter/service/thai_sort.dart';

class ProductService {
  static Future<List<ProductPreview>> getProductPreviews() async {
    try {
      print('call get');
      var response = await Api.dio.get(
        '/customer/get-sell-product',
        options: Options(
          headers: {'userId': Auth.user.userId},
        ),
      );
      List<ProductPreview> productPreview = (response.data as List).map((e) => ProductPreview(e)).toList();
      print(productPreview.length);
      productPreview.sort((a, b) => ThaiSort.compareTo(a.name, b.name));
      return productPreview;
    } on DioError catch (err) {
      print(err.toString());
      print(err.response!.data['message']);
      return err.response!.data['message'];
    } catch (err) {
      print(err.toString());
      throw err.toString();
    }
  }
  static Future<Product> getSellProductDetail(String productType) async{
    try {
      var response = await Api.dio.get('/customer/get-sell-product/detail',
        options: Options(
          headers: {
            'userId':Auth.user.userId
          },
        ),
        queryParameters: {
          'productType' : productType
        },
      );
      Product productDetail = Product(response.data);
      return productDetail;
    } on DioError catch (err) {
      print(err.toString());
      print(err.response!.data['message']);
      return err.response!.data['message'];
    } catch (err) {
      print(err.toString());
      throw err.toString();
    }
  }
  static Future<Product> getPreOrderProductDetail(String productType) async{
    try {
      print(productType);
      var response = await Api.dio.get('/customer/get-pre-order-product/detail',
        options: Options(
          headers: {
            'userId':Auth.user.userId
          },
        ),
        queryParameters: {
          'productType' : productType
        },
      );
      Product productDetail = Product(response.data);
      return productDetail;
    } on DioError catch (err) {
      print(err.toString());
      print(err.response!.data['message']);
      return err.response!.data['message'];
    } catch (err) {
      print(err.toString());
      throw err.toString();
    }
  }
}

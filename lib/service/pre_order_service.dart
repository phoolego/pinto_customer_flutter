import 'package:dio/dio.dart';
import 'package:pinto_customer_flutter/api/api.dart';
import 'package:pinto_customer_flutter/model/order.dart';
import 'dart:convert';

import 'auth.dart';

class PreOrderService{
  //TODO get pre-order
  // static Future<List<Order>> getOrder(String? status) async {
  //   try {
  //     var response = await Api.dio.get(
  //       '/customer/get-sell-product',
  //       options: Options(
  //         headers: {'userId': Auth.user.userId},
  //       ),
  //       queryParameters: {
  //         'status': status
  //       },
  //     );
  //     List<Order> order = (response.data as List).map((e) => Order(e)).toList();
  //     return order;
  //   } on DioError catch (err) {
  //     print(err.response!.data['message']);
  //     return err.response!.data['message'];
  //   } catch (err) {
  //     print(err.toString());
  //     throw err.toString();
  //   }
  // }
  static Future<void> insertPreOrder(String productType, DateTime sellingDate, double amount) async {
    try {
      await Api.dio.post(
          '/customer/pre-order/create',
          options: Options(
            headers: {'userId': Auth.user.userId},
          ),
          data: {
            'productType': productType,
            'sellingDate': sellingDate.toString().substring(0,10),
            'amount': amount,
          }
      );
    } on DioError catch (err) {
      print(err.response!.data['message']);
      throw err.response!.data['message'];
    } catch (err) {
      print(err.toString());
      throw err.toString();
    }
  }
}
import 'package:dio/dio.dart';
import 'package:pinto_customer_flutter/api/api.dart';
import 'package:pinto_customer_flutter/model/order.dart';
import 'dart:convert';

import 'auth.dart';

class OrderService{
  static Future<List<Order>> getOrder(String? status) async {
    try {
      var response = await Api.dio.get(
        '/customer/get-sell-product',
        options: Options(
          headers: {'userId': Auth.user.userId},
        ),
        queryParameters: {
          'status': status
        },
      );
      List<Order> order = (response.data as List).map((e) => Order(e)).toList();
      return order;
    } on DioError catch (err) {
      print(err.response!.data['message']);
      return err.response!.data['message'];
    } catch (err) {
      print(err.toString());
      throw err.toString();
    }
  }
  static Future<void> insertOrder(String paymentType, String deliveryType, double deliveryPrice) async {
    try {
      List<Map<String,dynamic>> itemOrders = Order.basket.map((e) => e.getMap()).toList();
      print(json.encode(itemOrders));
      await Api.dio.post(
        '/customer/order/create',
        options: Options(
          headers: {'userId': Auth.user.userId},
        ),
        data: {
          'paymentType': paymentType,
          'deliveryType': deliveryType,
          'deliveryPrice': deliveryPrice,
          'orderItem': json.encode(itemOrders)
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
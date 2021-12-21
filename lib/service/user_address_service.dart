import 'package:dio/dio.dart';
import 'package:pinto_customer_flutter/api/api.dart';
import 'package:pinto_customer_flutter/model/user_address.dart';
import 'package:pinto_customer_flutter/service/auth.dart';

class UserAddressService{
  static Future<List<UserAddress>> getUserAddress() async {
    try {
      var response = await Api.dio.get(
        '/address',
        options: Options(
          headers: {'userId': Auth.user.userId},
        ),
      );
      List<UserAddress> userAddress = (response.data as List).map((e) => UserAddress(e)).toList();
      return userAddress;
    } on DioError catch (err) {
      print(err.response!.data['message']);
      throw err.response!.data['message'];
    } catch (err) {
      print(err.toString());
      throw err.toString();
    }
  }
  static Future<UserAddress> getDefaultAddress() async {
    try {
      var response = await Api.dio.get(
        '/address',
        options: Options(
          headers: {'userId': Auth.user.userId},
        ),
      );
      List<UserAddress> userAddress = (response.data as List).map((e) => UserAddress(e)).toList();
      for(int i=0 ; i<userAddress.length ; i++){
        if(userAddress[i].inUse) {
          return userAddress[i];
        }
      }
      return userAddress[0];
    } on DioError catch (err) {
      print(err.response!.data['message']);
      throw err.response!.data['message'];
    } catch (err) {
      print(err.toString());
      throw err.toString();
    }
  }
  static Future<void> insertUserAddress(String addressName,String address) async {
    try {
      await Api.dio.post(
        '/address/create',
        options: Options(
          headers: {'userId': Auth.user.userId},
        ),
        data: {
          'addressName':addressName,
          'address':address
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
  static Future<List<UserAddress>> setDefaultAddress(int addressId) async {
    try {
      var response = await Api.dio.put(
          '/address/create',
          options: Options(
            headers: {'userId': Auth.user.userId},
          ),
          data: {
            'id':addressId,
          }
      );
      List<UserAddress> userAddress = (response.data as List).map((e) => UserAddress(e)).toList();
      return userAddress;
    } on DioError catch (err) {
      print(err.response!.data['message']);
      throw err.response!.data['message'];
    } catch (err) {
      print(err.toString());
      throw err.toString();
    }
  }
}
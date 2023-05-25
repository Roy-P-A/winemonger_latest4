import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'package:winemonger/mixins/snackbar_mixin.dart';
// import 'package:winemonger/models/dto/api_dtos/orders/order_screen/order_screen.dart';
// import 'package:winemonger/models/ordermodel/order_model.dart';
// import 'package:winemonger/repository/repository.dart';

class OrdersController extends GetxController with SnackbarMixin {
  // http.Client client = RetryClient(http.Client());

  // var orderModelEntity = OrderModel(data: List<Data>.empty(growable: true)).obs;

  // final ScrollController scrollController = ScrollController();
  // final isInitialized = false.obs;

  // Rx<TextEditingController> searchController = TextEditingController().obs;

  // final bulklist = Rx<List<Data>>([]);

  // var count = 1.obs;
  // var count1 = 20.obs;
  // var count2 = 1.obs;

  // increment() => count++;
  // // decrement() => count--;

  // @override
  // void onInit() {
  //   bulklistApi();
  //   super.onInit();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  // @override
  // void dispose() {
  //   scrollController.dispose();
  //   searchController.value.dispose();
  //   super.dispose();
  // }

  // int totalpages() {
  //   if (orderModelEntity.value.totalNoItems != null) {
  //     return (int.parse(orderModelEntity.value.totalNoItems!) / 10).toInt();
  //   }
  //   return 20;
  // }

  // Future<void> bulklistApi() async {
  //   if (count1.value <= totalpages()) {
  //     for (int j = count2.value; j < count1.value; j++) {
  //       await orderlistApi(j);

  //       for (int k = 0; k < orderModelEntity.value.data.length; k++) {
  //         bulklist.value.add(orderModelEntity.value.data[k]);
  //       }
  //       increment();
  //       update();
  //     }
  //     count2.value = count1.value;
  //     isInitialized.value = true;
  //   }
  // }

  // Future<void> orderlistApi(value) async {
  //   isInitialized.value = false;
  //   var box = await Hive.openBox('myBox');
  //   String apikey = box.get('apikey');

  //   try {
  //     final request = OrderScreenRequest(
  //       apikey: apikey,
  //       pagenumber: value,
  //     );

  //     orderModelEntity.value =
  //         await ApiRepository.to.fetchOrders(request: request);
  //     print(orderModelEntity.value.toJson());

  //     isInitialized.value = true;
  //   } catch (e) {
  //     showErrorSnackbar(title: "Error", message: e.toString());
  //   }
  //   update();
  // }

  // Future<void> sendSearchitem() async {
  //   print(searchController.value.text);
  //   bulklist.value.clear();
  //   await bulkSearchlistApi();
  // }

  // Future<void> bulkSearchlistApi() async {
  //   await orderSearchlistApi();

  //   for (int k = 0; k < orderModelEntity.value.data.length; k++) {
  //     bulklist.value.add(orderModelEntity.value.data[k]);
  //   }
  //   increment();
  //   update();

  //   isInitialized.value = true;
  // }

  // Future<void> orderSearchlistApi() async {
  //   isInitialized.value = false;
  //   var box = await Hive.openBox('myBox');
  //   String apikey = box.get('apikey');

  //   var _baseUrl = 'winemonger.nintriva.com';
  //   var endpoint = 'apiV1/orders/search';
  //   var headers = {'APIKEY': apikey};
  //   var params = {'customer_company': searchController.value.text};
  //   var url = Uri.http(_baseUrl, endpoint, params);

  //   try {
  //     var response = await client.get(url, headers: headers);

  //     if (response.statusCode == 200) {
  //       orderModelEntity.value = OrderModel.fromJson(jsonDecode(response.body));
  //       isInitialized.value = true;

  //       print(orderModelEntity.value.toJson());

  //       isInitialized.value = true;
  //     }
  //   } catch (e) {}
  // }
}

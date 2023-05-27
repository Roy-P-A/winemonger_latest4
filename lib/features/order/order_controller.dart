import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'package:winemonger/mixins/snackbar_mixin.dart';
import 'package:winemonger/models/dto/api_dtos/orders/order_screen/order_screen.dart';
import 'package:winemonger/models/ordermodel/order_model.dart';
import 'package:winemonger/repository/repository.dart';

class OrdersController extends GetxController with SnackbarMixin {
  http.Client client = RetryClient(http.Client());
  var orderModelEntity = OrderModel(data: List<Data>.empty(growable: true)).obs;
  final bulklist = Rx<List<Data>>([]);
  final isLoadingFirst = false.obs;
  final isLoadingSecond = false.obs;
  final isSearchItemBlank = false.obs;
  bool hasMorePages = true;
  int page = 2;
  final ScrollController scrollController = ScrollController();
  Rx<TextEditingController> searchController = TextEditingController().obs;

  void scrollControllerSection() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        //print("ravi");
        if (isLoadingFirst.value || isLoadingSecond.value) {
        } else {
          fetchItemsSecond();
        }
      }
    });
  }

  void fetchItemsfirst() async {
    if (isLoadingFirst.value) return;
    isLoadingFirst.value = true;
    var box = await Hive.openBox('myBox');
    String apikey = box.get('apikey');
    try {
      final request = OrderScreenRequest(
        apikey: apikey,
        pagenumber: page,
      );
      orderModelEntity.value =
          await ApiRepository.to.fetchOrders(request: request);
      //print("heeep${orderModelEntity.value.toJson()}");
      await Future.delayed(const Duration(seconds: 1));

      for (int k = 0; k < orderModelEntity.value.data.length; k++) {
        bulklist.value.add(orderModelEntity.value.data[k]);
      }

      print(bulklist);

      isLoadingFirst.value = false;
      page++;
    } catch (e) {
      showErrorSnackbar(title: "Error", message: e.toString());
      isLoadingFirst.value = false;
    }

    update();
  }

  void fetchItemsSecond() async {
    if (isLoadingSecond.value) return;
    isLoadingSecond.value = true;
    var box = await Hive.openBox('myBox');
    String apikey = box.get('apikey');
    try {
      final request = OrderScreenRequest(
        apikey: apikey,
        pagenumber: page,
      );
      orderModelEntity.value =
          await ApiRepository.to.fetchOrders(request: request);
      //print("heeep${orderModelEntity.value.toJson()}");
      await Future.delayed(const Duration(seconds: 1));

      //bulklist.value.addAll(orderModelEntity.value);
      for (int k = 0; k < orderModelEntity.value.data.length; k++) {
        bulklist.value.add(orderModelEntity.value.data[k]);
      }

      print(bulklist);

      isLoadingSecond.value = false;
      page++;
    } catch (e) {
      showErrorSnackbar(title: "Error", message: e.toString());
      isLoadingSecond.value = false;
    }

    update();
  }

  @override
  void onInit() {
    super.onInit();
    bulklist.value.clear();
    fetchItemsfirst();
  }

  @override
  void dispose() {
    scrollController.dispose();
    searchController.value.dispose();
    super.dispose();
  }

  Future<void> sendSearchitem() async {
    isSearchItemBlank.value = false;
    //print(searchController.value.text);
    if (searchController.value.text != "") {
      bulklist.value.clear();
      await orderSearchlistApi();
    } else {
      bulklist.value.clear();
      page = 2;
      fetchItemsfirst();
    }
  }

  Future<void> orderSearchlistApi() async {
    var box = await Hive.openBox('myBox');
    String apikey = box.get('apikey');
    var _baseUrl = 'winemonger.nintriva.com';
    var endpoint = 'apiV1/orders/search';
    var headers = {'APIKEY': apikey};
    var params = {'customer_company': searchController.value.text};
    var url = Uri.http(_baseUrl, endpoint, params);

    try {
      var response = await client.get(url, headers: headers);

      if (response.statusCode == 200) {
        orderModelEntity.value = OrderModel.fromJson(jsonDecode(response.body));

        print(orderModelEntity.value.toJson());

        for (int k = 0; k < orderModelEntity.value.data.length; k++) {
          bulklist.value.add(orderModelEntity.value.data[k]);
        }
      }
    } catch (e) {
      isSearchItemBlank.value = true;
    }
    update();
  }
}

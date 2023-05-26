import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
// import 'package:winemonger/models/ordermodel/create_order/wholesale/orderwholesaleadjustmentlistmodel.dart';
// import 'package:winemonger/models/ordermodel/create_order/wholesale/orderwholesalecreateorder.dart';
// import 'package:winemonger/models/ordermodel/create_order/wholesale/orderwholesalecustomermodel.dart';
// import 'package:winemonger/models/ordermodel/create_order/wholesale/orderwholesaledeleteadjustmentmodel.dart';
// import 'package:winemonger/models/ordermodel/create_order/wholesale/orderwholesalefiltermanufacturermodel.dart';
// import 'package:winemonger/models/ordermodel/create_order/wholesale/orderwholesalefilterproductmodel.dart';
// import 'package:winemonger/models/ordermodel/create_order/wholesale/orderwholesaleselectaddadjustmentstoordersmodel.dart';
// import 'package:winemonger/models/ordermodel/create_order/wholesale/orderwholesaleselectaddtoordersmodel.dart';
// import 'package:winemonger/models/ordermodel/create_order/wholesale/orderwholesaleselectproductbuttonmodel.dart';
// import 'package:winemonger/models/ordermodel/create_order/wholesale/orderwholesalewarehousesmodel.dart';

// import '../../../../models/ordermodel/create_order/wholesale/orderwholesaledeleteproductmodel.dart';

class WholesaleCreateController extends GetxController {
  //final isInitialized = false.obs;
  // http.Client client = RetryClient(http.Client());
  // var OrderWholesaleWarehousesModelEntity =
  //     OrderWholesaleWarehousesModel(data2: List<Data2>.empty(growable: true))
  //         .obs;
  // var orderWholesaleCustomerModelEntity =
  //     OrderWholesaleCustomerModel(data1: List<Data1>.empty(growable: true)).obs;
  // var orderWholesaleFilterManufacturerModelEntity =
  //     OrderWholesaleFilterManufacturerModel(
  //             data3: List<Data3>.empty(growable: true))
  //         .obs;

  // var orderWholesaleFilterProductModelEntity = OrderWholesaleFilterProductModel(
  //         data4: Data4(data5: List<Data5>.empty(growable: true)))
  //     .obs;
  // var orderWholesaleSelectProductbuttomModelEntity =
  //     OrderWholesaleSelectProductbuttomModel(productSpecs: ProductSpecs()).obs;

  // var orderWholesaleSelectAddToOrdersModelEntity =
  //     OrderWholesaleSelectAddToOrdersModel(data7: Data7()).obs;

  // var orderWholesaleAdjustmentListModelEntity =
  //     OrderWholesaleAdjustmentListModel(
  //             data9: List<Data9>.empty(growable: true))
  //         .obs;

  // var orderWholesaleSelectAddAdjustmentsToOrdersModelEntity =
  //     OrderWholesaleSelectAddAdjustmentsToOrdersModel(data10: Data10()).obs;

  // var orderwholesaledeleteproductmodelEntity =
  //     Orderwholesaledeleteproductmodel().obs;

  // var orderWholesaleDeleteAdjustmentModelEntity =
  //     OrderWholesaleDeleteAdjustmentModel().obs;

  // var orderWholeSaleCreateOrderModelEntity =
  //     OrderWholeSaleCreateOrderModel().obs;

  // /////////////////////////////////////
  // //var customerfieldname = "".obs;
  // final GlobalKey<FormState> formKey1 = new GlobalKey<FormState>();
  // final GlobalKey<FormState> formKey2 = new GlobalKey<FormState>();
  // final GlobalKey<FormState> formKey3 = new GlobalKey<FormState>();
  // final GlobalKey<FormState> formKey4 = new GlobalKey<FormState>();
  // final GlobalKey<FormState> formKey5 = new GlobalKey<FormState>();
  // final GlobalKey<FormState> formKey6 = new GlobalKey<FormState>();
  // //static final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  // //static final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  // Rx<TextEditingController> customerController = TextEditingController().obs;
  // //TextEditingController customerController = TextEditingController();
  // Rx<TextEditingController> customerController1 = TextEditingController().obs;
  // //TextEditingController customerController1 = TextEditingController();
  // //Rx<TextEditingController> customerController2 = TextEditingController().obs;

  // var warehouseselected = "0".obs;

  // var totalValue = (0).obs;

  // void setSelected(String value) {
  //   warehouseselected.value = value;
  // }

  // var manufacturerselected = "0".obs;

  // void setSelected1(String value) {
  //   manufacturerselected.value = value;
  // }

  // var adjustmentselected = "0".obs;

  // void setSelected2(String value) {
  //   adjustmentselected.value = value;
  // }

  // //TextEditingController warehouseController = TextEditingController();
  // TextEditingController manufacturerController = TextEditingController();
  // Rx<TextEditingController> productController = TextEditingController().obs;
  // Rx<TextEditingController> productController1 = TextEditingController().obs;

  // //TextEditingController productController = TextEditingController();

  // final selectButtonToAddToOrders = false.obs;
  // final addToOrders = false.obs;
  // final addToOrders1 = false.obs;
  // final addadjustments = true.obs;

  // Rx<TextEditingController> quantityController = TextEditingController().obs;
  // Rx<TextEditingController> quantityController1 = TextEditingController().obs;
  // Rx<TextEditingController> operatorController = TextEditingController().obs;

  // String? customerNameValidator(String value) {
  //   if (customerController1.value.text.isEmpty ||
  //       customerController1.value.text.length < 1) {
  //     return 'Select Customer';
  //   }
  //   return null;
  // }

  // String? warehouseNameValidator(String value) {
  //   if (value == null || warehouseselected.value == '0') {
  //     return 'Select Warehouse';
  //   }
  // }

  // String? manufacturerNameValidator(String value) {
  //   if (value == null || manufacturerselected.value == '0') {
  //     return 'Select Manufacturer';
  //   }
  // }

  // String? productNameValidator(String value) {
  //   if (productController1.value.text.isEmpty ||
  //       productController1.value.text.length < 1) {
  //     return 'Select Product';
  //   }
  //   return null;
  // }

  // void selectProductButton() {
  //   final isValid1 = formKey1.currentState!.validate();
  //   final isValid2 = formKey2.currentState!.validate();
  //   final isValid3 = formKey3.currentState!.validate();
  //   final isValid4 = formKey4.currentState!.validate();
  //   Get.focusScope!.unfocus();

  //   if (isValid1 && isValid2 && isValid3 && isValid4) {
  //     formKey1.currentState!.save();
  //     formKey2.currentState!.save();
  //     formKey3.currentState!.save();
  //     formKey4.currentState!.save();
  //     //print(customerController1.value.text);
  //   }
  // }

  // //final bulkAddAdjustmentslist = Rx<List<dynamic>>([]).obs;
  // final bulkAddAdjustmentslist1 = Rx<List<dynamic>>([]).obs;

  // @override
  // void onInit() async {
  //   await customerDetailListApi('a');
  //   await warehouseDetailListApi();
  //   //await filterManufacturerApi();
  //   //await filterProductApi();
  //   await adjustmentlistApi();

  //   super.onInit();
  // }

  // @override
  // void onClose() {
  //   customerController.value.dispose();
  //   customerController1.value.dispose();
  //   warehouseselected.value = '0';
  //   manufacturerselected.value = '0';
  //   productController.value.dispose();
  //   productController1.value.dispose();
  //   super.onClose();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  // Future<void> warehouseDetailListApi() async {
  //   var box = await Hive.openBox('myBox');
  //   String apikey = box.get('apikey');
  //   String cookie = box.get('cookie');
  //   var _baseUrl = 'winemonger.nintriva.com';
  //   var endpoint = 'api/list/warehouses';
  //   var headers = {
  //     "APIKEY": apikey,
  //     'Cookie': cookie,
  //   };

  //   var url = Uri.http(
  //     _baseUrl,
  //     endpoint,
  //   );
  //   try {
  //     var response = await client.get(url, headers: headers);
  //     print(response);
  //     if (response.statusCode == 200) {
  //       OrderWholesaleWarehousesModelEntity.value =
  //           OrderWholesaleWarehousesModel.fromJson(jsonDecode(response.body));
  //       //isInitialized.value = true;
  //       print('HELLO');
  //       print(OrderWholesaleWarehousesModelEntity.value.toJson());
  //     } else {
  //       print('HI');
  //       throw Exception('Failed to load album');
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   update();
  // }

  // Future<void> customerDetailListApi(value1) async {
  //   var box = await Hive.openBox('myBox');
  //   String apikey = box.get('apikey');
  //   String cookie = box.get('cookie');
  //   var _baseUrl = 'winemonger.nintriva.com';
  //   var endpoint = 'apiV1/customers/customerName';
  //   var headers = {
  //     "APIKEY": apikey,
  //     'Cookie': cookie,
  //   };
  //   print(customerController1.value.text);
  //   var url = Uri.http(
  //       _baseUrl, endpoint, {'customers': '${value1}', 'wholesale': '1'});
  //   try {
  //     var response = await client.get(
  //       url,
  //       headers: headers,
  //     );
  //     print(response);
  //     if (response.statusCode == 200) {
  //       orderWholesaleCustomerModelEntity.value =
  //           OrderWholesaleCustomerModel.fromJson(jsonDecode(response.body));
  //       //isInitialized.value = true;
  //       print('HELLO');
  //       print(orderWholesaleCustomerModelEntity.value.toJson());
  //     } else {
  //       print('HI');
  //       throw Exception('Failed to load album');
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   update();
  // }

  // Future<void> filterManufacturerApi() async {
  //   var box = await Hive.openBox('myBox');
  //   String apikey = box.get('apikey');
  //   String cookie = box.get('cookie');
  //   var _baseUrl = 'winemonger.nintriva.com';
  //   var endpoint = 'api/search/manufacturers';
  //   var headers = {
  //     "APIKEY": apikey,
  //     'Cookie': cookie,
  //   };

  //   var url = Uri.http(_baseUrl, endpoint);
  //   try {
  //     var response = await client.post(url,
  //         headers: headers,
  //         body: jsonEncode({'warehouse_id': '${warehouseselected.value}'}));
  //     print(response);
  //     if (response.statusCode == 200) {
  //       orderWholesaleFilterManufacturerModelEntity.value =
  //           OrderWholesaleFilterManufacturerModel.fromJson(
  //               jsonDecode(response.body));
  //       //isInitialized.value = true;
  //       print('HELLO');
  //       print(orderWholesaleFilterManufacturerModelEntity.value.toJson());
  //     } else {
  //       print('HI');
  //       throw Exception('Failed to filter manufacturer');
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   update();
  // }

  // Future<void> filterProductApi() async {
  //   var box = await Hive.openBox('myBox');
  //   String apikey = box.get('apikey');
  //   String cookie = box.get('cookie');
  //   var _baseUrl = 'winemonger.nintriva.com';
  //   var endpoint = 'apiV1/orders/filterProduct';
  //   var headers = {
  //     "APIKEY": apikey,
  //     'Cookie': cookie,
  //   };

  //   var url = Uri.http(_baseUrl, endpoint);
  //   try {
  //     var response = await client.post(url,
  //         headers: headers,
  //         body: jsonEncode({
  //           'filters': {
  //             'wholesale': 1,
  //             'warehouse_id': '${warehouseselected.value}',
  //             'manufacturer': '${manufacturerselected.value}'
  //           }
  //         }));
  //     print(response);
  //     if (response.statusCode == 200) {
  //       orderWholesaleFilterProductModelEntity.value =
  //           OrderWholesaleFilterProductModel.fromJson(
  //               jsonDecode(response.body));
  //       //isInitialized.value = true;
  //       print('HELLO');
  //       print(orderWholesaleFilterProductModelEntity.value.toJson());
  //     } else {
  //       print('HI');
  //       throw Exception('Failed to filter product');
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   update();
  // }

  // Future<void> selectProductApi() async {
  //   var box = await Hive.openBox('myBox');
  //   String apikey = box.get('apikey');
  //   String cookie = box.get('cookie');
  //   var _baseUrl = 'winemonger.nintriva.com';
  //   var endpoint = 'api/view/products';
  //   var headers = {
  //     "APIKEY": apikey,
  //     'Cookie': cookie,
  //   };

  //   var url = Uri.http(_baseUrl, endpoint);
  //   try {
  //     print(productController1.value.text);
  //     var response = await client.post(
  //       url,
  //       headers: headers,
  //       // body: jsonEncode(
  //       //   {'id': '${productController1.value.text}'},
  //       // ),
  //       body: jsonEncode(
  //         {'id': '${productController1.value.text}'},
  //       ),
  //     );
  //     print(response);
  //     if (response.statusCode == 200) {
  //       orderWholesaleSelectProductbuttomModelEntity.value =
  //           OrderWholesaleSelectProductbuttomModel.fromJson(
  //               jsonDecode(response.body));
  //       //isInitialized.value = true;
  //       print('HELLO');
  //       print(orderWholesaleSelectProductbuttomModelEntity.value.toJson());
  //     } else {
  //       print('HI');
  //       throw Exception('Failed to select product Button (green color)');
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   update();
  // }

  // // String? quantityNameValidator(String value) {
  // //   if (int.parse(quantityController.value.text) >
  // //       int.parse(orderWholesaleSelectProductbuttomModelEntity.value.onHand!)) {
  // //     return 'Quantity available: ${orderWholesaleSelectProductbuttomModelEntity.value.onHand!} only';
  // //   }
  // // }

  // void addToOrdersValidations() async {
  //   final isValid5 = formKey5.currentState!.validate();
  //   Get.focusScope!.unfocus();

  //   if (isValid5) {
  //     formKey5.currentState!.save();
  //     await addToOrdersApi(
  //         product_id: orderWholesaleSelectProductbuttomModelEntity.value.id,
  //         qty: quantityController.value.text,
  //         linesku: orderWholesaleSelectProductbuttomModelEntity.value.sku,
  //         linedsc: orderWholesaleSelectProductbuttomModelEntity.value.name,
  //         linevalue: orderWholesaleSelectProductbuttomModelEntity
  //             .value.wholesalePrice);
  //     addToOrders.value = true;
  //     selectButtonToAddToOrders.value = false;
  //     await bulklist1Api();

      
  //   }
  // }

  

  // Future<void> bulklist1Api() async {
  //   bulkAddAdjustmentslist1.value.value
  //       .add(orderWholesaleSelectAddToOrdersModelEntity.value.data7);
  // }

  // Future<void> addToOrdersApi({
  //   product_id,
  //   qty,
  //   linesku,
  //   linedsc,
  //   linevalue,
  // }) async {
  //   var box = await Hive.openBox('myBox');
  //   String apikey = box.get('apikey');
  //   String cookie = box.get('cookie');
  //   var _baseUrl = 'winemonger.nintriva.com';
  //   var endpoint = 'api/create/preOrderLines';
  //   var headers = {
  //     "APIKEY": apikey,
  //     'Cookie': cookie,
  //   };
  //   print(product_id);
  //   print(qty);
  //   print(linesku);
  //   print(linedsc);
  //   print(linevalue);
  //   print(customerController1.value.text);
  //   var url = Uri.http(_baseUrl, endpoint);
  //   try {
  //     var response = await client.post(
  //       url,
  //       headers: headers,
  //       body: jsonEncode({
  //         "OrdersLines": {
  //           "product_id": "2640",
  //           "qty": "12",
  //           "line_sku": "RB009",
  //           "line_dsc": "Barth Rene Gewurztraminer 2014",
  //           "line_value": "16.0000"
  //         },
  //         "owner_user_id": "101",
  //         "new_owner_user_id": "",
  //         "set_new_owner": 0,
  //         "customer_id": "1212",
  //         "total_pre_orderline_id": "",
  //         "pre_orderline_id": "",
  //         "total": "",
  //         "discount_total": "",
  //         "product_ware_house_id": "41",
  //         "line_number": "1"
  //       }),
  //     );
  //     print(response);
  //     if (response.statusCode == 200) {
  //       orderWholesaleSelectAddToOrdersModelEntity.value =
  //           OrderWholesaleSelectAddToOrdersModel.fromJson(
  //               jsonDecode(response.body));
  //       //isInitialized.value = true;
  //       print('HELLO');
  //       print(orderWholesaleSelectAddToOrdersModelEntity.value.toJson());
  //     } else {
  //       print('HI');
  //       throw Exception('Failed to SELECT product');
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   update();
  // }

  // // void removeToOrders() async {
  // //   await removeToOrdersApi();
  // //   //addToOrders.value = false;
  // // }

  // Future<void> removeToOrdersApi({
  //   id,
  //   total,
  //   totalPreOrderlineId,
  // }) async {
  //   var box = await Hive.openBox('myBox');
  //   String apikey = box.get('apikey');
  //   String cookie = box.get('cookie');
  //   var _baseUrl = 'winemonger.nintriva.com';
  //   var endpoint = 'api/delete/preOrdersLines';
  //   var headers = {
  //     "APIKEY": apikey,
  //     'Cookie': cookie,
  //   };

  //   var url = Uri.http(_baseUrl, endpoint);
  //   try {
  //     var response = await client.delete(
  //       url,
  //       headers: headers,
  //       body: jsonEncode({
  //         "id": "${id}",
  //         "total": total,
  //         "total_pre_orderline_id": "${totalPreOrderlineId}",
  //         "line_number": 5,
  //         "del_warehouse_id": 0,
  //         "del_lineNumber": 5
  //       }),
  //     );
  //     print(response);
  //     if (response.statusCode == 200) {
  //       orderwholesaledeleteproductmodelEntity.value =
  //           Orderwholesaledeleteproductmodel.fromJson(
  //               jsonDecode(response.body));
  //       //isInitialized.value = true;
  //       print('deleted product');
  //       print(orderwholesaledeleteproductmodelEntity.value.toJson());
  //     } else {
  //       print('HI');
  //       throw Exception('Failed to delete product');
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   update();
  // }

  // void addAdjustmentOrder(operator) async {
  //   final isValid6 = formKey6.currentState!.validate();

  //   Get.focusScope!.unfocus();

  //   if (isValid6) {
  //     formKey6.currentState!.save();
  //     addToOrders1.value = true;
  //     print(quantityController1.value.text);
  //     await addAdjustmentOrderconfirmApi(operator);
  //     //addToOrders1.value = false;

  //     await bulklistApi();
  //     //addToOrders1.value = true;
  //     addToOrders.value = true;
  //     update();
  //     refresh();
  //   }
  // }

  // Future<void> adjustmentlistApi() async {
  //   var box = await Hive.openBox('myBox');
  //   String apikey = box.get('apikey');
  //   String cookie = box.get('cookie');
  //   var _baseUrl = 'winemonger.nintriva.com';
  //   var endpoint = 'api/list/adjustments';
  //   var headers = {
  //     "APIKEY": apikey,
  //     'Cookie': cookie,
  //   };

  //   var url = Uri.http(_baseUrl, endpoint);
  //   try {
  //     var response = await client.get(
  //       url,
  //       headers: headers,
  //     );
  //     print(response);
  //     if (response.statusCode == 200) {
  //       orderWholesaleAdjustmentListModelEntity.value =
  //           OrderWholesaleAdjustmentListModel.fromJson(
  //               jsonDecode(response.body));
  //       //isInitialized.value = true;
  //       print('HELLO ADJUSTMENTS');
  //       print(orderWholesaleAdjustmentListModelEntity.value.toJson());
  //       update();
  //     } else {
  //       print('HI');
  //       throw Exception('Failed to SELECT adjustment');
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  // Future<void> bulklistApi() async {
  //   bulkAddAdjustmentslist1.value.value.add(
  //       orderWholesaleSelectAddAdjustmentsToOrdersModelEntity.value.data10);
  //   update();
  // }

  // Future<void> addAdjustmentOrderconfirmApi(operator) async {
  //   var box = await Hive.openBox('myBox');
  //   String apikey = box.get('apikey');
  //   String cookie = box.get('cookie');
  //   var _baseUrl = 'winemonger.nintriva.com';
  //   var endpoint = 'api/create/preOrderLines';
  //   var headers = {
  //     "APIKEY": apikey,
  //     'Cookie': cookie,
  //   };
  //   print(adjustmentselected.value as String);
  //   print('$operator ${quantityController1.value.text}');
  //   print('$operator ${quantityController1.value.text}');
  //   var url = Uri.http(_baseUrl, endpoint);
  //   try {
  //     var response = await client.post(
  //       url,
  //       headers: headers,
  //       body: jsonEncode({
  //         "OrdersLines": {
  //           "qty": 1,
  //           "adjustment_id": "${adjustmentselected.value as String}",
  //           "line_value": "${operator}${quantityController1.value.text}"
  //         },
  //         "customer_id": "1212",
  //         "total_pre_orderline_id": "1672578",
  //         "pre_orderline_id": "10012155",
  //         "total": "${operator}${quantityController1.value.text}",
  //         "discount_total": "",
  //         "product_ware_house_id": "41",
  //         "line_number": 2,
  //       }),
  //     );
  //     print(response);
  //     if (response.statusCode == 200) {
  //       orderWholesaleSelectAddAdjustmentsToOrdersModelEntity.value =
  //           OrderWholesaleSelectAddAdjustmentsToOrdersModel.fromJson(
  //               jsonDecode(response.body));
  //       //isInitialized.value = true;
  //       print('HELLO');
  //       print(orderWholesaleSelectAddAdjustmentsToOrdersModelEntity.value
  //           .toJson());
  //     } else {
  //       print('HI');
  //       throw Exception('Failed to SELECT product');
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   update();
  // }

  // // void removeAdjustmentToOrders() async {
  // //   await removeAdjustmentToOrdersApi();
  // //   //addToOrders.value = false;
  // // }

  // Future<void> removeAdjustmentToOrdersApi({
  //   id,
  //   total,
  //   totalPreorderlineid,
  // }) async {
  //   var box = await Hive.openBox('myBox');
  //   String apikey = box.get('apikey');
  //   String cookie = box.get('cookie');
  //   var _baseUrl = 'winemonger.nintriva.com';
  //   var endpoint = 'api/delete/preOrdersLines';
  //   var headers = {
  //     "APIKEY": apikey,
  //     'Cookie': cookie,
  //   };
  //   print(id.runtimeType);
  //   print(total.runtimeType);
  //   print(totalPreorderlineid.runtimeType);
  //   var url = Uri.http(_baseUrl, endpoint);
  //   try {
  //     var response = await client.delete(
  //       url,
  //       headers: headers,
  //       body: jsonEncode({
  //         "id": "${id}",
  //         "total": total,
  //         "total_pre_orderline_id": "${totalPreorderlineid}",
  //         "line_number": 2,
  //         "del_warehouse_id": 0,
  //         "del_lineNumber": 2
  //       }),
  //     );
  //     print(response);
  //     if (response.statusCode == 200) {
  //       orderWholesaleDeleteAdjustmentModelEntity.value =
  //           OrderWholesaleDeleteAdjustmentModel.fromJson(
  //               jsonDecode(response.body));
  //       //isInitialized.value = true;
  //       print('deleted product');
  //       print(orderWholesaleDeleteAdjustmentModelEntity.value.toJson());
  //     } else {
  //       print('HI');
  //       throw Exception('Failed to delete product');
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   update();
  // }

  // Future<void> createOrder() async {
  //   var box = await Hive.openBox('myBox');
  //   String apikey = box.get('apikey');
  //   String cookie = box.get('cookie');
  //   var _baseUrl = 'winemonger.nintriva.com';
  //   var endpoint = 'api/create/orders';
  //   var headers = {
  //     "APIKEY": apikey,
  //     'Cookie': cookie,
  //   };

  //   var url = Uri.http(_baseUrl, endpoint);
  //   try {
  //     var response = await client.post(
  //       url,
  //       headers: headers,
  //       body: jsonEncode({
  //         "Orders": {
  //           "customer_id": "1212",
  //           "total": "120.00",
  //           "is_wholesale": 1,
  //           "owner_user_id": "101",
  //           "new_owner_user_id": "",
  //           "set_new_owner": 0
  //         },
  //         "is_mobile": 1,
  //         "order_line_ids": "1672788,1672796,",
  //         "manufacturer": "333",
  //         "product_id": "",
  //         "qty": 1,
  //         "line_sku": "",
  //         "line_dsc": "",
  //         "adjustment_id": "",
  //         "pre_orderline_id": "10012232",
  //         "order_payment_id": ""
  //       }),
  //     );
  //     print(response);
  //     if (response.statusCode == 200) {
  //       orderWholeSaleCreateOrderModelEntity.value =
  //           OrderWholeSaleCreateOrderModel.fromJson(jsonDecode(response.body));
  //       //isInitialized.value = true;
  //       print('HELLO');
  //       print(orderWholeSaleCreateOrderModelEntity.value.toJson());
  //     } else {
  //       print('HI');
  //       throw Exception();
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   update();
  // }
}

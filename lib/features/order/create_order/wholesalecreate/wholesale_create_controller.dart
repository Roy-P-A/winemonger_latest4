
import 'package:collection/collection.dart';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../mixins/snackbar_mixin.dart';


import 'package:http/http.dart' as http;

import '../../../../models/customer_model.dart';


class WholeSaleCreateController extends GetxController with SnackbarMixin {
  var customerController1 = TextEditingController().obs;
  var customerController2 = TextEditingController().obs;
  var productController = TextEditingController().obs;
  var productController1 = TextEditingController().obs;
  var quantityController = TextEditingController().obs;
  var quantityController1 = TextEditingController().obs;
  var operatorController = TextEditingController().obs;

//---model entity--------------------//
  var CustomerModelEntity =
      CustomerModel(data1: List<Data1>.empty(growable: true)).obs;

//   var WarehouseModelEntity =
//       WarehouseModel(data: List<Datum>.empty(growable: true)).obs;
//   var WarehouseModelEntity2 =
//       WareHouseModelnew(data: List<Datu>.empty(growable: true)).obs;

//   var manufactureModelEntity =
//       ManuFactureModel(dataone: List<DatumOne>.empty(growable: true)).obs;

//   var FilterProductModelEntity = FilterProductModel(
//       data2: NewData(
//     data3: List<Datumproduct>.empty(growable: true),
//   )).obs;

//   var productButtonModelEntity =
//       SelectButtonModel(productSpecs: ProductSpecs()).obs;

//   var AddToOrderButtonModelEntity = AddToOrderButtonModel(data7: Data7()).obs;

//   var AdjustmentListModelEntity =
//       AdjustmentListModel(data9: List<Data9>.empty(growable: true)).obs;

//   var AddAdjustmentsToOrdersModelEntity =
//       AddAdjustmentToOrderModel(data10: Data10()).obs;
//   var deleteproductmodelEntity = DeletProductModel().obs;

//   var RemoveAdjustmentModelEntity = RemoveAdjustment().obs;

//   var CreateOrderModelEntity = CreateOrderModel().obs;

//   var BulklistModelEntity =
//       BulklistModel(dataOr2: DataOr2(), dataOr1: DataOr1());

//   final selectButtonToAddToOrders = false.obs;
//   final addToOrders = false.obs;
//   final addToOrders1 = false.obs;
//   final addadjustments = true.obs;

  final GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
//   final GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
//   final GlobalKey<FormState> formKey3 = GlobalKey<FormState>();
//   final GlobalKey<FormState> formKey4 = GlobalKey<FormState>();
//   final GlobalKey<FormState> formKey5 = GlobalKey<FormState>();
//   final GlobalKey<FormState> formKey6 = GlobalKey<FormState>();

//   void checkProductButton() {
//     // customerNameValidator("a");
//     // warehouseNamevalidator("b");
//     // manufacturerNameValidator("c");
//     // productNameValidator("d");
//     final isValid1 = formKey1.currentState!.validate();
//     final isValid2 = formKey2.currentState!.validate();
//     final isValid3 = formKey3.currentState!.validate();
//     final isValid4 = formKey4.currentState!.validate();
//     Get.focusScope!.unfocus();

//     if (isValid1 && isValid2 && isValid3 && isValid4) {
//       formKey1.currentState!.save();
//       formKey2.currentState!.save();
//       formKey3.currentState!.save();
//       formKey4.currentState!.save();
//     }
//   }

//   // fieldRefresh() {
//   //   // customerController1.value.clear();
//   //   // customerController2.value.clear();
//   //   // productController.value.clear();
//   //   // productController1.value.clear();
//   //   // quantityController.value.clear();
//   //   // quantityController1.value.clear();
//   //   // operatorController.value.clear();
//   // }

//   listRefresh() {
//     manufactureModelEntity.value =
//         ManuFactureModel(dataone: List<DatumOne>.empty(growable: true));
//   }

//   var users = <HouseUser>[HouseUser("0", "select warehouse")].obs;
//   var warehouseselected = "0".obs;
//   void setSelected(String value) {
//     warehouseselected.value = value;
//   }

//   var totalValue = (0).obs;

//   var manufactureselected = '0'.obs;
//   void setSelected2(String value) {
//     manufactureselected.value = value;
//   }

//   var adjustmentselected = "0".obs;

//   void setSelected3(String value) {
//     adjustmentselected.value = value;
//   }

//   var users2 = <User2>[User2("0", "select manufacture")].obs;

  String? customerNameValidator(String value) {
    if (customerController1.value.text.isEmpty ||
        customerController1.value.text.length < 1) {
      debugPrint("verified");
      return 'Select Customer';
    } else {}
    return null;
  }

//   String? warehouseNamevalidator(String value) {
//     if (value == null || warehouseselected.value == '0') {
//       return 'selected warehouse';
//     }
//     return null;
//   }

//   String? manufacturerNameValidator(String value) {
//     if (value == null || manufactureselected.value == '0') {
//       return 'Select Manufacturer';
//     }
//     return null;
//   }

//   String? productNameValidator(String value) {
//     if (productController1.value.text.isEmpty ||
//         productController1.value.text.length < 1) {
//       return 'select product';
//     }
//     return null;
//   }

//   // final bulkAddAdjustmentslist = Rx<List<Data10> >

//   //=============================================>Warehouse variables

//   final bulkAddAdjustmentslist = Rx<List<dynamic>>([]).obs;
//   final orderBulklist = Rx<List<dynamic>>([]).obs;
//   // final fulltotal = (0.0).obs;
//   //String totalAmount = '0';
//   RxDouble total1 = (0.0).obs;
//   var total2 = 0.0;
//   RxDouble grandTotal = (0.0).obs;
//   var adjustment = 0.0;

//   final indexf = "".obs;

//   @override
//   void onInit() async {
//     // await customerDetailApi('a');

//     // manuFactureApi();

//     // filterProductApi();
//     // productButtonApi();

//     // await addAdjustmentOrderconfirmApi("");

//     super.onInit();
//     await WareHouseApi();
//     await adjustmentlistApi();
//     // addToOrdersApi();
//   }

//   @override
//   void onClose() {
//     customerController1.value.dispose();
//     customerController2.value.dispose();
//     warehouseselected.value = '0';
//     manufactureselected.value = '0';
//     productController.value.dispose();
//     productController1.value.dispose();
//     super.onClose();
//     // update();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   filediterator() {
//     //var temp = users.value.first;
//     // users2.value.clear(); //for manufactures
//     //users.add(temp);
//     //users2.value = [User2("0", "select manufacturer")];
//   }

// //---------------oninit call of controller-----------------\\

//   Future<void> WareHouseApi() async {
//     var baseUrl = 'winemonger.nintriva.com';
//     var endpoint = 'api/list/warehouses';
//     var headers = {
//       'APIKEY': apiKey,
//       'Cookie': cooKie,
//     };
//     var url = Uri.http(baseUrl, endpoint);

//     // Await the http get response, then decode the json-formatted response.
//     try {
//       var response = await http.get(
//         url,
//         headers: headers,
//       );
//       print(response);
//       if (response.statusCode == 200) {
//         WarehouseModelEntity.value =
//             WarehouseModel.fromJson(jsonDecode(response.body));
//         for (int i = 0; i < WarehouseModelEntity.value.data.length; i++) {
//           users.add(HouseUser(
//               WarehouseModelEntity.value.data[i].warehouseId ?? "",
//               WarehouseModelEntity.value.data[i].warehouseName ?? ""));
//           //   }
//           // if (response.statusCode == 200) {
//           //   WarehouseModelEntity2.value =
//           //       WareHouseModelnew.fromJson(jsonDecode(response.body));
//           //   for (int i = 0; i < WarehouseModelEntity2.value.data.length; i++) {
//           //     users.add(HouseUser(
//           //         WarehouseModelEntity2.value.data[i].warehouseId ?? "",
//           //         WarehouseModelEntity2.value.data[i].warehouseSku ?? ""));
//         }

//         // print('success');
//       } else {
//         // print('failed');
//         throw Exception('failed to load');
//       }
//       // print(WarehouseModelEntity.value.toJson());
//     } catch (e) {
//       //print(() => e.toString());
//     }
//     update();
//   }

//   Future<void> customerDetailApi(value) async {
//     var baseUrl = 'winemonger.nintriva.com';
//     var endpoint = 'apiV1/customers/customerName';
//     var headers = {
//       'APIKEY': apiKey,
//       'Cookie': cooKie,
//     };
//     debugPrint("------------Customer api start---------");
//     debugPrint(customerController1.value.text);
//     var url =
//         Uri.http(baseUrl, endpoint, {'customer': '${value}', 'wholesale': '1'});
//     try {
//       var response = await http.get(url, headers: headers);
//       print(response.body.toString());
//       if (response.statusCode == 200) {
//         CustomerModelEntity.value =
//             CustomerModel.fromJson(jsonDecode(response.body));
//         print(CustomerModelEntity.value.toJson());
//         debugPrint("--------------customer API succees End-----------");
//       } else {
//         debugPrint("-------- customer API failed End---------");
//         throw Exception('failed end');
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//     update();
//   }

//   Future<void> manuFactureApi() async {
//     var _baseUrl = 'winemonger.nintriva.com';
//     var endpoint = 'api/search/manufacturers';
//     var headers = {'APIKEY': apiKey, 'Cookie': cooKie};
//     var url = Uri.http(
//       _baseUrl,
//       endpoint,
//     );
//     try {
//       var response = await http.post(url,
//           headers: headers,
//           body: jsonEncode({'warehouse_id': '${warehouseselected.value}'}));
//       print("resp:$response");
//       if (response.statusCode == 200) {
//         users2.clear();
//         users2.value = <User2>[User2("0", "select manufacture")];
//         manufactureModelEntity.value =
//             ManuFactureModel.fromJson(jsonDecode(response.body));
//         for (int i = 0; i < manufactureModelEntity.value.dataone!.length; i++) {
//           users2.add(User2(
//             manufactureModelEntity.value.dataone![i].manId,
//             manufactureModelEntity.value.dataone![i].manName,
//           ));
//         }

//         // print("active");
//         // print(manufactureModelEntity.value.toJson());
//       } else {
//         print(" not active");
//         throw Exception('failed to load');
//       }
//     } catch (e) {
//       print(() => e.toString());
//     }
//     update();
//   }

//   Future<void> filterProductApi() async {
//     var _baseUrl = 'winemonger.nintriva.com';
//     var endpoint = 'apiV1/orders/filterProduct';
//     var headers = {'APIKEY': apiKey, 'Cookie': cooKie};
//     var url = Uri.http(
//       _baseUrl,
//       endpoint,
//     );
//     try {
//       var response = await http.post(url,
//           headers: headers,
//           body: jsonEncode({
//             'filters': {
//               'wholesale': 1,
//               'warehouse_id': '${warehouseselected.value}',
//               'manufacturer': '${manufactureselected.value}'
//             }
//           }));

//       if (response.statusCode == 200) {
//         FilterProductModelEntity.value =
//             FilterProductModel.fromJson(jsonDecode(response.body));
//         print("data found");
//         print(response.toString());
//         print(FilterProductModelEntity.value.toJson());
//       } else {
//         print(" no data found");
//         throw Exception('failed to load');
//       }
//     } catch (e) {
//       print(() => e.toString());
//     }
//     update();
//   }

//   Future<void> productButtonApi() async {
//     var baseUrl = 'winemonger.nintriva.com';
//     var endpoint = 'api/view/products';
//     var headers = {'APIKEY': apiKey, 'Cookie': cooKie};

//     var url = Uri.http(
//       baseUrl,
//       endpoint,
//     );
//     try {
//       var response = await http.post(
//         url,
//         headers: headers,
//         body: jsonEncode({"id": '${productController1.value.text}'}),
//       );
//       print(response);
//       if (response.statusCode == 200) {
//         productButtonModelEntity.value =
//             SelectButtonModel.fromJson(jsonDecode(response.body));
//         print("button active");
//         print(productButtonModelEntity.value.toJson());
//       } else {
//         print("button inactive");
//         throw Exception("failed to select button");
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//     update();
//   }

//   Future<void> addToOrdersValidations() async {
//     final isValid5 = formKey5.currentState!.validate();
//     Get.focusScope!.unfocus();

//     if (isValid5) {
//       formKey5.currentState!.save();
//       await addToOrdersApi(
//         product_id: productButtonModelEntity.value.id,
//         qty: quantityController.value.text,
//         line_sku: productButtonModelEntity.value.sku,
//         line_dsc: productButtonModelEntity.value.name,
//         line_value: productButtonModelEntity.value.wholesalePrice,
//         // total_pre_orderline_id:
//         //     AddToOrderButtonModelEntity.value.data7.totalPreOrderlineId,
//         // total: AddToOrderButtonModelEntity.value.data7.total,
//         // pre_orderline_id:
//         //     AddToOrderButtonModelEntity.value.data7.preOrderlineId,
//         // // discount_total:addToOrders.
//         // product_ware_house_id:
//         //     AddToOrderButtonModelEntity.value.data7.productWareHouseId,
//         // line_number: AddToOrderButtonModelEntity.value.data7.lineNumber
//       );

//       addToOrders.value = true;
//       selectButtonToAddToOrders.value = false;
//       await bulklist1Api();
//       await totalcalculation();

//       // print(customerController1.value.text);
//     }
//   }

//   Future<void> bulklist1Api() async {
//     bulkAddAdjustmentslist.value.value
//         .add(AddToOrderButtonModelEntity.value.data7);
//     // Operation();
//   }

//   Future<void> addToOrdersApi({
//     product_id,
//     qty,
//     line_sku,
//     line_dsc,
//     line_value,
//     // total_pre_orderline_id,
//     // total,
//     // pre_orderline_id,
//     // // discount_total,
//     // product_ware_house_id,
//     // line_number
//   }) async {
//     var baseUrl = 'winemonger.nintriva.com';
//     var endpoint = 'api/create/preOrderLines';
//     var headers = {"APIKEY": apiKey, 'Cookie': cooKie};

//     print(product_id.runtimeType);
//     print(qty.runtimeType);
//     print(line_sku.runtimeType);
//     // print(linedsc);
//     print(line_value.runtimeType);
//     print(customerController2.value.runtimeType);

//     // print(
//     //     "total_pre_orderline_id:${AddToOrderButtonModelEntity.value.data7.totalPreOrderlineId}");
//     // print(total);
//     // print(pre_orderline_id);
//     // print(product_ware_house_id);
//     // print(line_number);

//     var url = Uri.http(baseUrl, endpoint);
//     try {
//       var response = await http.post(
//         url,
//         headers: headers,
//         body: jsonEncode(
//           {
//             "OrdersLines": {
//               "product_id":
//                   // "2852",
//                   "$product_id",
//               "qty":
//                   // "12",
//                   "${qty}",
//               "line_sku":
//                   // "BV026",
//                   "${line_sku}",
//               "line_dsc":
//                   // "Bio Vio Aimone Vermentino 2016",
//                   "${line_dsc}",
//               "line_value":
//                   // "16.5000",
//                   "${line_value}"
//             },
//             "customer_id": "1243",
//             //"${customerController1.value.text}",
//             "total_pre_orderline_id": "",
//             "pre_orderline_id": "",
//             "total": "",
//             "discount_total": "",
//             "product_ware_house_id": "",
//             // "$product_ware_house_id",
//             "line_number": ""
//             //  "$line_number"
//           },
//         ),
//       );
//       print(response);
//       if (response.statusCode == 200) {
//         AddToOrderButtonModelEntity.value =
//             AddToOrderButtonModel.fromJson(jsonDecode(response.body));
//         // await totalcalculation();

//         print("...addto......");
//         print(AddToOrderButtonModelEntity.value.toJson());
//       } else {
//         print("no...data... found..");
//         throw Exception('failed to select product');
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//     update();
//   }

//   Map<String, String> newMap = {
//     '1': '-',
//     '2': '-',
//     '3': '-',
//     '4': '-',
//     '5': '-',
//     '6': '-',
//     '7': '+',
//     '8': '+',
//     '9': '+',
//     '10': '+',
//     '12': '+',
//     '13': '+',
//     '14': '+',
//     '15': '+',
//   };

//   totalcalculation() async {
//     // var total2 = 0.0;
//     for (var amount in bulkAddAdjustmentslist.value.value) {
//       // print(amount.total!);
//       var agregate = double.tryParse(amount.total!.toString());

//       total2 += agregate!;
//       print(agregate.runtimeType);
//       print("-=-=-=-$agregate-=-=-=-=-=-");
//       print(total2);
//     }

//     total1.value = total2;
//     print("%%%%%%%${total1.value}%%%%%%%%");
//   }

//   totalAfterAdjustment() {
//     adjustment = double.tryParse(quantityController1.value.text)!;

//     // grandTotal.value= total2-adjustment;
//     print("findIndex:${indexf.value}");
//     print("findIndex:${indexf.value.runtimeType}");
//     Function deepEq = const DeepCollectionEquality().equals;
//     var isSuccess = deepEq(indexf.value, "-");

//     if (isSuccess) {
//       grandTotal.value = total2 + adjustment;
//     } else {
//       grandTotal.value = total2 - adjustment;
//     }

//     print("haiii${grandTotal.value}helio");
//     print("adjustment value:${adjustment}");
//   }

//   void removeToOrders() async {
//     await removeToOrdersApi(
//         totalPreOrderlineId:
//             AddToOrderButtonModelEntity.value.data7.totalPreOrderlineId,
//         lineNumber: AddToOrderButtonModelEntity.value.data7.lineNumber,
//         del_warehouseId: deleteproductmodelEntity.value.delWarehouseId,
//         del_lineNumber: deleteproductmodelEntity.value.delLineNumber);
//     addToOrders.value = false;
//   }

//   void removeToAdjustment() async {
//     await removeAdjustmentAPi();
//     addadjustments.value = false;
//   }

//   Future<void> removeToOrdersApi(
//       {id,
//       totalPreOrderlineId,
//       total,
//       lineNumber,
//       del_warehouseId,
//       del_lineNumber}) async {
//     var baseUrl = 'winemonger.nintriva.com';
//     var endpoint = 'api/delete/preOrderLines';
//     var headers = {
//       // 'Accept': 'application/json, text/plain, */*',
//       // "Content-Type": "text/plain;charset=UTF-8",
//       "APIKEY": apiKey,
//       'Cookie': cooKie,
//     };

//     var url = Uri.http(baseUrl, endpoint);
//     try {
//       var response = await http.delete(
//         url,
//         headers: headers,
//         body: jsonEncode(
//           {
//             "id":
//                 // "1673630",
//                 "$id",
//             "total":
//                 //  198,
//                 total,
//             "total_pre_orderline_id":
//                 //"167630",
//                 "$totalPreOrderlineId",
//             "line_number": lineNumber,
//             // "1",
//             "del_warehouse_id": del_warehouseId,
//             // 0,
//             "del_lineNumber": del_lineNumber
//             // "1"
//           },
//         ),
//       );
//       print(response.toString());
//       print(response.statusCode);
//       if (response.statusCode == 200) {
//         deleteproductmodelEntity.value =
//             DeletProductModel.fromJson(jsonDecode(response.body));

//         //isInitialized.value = true;
//         print('deleted product');
//         print(AddToOrderButtonModelEntity.value.toJson());
//       } else {
//         print('HI');
//         throw Exception('Failed to delete product');
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//     update();
//   }

//   adjustmentView() {
//     addToOrders.value = true;
//     addadjustments.value = false;
//   }

//   Future<void> adjustmentlistApi() async {
//     var baseUrl = 'winemonger.nintriva.com';
//     var endpoint = 'api/list/adjustments';
//     var headers = {
//       "APIKEY": apiKey,
//       'Cookie': cooKie,
//     };
//     try {
//       var url = Uri.http(baseUrl, endpoint);

//       var response = await http.get(
//         url,
//         headers: headers,
//       );
//       print(response);
//       if (response.statusCode == 200) {
//         AdjustmentListModelEntity.value =
//             AdjustmentListModel.fromJson(jsonDecode(response.body));
//         print("Adjustment active");
//         print(AdjustmentListModelEntity.value.toJson());
//       } else {
//         print("adjustmet faild");
//         throw Exception('failed to select adjstmnt');
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//     update();
//   }

//   Future<void> bulklistApi() async {
//     bulkAddAdjustmentslist.value.value
//         .add(AddAdjustmentsToOrdersModelEntity.value.data10);

//     update();
//   }

//   void addAdjustmentOrder(operator) async {
//     final isValid6 = formKey6.currentState!.validate();
//     Get.focusScope!.unfocus();
//     if (isValid6) {
//       formKey6.currentState!.save();
//       // addToOrders1.value = false;
//       print("////${quantityController1.value.text}////");
//       await addAdjustmentOrderconfirmApi(operator);
//       // addToOrders1.value = false;
//       await bulklistApi();
//       addToOrders1.value = false;
//       update();
//       refresh();
//     }
//   }

//   Future<void> addAdjustmentOrderconfirmApi(operator) async {
//     var _baseUrl = 'winemonger.nintriva.com';
//     var endpoint = 'api/create/preOrderLines';
//     var headers = {
//       "APIKEY": apiKey,
//       'Cookie': cooKie,
//     };
//     print(adjustmentselected.value as String);
//     print('$operator ${quantityController1.value.text}');
//     print('$operator ${quantityController1.value.text}');
//     var url = Uri.http(_baseUrl, endpoint);
//     try {
//       debugPrint("-------------ADJUSTMENT API START---------");
//       var response = await http.post(
//         url,
//         headers: headers,
//         body: jsonEncode({
//           "OrdersLines": {
//             "qty": 1,
//             "adjustment_id":
//                 //  "1",
//                 "${adjustmentselected.value}",
//             "line_value":
//                 // "-10.00"
//                 "${operator}${quantityController1.value.text}"
//           },
//           "customer_id": "1243",
//           "total_pre_orderline_id": "",
//           // "1673259",
//           "pre_orderline_id": "",
//           // "10012334",
//           "total":
//               // "16.60",
//               "${operator}${quantityController1.value.text}",
//           "discount_total": "",
//           "product_ware_house_id": "29",
//           "line_number": 2,
//         }),
//       );
//       print(response);
//       if (response.statusCode == 200) {
//         AddAdjustmentsToOrdersModelEntity.value =
//             AddAdjustmentToOrderModel.fromJson(jsonDecode(response.body));
//         //isInitialized.value = true;

//         print('addadjustment active;,,,,,,,');
//         print(AddAdjustmentsToOrdersModelEntity.value.toJson());
//         debugPrint("-------------ADJUSTMENT API succes end---------");

//         findIndex(operator);
//         print(operator);
//       } else {
//         debugPrint("-------------ADJUSTMENT API failed end--------");
//         print('addadjstmt faild.....');
//         throw Exception('Failed to SELECT product');
//       }
//     } catch (e) {
//       debugPrint("-------------ADJUSTMENT API catch end---------");
//       print(e.toString());
//     }
//     update();
//   }

//   findIndex(dynamic operator) {
//     indexf.value = operator.toString();
//   }

//   Future<void> removeAdjustmentAPi({id, total, totalPreorderlineid}) async {
//     var baseUrl = 'winemonger.nintriva.com';
//     var endpoint = 'api/delete/preOrderLines';
//     var headers = {
//       "APIKEY": apiKey,
//       'Cookie': cooKie,
//     };

//     var url = Uri.http(baseUrl, endpoint);
//     try {
//       var response = await http.delete(
//         url,
//         headers: headers,
//         body: jsonEncode(
//           {
//             "id": "${id}",
//             "total": total,
//             "total_pre_orderline_id": "${totalPreorderlineid}",
//             "line_number": 5,
//             "del_warehouse_id": 0,
//             "del_lineNumber": 5
//           },
//         ),
//       );
//       print(response);
//       if (response.statusCode == 200) {
//         RemoveAdjustmentModelEntity.value =
//             RemoveAdjustment.fromJson(jsonDecode(response.body));
//         //isInitialized.value = true;
//         print('deleted adjproduct');
//         print(AddToOrderButtonModelEntity.value.toJson());
//       } else {
//         print('HI');
//         throw Exception('Failed to delete adjproduct');
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//     update();
//   }

//   // Future<void> bulklist3Api() async {
//   //   List bulklist =
//   // }

//   Future<void> bulklist3Api() async {
//     // orderBulklist.value.value.add(AddToOrderButtonModelEntity.value.data7);
//     // orderBulklist.value.value
//     //     .add(AddAdjustmentsToOrdersModelEntity.value.data10);
//     // debugPrint(orderBulklist.value.value.toString());
//     // addToOrders.value = true;
//     // update();
//     await createOrderValidation();
//   }

//   Future<void> createOrderValidation() async {
//     await createOrderApi(
//       orderlineIds: {
//         AddAdjustmentsToOrdersModelEntity.value.data10.id,
//         AddToOrderButtonModelEntity.value.data7.id
//       },
//       manufacturer: manufactureselected.value,
//       preorderlineId: AddToOrderButtonModelEntity.value.data7.preOrderlineId,
//     );

//     // await createOrderApi();
//     addToOrders.value = true;
//     // addadjustments.value = false;
//   }

//   Future<void> createOrderApi(
//       {orderlineIds, manufacturer, preorderlineId}) async {
//     var baseUrl = 'winemonger.nintriva.com';
//     var endpoint = '/api/create/orders';
//     var headers = {
//       "APIKEY": apiKey,
//       'Cookie': cooKie,
//     };

//     try {
//       debugPrint("----------Create order API START-------");
//       var url = Uri.http(baseUrl, endpoint);
//       var response = await http.post(
//         url,
//         headers: headers,
//         body: jsonEncode({
//           "Orders": {
//             "customer_id": "1212",
//             "total": "120.00",
//             "is_wholesale": 1,
//             "owner_user_id": "101",
//             "new_owner_user_id": "",
//             "set_new_owner": 0
//           },
//           "is_mobile": 1,
//           "order_line_ids":

//               // "",
//               // "1673683",
//               orderlineIds.toString(),
//           "manufacturer":
//               // "",
//               // "253",
//               manufacturer,
//           "product_id": "",
//           "qty":
//               // "",
//               " ${quantityController1.value.text}",
//           "line_sku": "",
//           "line_dsc": "",
//           "adjustment_id": "",
//           "pre_orderline_id":
//               // "",
//               // "10012334",
//               preorderlineId,
//           "order_payment_id": ""
//         }),
//       );
//       print('---${response.body}-----');
//       if (response.statusCode == 200) {
//         CreateOrderModelEntity.value =
//             CreateOrderModel.fromJson(jsonDecode(response.body));
//         showsuccessSnackbar(
//             title: "Success", message: "Successfully create the order!");
//         debugPrint("----------Create order API succes End-------");
//         print("oder created");
//         print(CreateOrderModelEntity.value.toJson());
//       } else {
//         debugPrint("---------- API failed End-------");
//         print("failed to create order");
//         showErrorSnackbar(title: "failed", message: "failed to create order");

//         throw Exception();
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//     update();
//   }
}




















//========================================================>warehouse api call & functions


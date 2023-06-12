import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:collection/collection.dart';

import '../../../../applogin/app_string.dart';
import '../../../../mixins/snackbar_mixin.dart';

import 'package:http/http.dart' as http;

import '../../../../models/customer_model.dart';
import '../../../../models/ordermodel/create_order/wholesale/orderwholesaleadjustmentlistmodel.dart';
import '../../../../models/ordermodel/create_order/wholesale/orderwholesalecreateorder.dart';
import '../../../../models/ordermodel/create_order/wholesale/orderwholesalefilterproductmodel.dart';
import '../../../../models/ordermodel/create_order/wholesale/orderwholesalemanufacturermodel.dart';
import '../../../../models/ordermodel/create_order/wholesale/orderwholesaleselectaddadjustmentstoordersmodel.dart';
import '../../../../models/ordermodel/create_order/wholesale/orderwholesaleselectaddtoordersmodel.dart';
import '../../../../models/ordermodel/create_order/wholesale/orderwholesaleselectproductbuttonmodel.dart';
import '../../../../models/warehouse_model.dart';
import 'widgets/Adjustment/adjustment_widget.dart';
import 'widgets/manufacture/manufacture_widgets.dart';
import 'widgets/warehouse/warehouse_widget.dart';

class WholeSaleCreateController extends GetxController with SnackbarMixin {




  final _isLoadingWarehouse = true.obs;
  bool get isLoadingWarehouse => _isLoadingWarehouse.value;

  final _isLoadingManufacture = true.obs;
  bool get isLoadingManufacture => _isLoadingManufacture.value;

  final _isLoadingProduct = true.obs;
  bool get isLoadingProduct => _isLoadingProduct.value;

  final _isLoadingAdjustment = true.obs;
  bool get isLoadingAdjustment => _isLoadingAdjustment.value;


  final _isProductButtonProgress=true.obs;
  bool get isProductButtonProgress=>_isProductButtonProgress.value;

  var isLoading = false.obs;

  var customerController1 = TextEditingController().obs;
  var customerController2 = TextEditingController().obs;
  var productController = TextEditingController().obs;
  var productController1 = TextEditingController().obs;
  var quantityController = TextEditingController().obs;
  var quantityController1 = TextEditingController().obs;
  var operatorController = TextEditingController().obs;

//---model entity--------------------//
  var customerModelEntity =
      CustomerModel(data1: List<Data1>.empty(growable: true)).obs;

  var warehouseModelEntity =
      WarehouseModel(data: List<Datum>.empty(growable: true)).obs;
//   var WarehouseModelEntity2 =
//       WareHouseModelnew(data: List<Datu>.empty(growable: true)).obs;

  var manufactureModelEntity = OrderWholesaleManufacturerModel(
    data3: List<Data3>.empty(growable: true),
  ).obs;

  var filterProductModelEntity = OrderWholesaleFilterProductModel(
      data4: Data4(
    data5: List<Data5>.empty(growable: true),
  )).obs;

  var productButtonModelEntity =
      OrderWholesaleSelectProductbuttomModel(productSpecs: ProductSpecs()).obs;

  var addToOrderButtonModelEntity =
      OrderWholesaleSelectAddToOrdersModel(data7: Data7()).obs;

  var adjustmentListModelEntity = OrderWholesaleAdjustmentListModel(
          data9: List<Data9>.empty(growable: true))
      .obs;

  var addAdjustmentsToOrdersModelEntity =
      OrderWholesaleSelectAddAdjustmentsToOrdersModel(data10: Data10()).obs;
//   var deleteproductmodelEntity = DeletProductModel().obs;

//   var RemoveAdjustmentModelEntity = RemoveAdjustment().obs;

  var createOrderModelEntity = OrderWholeSaleCreateOrderModel().obs;

//   var BulklistModelEntity =
//       BulklistModel(dataOr2: DataOr2(), dataOr1: DataOr1());

  final selectButtonToAddToOrders = false.obs;
  final addToOrders = false.obs;
  final addToOrders1 = false.obs;
  final addadjustments = true.obs;

  final GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey3 = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey4 = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey5 = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey6 = GlobalKey<FormState>();


changeProductButtonStateFalse(){

  _isProductButtonProgress.value=false;
  update();
}
changeProductButtonStateTrue(){

  _isProductButtonProgress.value=true;
  update();
}
  

  void checkProductButton() {
    final formKey1State = formKey1.currentState;
    final formKey2State = formKey2.currentState;
    final formKey3State = formKey3.currentState;
    final formKey4State = formKey4.currentState;
    final isValid1 = formKey1State!.validate();
    final isValid2 = formKey2State!.validate();
    final isValid3 = formKey3State!.validate();
    final isValid4 = formKey4State!.validate();

    Get.focusScope!.unfocus();

    if (isValid1 && isValid2 && isValid3 && isValid4) {
      formKey1State.save();
      formKey2State.save();
      formKey3State.save();
      formKey4State.save();
    }
  }

 

  var users = <HouseUser>[const HouseUser("0", "select warehouse")].obs;
  var warehouseselected = "0".obs;
  void setSelected(String value) {
    warehouseselected.value = value;
  }

//   var totalValue = (0).obs;
  var users2 = <User2>[User2("0", "select manufacture")].obs;
  var manufactureselected = '0'.obs;
  void setSelected2(String value) {
    manufactureselected.value = value;
  }

  String? customerNameValidator(String value) {
    if (customerController1.value.text.isEmpty ||
        customerController1.value.text.length < 1) {
      debugPrint("verified");
      return 'Select Customer';
    } else {}
    return null;
  }

  String? warehouseNamevalidator(String value) {
    if (value == null || warehouseselected.value == '0') {
      return 'selected warehouse';
    }
    return null;
  }

  String? manufacturerNameValidator(String value) {
    if (value == null || manufactureselected.value == '0') {
      return 'Select Manufacturer';
    }
    return null;
  }

  String? productNameValidator(String value) {
    if (productController1.value.text.isEmpty ||
        productController1.value.text.length < 1) {
      return 'select product';
    }
    return null;
  }
  // var adjusers = <AdjUser>[const AdjUser("0", "Select adjustment")].obs;

  var adjustmentselected = "0".obs;
  var adjusers = <AdjUser>[const AdjUser("0", "Select Adjustments")];

  void setSelected3(String value) {
    adjustmentselected.value = value;
  }

//   // final bulkAddAdjustmentslist = Rx<List<Data10> >

//   //=============================================>Warehouse variables

  final bulkAddAdjustmentslist = Rx<List<dynamic>>([]).obs;
  final orderBulklist = Rx<List<dynamic>>([]).obs;
//   // final fulltotal = (0.0).obs;
//   //String totalAmount = '0';
  RxDouble total1 = (0.0).obs;
  var total2 = 0.0;
  RxDouble grandTotal = (0.0).obs;
  var adjustment = 0.0;

  final indexf = "".obs;

  @override
  void onInit() async {
    await WareHouseApi();

    
          await adjustmentlistApi();
    

    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    customerController1.value.clear();
    customerController2.value.clear();
    warehouseselected.value = '0';
    manufactureselected.value = '0';
    productController.value.clear();
    productController1.value.clear();
    super.onClose();
    update();
  }

  @override
  void dispose() {
     customerController1.value.dispose();
    customerController2.value.dispose();
    productController.value.dispose();
    productController1.value.dispose();



    super.dispose();
  }



// //---------------oninit call of controller-----------------\\

  Future<void> WareHouseApi() async {
    var baseUrl = 'winemonger.nintriva.com';
    var endpoint = 'api/list/warehouses';
    var headers = {
      'APIKEY': apiKey,
      'Cookie': cooKie,
    };
    var url = Uri.http(baseUrl, endpoint);

    // Await the http get response, then decode the json-formatted response.
    try {
      _isLoadingWarehouse(true);
      var response = await http.get(
        url,
        headers: headers,
      );

      (response);
      if (response.statusCode == 200) {
        warehouseModelEntity.value =
            WarehouseModel.fromJson(jsonDecode(response.body));
        for (int i = 0; i < warehouseModelEntity.value.data.length; i++) {
          users.add(HouseUser(
              warehouseModelEntity.value.data[i].warehouseId ?? "",
              warehouseModelEntity.value.data[i].warehouseName ?? ""));
        }
        update();
        _isLoadingWarehouse(false);
      } else {
        _isLoadingWarehouse(false);
        throw Exception('failed to load');
      }
    } catch (e) {
      _isLoadingWarehouse(false);
      print(e.toString());
    }
  }

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

  Future<void> manuFactureApi() async {
    var _baseUrl = 'winemonger.nintriva.com';
    var endpoint = 'api/search/manufacturers';
    var headers = {'APIKEY': apiKey, 'Cookie': cooKie};
    var url = Uri.http(
      _baseUrl,
      endpoint,
    );
    try {
      _isLoadingManufacture(true);
      var response = await http.post(url,
          headers: headers,
          body: jsonEncode({'warehouse_id': warehouseselected.value}));
      print("resp:$response");
      if (response.statusCode == 200) {
        users2.clear();
        users2.value = <User2>[User2("0", "select manufacture")];
        manufactureModelEntity.value =
            OrderWholesaleManufacturerModel.fromJson(jsonDecode(response.body));
        for (int i = 0; i < manufactureModelEntity.value.data3.length; i++) {
          users2.add(User2(
            manufactureModelEntity.value.data3[i].manId!,
            manufactureModelEntity.value.data3[i].manName!,
          ));
        }
        update();
        _isLoadingManufacture(false);
        // print("active");
        // print(manufactureModelEntity.value.toJson());
      } else {
        _isLoadingManufacture(false);
        print(" not active");
        throw Exception('failed to load');
      }
    } catch (e) {
      _isLoadingManufacture(false);
      print(() => e.toString());
    }
  }

  Future<void> filterProductApi() async {
    var _baseUrl = 'winemonger.nintriva.com';
    var endpoint = 'apiV1/orders/filterProduct';
    var headers = {'APIKEY': apiKey, 'Cookie': cooKie};
    var url = Uri.http(
      _baseUrl,
      endpoint,
    );
    try {
      _isLoadingProduct(true);
      var response = await http.post(url,
          headers: headers,
          body: jsonEncode({
            'filters': {
              'wholesale': 1,
              'warehouse_id': warehouseselected.value,
              'manufacturer': manufactureselected.value
            }
          }));

      if (response.statusCode == 200) {
        filterProductModelEntity.value =
            OrderWholesaleFilterProductModel.fromJson(
                jsonDecode(response.body));
        print("data found");
        print(response.toString());
        print(filterProductModelEntity.value.toJson());

        update();
        _isLoadingProduct(false);
      } else {
        _isLoadingProduct(false);
        print(" no data found");
        throw Exception('failed to load');
      }
    } catch (e) {
      _isLoadingProduct(false);
      print(() => e.toString());
    }
  }

  Future<void> productButtonApi() async {
    var baseUrl = 'winemonger.nintriva.com';
    var endpoint = 'api/view/products';
    var headers = {'APIKEY': apiKey, 'Cookie': cooKie};

    var url = Uri.http(
      baseUrl,
      endpoint,
    );
    try {

      var response = await http.post(
        url,
        headers: headers,
        body: jsonEncode({"id": productController1.value.text}),
      );
      print(response);
      if (response.statusCode == 200) {
        productButtonModelEntity.value =
            OrderWholesaleSelectProductbuttomModel.fromJson(
                jsonDecode(response.body));
        print("button active");
        print(productButtonModelEntity.value.toJson());
      } else {
        print("button inactive");
        throw Exception("failed to select button");
      }
    } catch (e) {
      print(e.toString());
    }
    update();
  }

  Future<void> addToOrdersValidations() async {
    final isValid5 = formKey5.currentState!.validate();
    Get.focusScope!.unfocus();

    if (isValid5) {
      formKey5.currentState!.save();
      await addToOrdersApi(
        product_id: productButtonModelEntity.value.id,
        qty: quantityController.value.text,
        line_sku: productButtonModelEntity.value.sku,
        line_dsc: productButtonModelEntity.value.name,
        line_value: productButtonModelEntity.value.wholesalePrice,
      );

      addToOrders.value = true;
      selectButtonToAddToOrders.value = false;
      await bulklist1Api();
      update();
      
      await totalcalculation();
    }
  }

  Future<void> bulklist1Api() async {
    bulkAddAdjustmentslist.value.value
        .add(addToOrderButtonModelEntity.value.data7);
    // Operation();
    // bulkAddAdjustmentslist.value.value.removeAt(1);

    refresh();
  }

  Future<void> addToOrdersApi({
    product_id,
    qty,
    line_sku,
    line_dsc,
    line_value,
  }) async {
    var baseUrl = 'winemonger.nintriva.com';
    var endpoint = 'api/create/preOrderLines';
    var headers = {"APIKEY": apiKey, 'Cookie': cooKie};

    print(product_id.runtimeType);
    print(qty.runtimeType);
    print(line_sku.runtimeType);
    // print(linedsc);
    print(line_value.runtimeType);
    print(customerController2.value.runtimeType);

    var url = Uri.http(baseUrl, endpoint);
    try {
      var response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(
          {
            "OrdersLines": {
              "product_id":
                  // "2852",
                  "$product_id",
              "qty":
                  // "12",
                  "$qty",
              "line_sku":
                  // "BV026",
                  "$line_sku",
              "line_dsc":
                  // "Bio Vio Aimone Vermentino 2016",
                  "$line_dsc",
              "line_value":
                  // "16.5000",
                  "$line_value"
            },
            "customer_id": "1243",
            //"${customerController1.value.text}",
            "total_pre_orderline_id": "",
            "pre_orderline_id": "",
            "total": "",
            "discount_total": "",
            "product_ware_house_id": "",
            // "$product_ware_house_id",
            "line_number": ""
            //  "$line_number"
          },
        ),
      );
      print(response);
      if (response.statusCode == 200) {
        addToOrderButtonModelEntity.value =
            OrderWholesaleSelectAddToOrdersModel.fromJson(
                jsonDecode(response.body));
        // await totalcalculation();

        print("...addto......");
        print(addToOrderButtonModelEntity.value.toJson());
      } else {
        print("no...data... found..");
        throw Exception('failed to select product');
      }
    } catch (e) {
      print(e.toString());
    }
    update();
    refresh();
  }

  Map<String, String> newMap = {
    '1': '-',
    '2': '-',
    '3': '-',
    '4': '-',
    '5': '-',
    '6': '-',
    '7': '+',
    '8': '+',
    '9': '+',
    '10': '+',
    '12': '+',
    '13': '+',
    '14': '+',
    '15': '+',
  };

  totalcalculation() async {
    // var agregate;
    total2 = 0;
    for (int i = 0; i < bulkAddAdjustmentslist.value.value.length; i++) {
      var agregate =
          double.parse(bulkAddAdjustmentslist.value.value[i].total!.toString());
      total2 += agregate;
      print(agregate.runtimeType);

      print("wqeqrqrqrt----$agregate-----");
      print(total2);
    }
// bulkAddAdjustmentslist.value.value.removeAt(1);

    total1.value = total2;
    print("%%%%%%%%%%${total1.value}%%%%%%%%%%%%");

    update();
  }

  totalAfterAdjustment() {
    adjustment = double.tryParse(quantityController1.value.text)!;

    // grandTotal.value= total2-adjustment;
    print("findIndex:${indexf.value}");
    print("findIndex:${indexf.value.runtimeType}");
    Function deepEq = const DeepCollectionEquality().equals;
    var isSuccess = deepEq(indexf.value, "-");

    if (isSuccess) {
      grandTotal.value = total2 + adjustment;

      isSuccess = false;
    } else {
      grandTotal.value = total2 - adjustment;

      isSuccess = false;
    }

    print("haiii${grandTotal.value}helio");
    print("adjustment value:${adjustment}");

    update();
  }

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

  adjustmentView() {
    addToOrders.value = true;
    addadjustments.value = false;
  }

  // var adjuser = <AdjUser>[const AdjUser("0", "sSelect Adjustmentse")].obs;

  Future<void> adjustmentlistApi() async {
    var baseUrl = 'winemonger.nintriva.com';
    var endpoint = 'api/list/adjustments';
    var headers = {
      "APIKEY": apiKey,
      'Cookie': cooKie,
    };
    try {
      _isLoadingAdjustment(true);
      var url = Uri.http(baseUrl, endpoint);

      var response = await http.get(
        url,
        headers: headers,
      );
      // print(response);
      if (response.statusCode == 200) {
        adjustmentListModelEntity.value =
            OrderWholesaleAdjustmentListModel.fromJson(
                jsonDecode(response.body));
        // List<AdjUser> users = <AdjUser>[
        //   const AdjUser("0", "Select Adjustments")
        // ];

        for (int i = 0; i < adjustmentListModelEntity.value.data9.length; i++) {
          adjusers.add(
            AdjUser(
                adjustmentListModelEntity.value.data9[i].adjustmentSkuId!,
                adjustmentListModelEntity
                    .value.data9[i].adjustmentSkuDescription!),
          );
        }

        update();
        _isLoadingAdjustment(false);
        print("Adjustment active");
        print(adjustmentListModelEntity.value.toJson());
      } else {
        _isLoadingAdjustment(false);
        print("adjustmet faild");
        throw Exception('failed to select adjstmnt');
      }
    } catch (e) {
      _isLoadingAdjustment(false);
      print(e.toString());
    }
  }

  Future<void> bulklistApi() async {
    bulkAddAdjustmentslist.value.value
        .add(addAdjustmentsToOrdersModelEntity.value.data10);

    update();
    refresh();
  }

  void addAdjustmentOrder(operator) async {
    final isValid6 = formKey6.currentState!.validate();
    Get.focusScope!.unfocus();
    if (isValid6) {
      formKey6.currentState!.save();
      // addToOrders1.value = false;
      print("////${quantityController1.value.text}////");
      await addAdjustmentOrderconfirmApi(operator);
      // addToOrders1.value = false;
      await bulklistApi();
      addToOrders1.value = false;
      update();
      refresh();
    }
  }

  Future<void> addAdjustmentOrderconfirmApi(operator) async {
    var _baseUrl = 'winemonger.nintriva.com';
    var endpoint = 'api/create/preOrderLines';
    var headers = {
      "APIKEY": apiKey,
      'Cookie': cooKie,
    };
    print(adjustmentselected.value as String);
    print('$operator ${quantityController1.value.text}');
    print('$operator ${quantityController1.value.text}');
    var url = Uri.http(_baseUrl, endpoint);
    try {
      debugPrint("-------------ADJUSTMENT API START---------");
      var response = await http.post(
        url,
        headers: headers,
        body: jsonEncode({
          "OrdersLines": {
            "qty": 1,
            "adjustment_id":
                //  "1",
                "${adjustmentselected.value}",
            "line_value":
                // "-10.00"
                "${operator}${quantityController1.value.text}"
          },
          "customer_id": "1243",
          "total_pre_orderline_id": "",
          // "1673259",
          "pre_orderline_id": "",
          // "10012334",
          "total":
              // "16.60",
              "${operator}${quantityController1.value.text}",
          "discount_total": "",
          "product_ware_house_id": "29",
          "line_number": 2,
        }),
      );
      print(response);
      if (response.statusCode == 200) {
        addAdjustmentsToOrdersModelEntity.value =
            OrderWholesaleSelectAddAdjustmentsToOrdersModel.fromJson(
                jsonDecode(response.body));
        //isInitialized.value = true;

        print('addadjustment active;,,,,,,,');
        print(addAdjustmentsToOrdersModelEntity.value.toJson());
        debugPrint("-------------ADJUSTMENT API succes end---------");

        findIndex(operator);
        print(operator);
      } else {
        debugPrint("-------------ADJUSTMENT API failed end--------");
        print('addadjstmt faild.....');
        throw Exception('Failed to SELECT product');
      }
    } catch (e) {
      debugPrint("-------------ADJUSTMENT API catch end---------");
      print(e.toString());
    }
  }

  findIndex(dynamic operator) {
    indexf.value = operator.toString();
  }

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

  Future<void> bulklist3Api() async {
    // orderBulklist.value.value.add(AddToOrderButtonModelEntity.value.data7);
    // orderBulklist.value.value
    //     .add(AddAdjustmentsToOrdersModelEntity.value.data10);
    // debugPrint(orderBulklist.value.value.toString());
    // addToOrders.value = true;
    // update();
    await createOrderValidation();
  }

  Future<void> createOrderValidation() async {
    await createOrderApi(
      orderlineIds: "${addAdjustmentsToOrdersModelEntity.value.data10.id},${addToOrderButtonModelEntity.value.data7.id}",
      manufacturer: manufactureselected.value,
      preorderlineId: addToOrderButtonModelEntity.value.data7.preOrderlineId,
    );

    // await createOrderApi();
    addToOrders.value = true;
    // addadjustments.value = false;
  }

  Future<void> createOrderApi(
      {orderlineIds, manufacturer, preorderlineId}) async {

        print(orderlineIds);
         print(manufacturer);
          print(preorderlineId);

    var baseUrl = 'winemonger.nintriva.com';
    var endpoint = '/api/create/orders';
    var headers = {
      "APIKEY": apiKey,
      'Cookie': cooKie,
    };

    try {
      debugPrint("----------Create order API START-------");
      var url = Uri.http(baseUrl, endpoint);
      var response = await http.post(
        url,
        headers: headers,
        body: jsonEncode({
          "Orders": {
            "customer_id": "1243",
            "total":grandTotal.value.toString() ,
            "is_wholesale": 1,
            "owner_user_id": "101",
            "new_owner_user_id": "",
            "set_new_owner": 0
          },
          "is_mobile": 1,
          "order_line_ids":

              // "",
              // "1673683",
              orderlineIds.toString(),
          "manufacturer":
              // "",
              // "253",
              manufacturer.toString(),
          "product_id": "",
          "qty":
              // "",
              " ${quantityController1.value.text}",
          "line_sku": "",
          "line_dsc": "",
          "adjustment_id": "",
          "pre_orderline_id":
              // "",
              // "10012334",
              preorderlineId.toString(),
          "order_payment_id": ""
        }),
      );
      print('---${response.body}-----');
      if (response.statusCode == 200) {
        createOrderModelEntity.value =
            OrderWholeSaleCreateOrderModel.fromJson(jsonDecode(response.body));
        showSuccessSnackbar(
            title: "Success", message: "Successfully create the order!");
        debugPrint("----------Create order API succes End-------");
        print("oder created");
        print(createOrderModelEntity.value.toJson());
      } else {
        debugPrint("---------- API failed End-------");
        print("failed to create order");
        showErrorSnackbar(title: "failed", message: "failed to create order");

        throw Exception();
      }
    } catch (e) {
      print(e.toString());
    }
    update();
  }
}




















//========================================================>warehouse api call & functions


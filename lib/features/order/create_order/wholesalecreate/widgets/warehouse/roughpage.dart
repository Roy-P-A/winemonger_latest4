// import 'dart:convert';
// import 'dart:io';

// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:winemonger_sonu/applogin/login.dart';
// import 'package:winemonger_sonu/models/warehouse_model.dart';

// class WarehouseController extends GetxController {
//   var house = WarehouseModel(data: List<Datum>.empty(growable: true)).obs;
//   var users = <HouseUser>[HouseUser("0", "select warehouse")].obs;
//   var warehouseselected = "0".obs;
//   void setSelected(String value) {
//     warehouseselected.value = value;
//   }

//   @override
//   void onInit() async {
//     print("call onInit"); // this line not printing
//     getHouseinfo();
//     super.onInit();
//   }

//   getHouseinfo() async {
//     var url = Uri.parse('http://winemonger.nintriva.com//api/list/warehouses');

//     // Await the http get response, then decode the json-formatted response.
//     var response = await http.get(url, headers: {
//       'APIKEY': apiKey,
//       // 'owxdR7uk3HWimq9MO6CleX8Kt',
//       'Cookie': cookie

//       // 'PHPSESSID=d22tlmrgjhqgung2a6ve6g7vkg'
//     });
//     if (response.statusCode == 200) {
//       var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
//       house(WarehouseModel.fromJson(jsonResponse));
//       for (int i = 0; i < house.value.data.length; i++) {
//         users.add(HouseUser(house.value.data[i].warehouseId,
//             house.value.data[i].warehouseName));
//       }
//       //print(ram.toJson());
//       print('success');
//     } else {
//       print('failed');
//     }
//     print(house.toJson());
//   }

//   // tabu() {
//   //   for (int i = 0; i < kim.value.length; i++) {
//   //     for (int i = 0; i < kim.value[2].length; i++) {}
//   //   }
//   // }
// }

// class HouseUser {
//   const HouseUser(this.id, this.name);
//   final String id;
//   final String name;
// }







// import 'dart:convert';

// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

// import 'package:winemonger_sonu/models/warehouse_model.dart';

// class WareHouseController extends GetxController {
//   // var house = WarehouseModel(data: List<Datum>.empty(growable: true)).obs;
//   var house = WarehouseModel(data: List<Datum>.empty(growable: true)).obs;
//   var users = <HouseUser>[HouseUser("0", " select warehouse")].obs;
//   var warehouseselected = "0".obs;
//   void setSelected(String value) {
//     warehouseselected.value;
//   }

//   @override
//   void onInit() async {
//     print("call on init");

//     getInfo();
//     super.onInit();
//   }
// }

// getInfo() async {
//   var url = Uri.parse('http://winemonger.nintriva.com//api/list/warehouses');
//   var response = await http.get(url, headers: {
//     'APIKEY': 'owxdR7uk3HWimq9MO6CleX8Kt',
//     'Cookie': 'PHPSESSID=d22tlmrgjhqgung2a6ve6g7vkg'
//   });
//   if (response.statusCode == 200) {
//     var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
//     (WarehouseModel.fromJson(jsonResponse));
//     for (int i = 0; i < value.data.length; i++) {
//       users.add(HouseUser(
//           house.value.data[i].warehouseId, house.value.data[i].warehouseName));
//     }
//   }
// }

// class HouseUser {
//   final String id;
//   final String name;

//   HouseUser(this.id, this.name);
// }
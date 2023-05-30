import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:dropdown_button2/dropdown_button2.dart';

import '../../wholesale_create_controller.dart';

class WareHouseField extends StatelessWidget {
  const WareHouseField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WholeSaleCreateController>(
        init: WholeSaleCreateController(),
        builder: (controller) {
          return Form(
             key: controller.formKey2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("WareHouse"),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  child: DropdownButtonHideUnderline(
                    child: Obx(
                      () => DropdownButtonFormField2(
                        isExpanded: true,
                        validator: (value) {
                          return controller
                              .warehouseNamevalidator(value as String);
                        },
                        isDense: true,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.only(left: 10, right: 10),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 115, 214, 120)
                                  // Colors.lightBlueAccent
                                  ),
                            ),
                            hintText: "Select warehouse",
                            border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(5))),
                        items: controller.users
                            .map(
                              (item) => DropdownMenuItem<String>(
                                value: item.id,
                                child: Text(
                                  item.name,
                                  // style: DefaultTextStyle.of(context)
                                  //     .style
                                  //     .copyWith(
                                  //         fontStyle: FontStyle.italic),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            )
                            .toList(),
                        icon: const Icon(Icons.keyboard_arrow_down),
                        iconSize: 20,
                        dropdownMaxHeight: 250,
                        itemHeight: 40,
                        itemPadding: const EdgeInsets.only(left: 14, right: 14),
                        buttonHeight: 52,
                        dropdownElevation: 4,
                        dropdownPadding: null,
                        dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            border: Border.all(
                                color: Colors.transparent, width: 0)),
                        scrollbarAlwaysShow: true,
                        scrollbarRadius: const Radius.circular(2),
                        scrollbarThickness: 4,
                        onChanged: (value) async {
                          controller.setSelected(value as String);
                          //controller.listRefresh();

                           await controller.manuFactureApi();
                          print(controller.warehouseselected.value);
                        },
                        value:
                            

                            controller.warehouseselected.value.isNotEmpty
                                ? controller.warehouseselected.value
                                : null,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}

class HouseUser {
  const HouseUser(this.id, this.name);
  final String id;
  final String name;
}























































































































































// // import 'dart:convert';

// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:winemonger_sonu/models/warehouse_model.dart';

// // class SelectWarHouse extends StatefulWidget {
// //   const SelectWarHouse({
// //     Key? key,
// //   }) : super(key: key);

// //   @override
// //   State<SelectWarHouse> createState() => _SelectWarHouseState();
// // }

// // class _SelectWarHouseState extends State<SelectWarHouse> {
// //   var warehouseModel = WarehouseModel(data: List<Datum>.empty(growable: true));
// //   List warHouselist = [];
// //   Future getData() async {
// //     var baseUrl =
// //         Uri.parse("http://winemonger.nintriva.com//api/list/warehouses");
// //     var headers = {
// //       "APIKEY": "owxdR7uk3HWimq9MO6CleX8Kt",
// //       'Cookie': "PHPSESSID=tm9tl5fsubccunsf9jp2qc6s2b",
// //     };

// //     var response = await http.get(baseUrl, headers: headers);
// //     if (response.statusCode == 200) {
// //       var jsonData = json.decode(response.body);
// //       //print(jsonData);

// //       //warHouselist = warHouselist.add(warehouseModel);
// //       setState(() {
// //         warehouseModel = WarehouseModel.fromJson(jsonData);
// //         print(warehouseModel.toJson());
// //       });
// //     }
// //   }

// //   @override
// //   void initState() {
// //     super.initState();
// //     getData();
// //   }

// //   var dropdownvalue;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Text("Warehouse"),
// //         SizedBox(
// //           height: 10,
// //         ),
// //         DropdownButton<String>(items: null, onChanged: (Null) {}, value: null),
// //         Text(warehouseModel.code.toString()),
// //         DropdownButton<dynamic>(
// //           value: dropdownvalue,
// //           items: warHouselist.map(
// //             (item) {
// //               return DropdownMenuItem(child: Text(item['warhouse'].toString()));
// //             },
// //           ).toList(),
// //           onChanged: (newVal) {
// //             setState(() {
// //               dropdownvalue = newVal;
// //             });
// //           },
// //         ),
// //       ],
// //     );
// //   }
// // }

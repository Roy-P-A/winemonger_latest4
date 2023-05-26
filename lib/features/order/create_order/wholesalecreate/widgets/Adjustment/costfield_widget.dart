// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:winemonger_sonu/controller/wholesale_controller.dart';
// import 'package:winemonger_sonu/features/order/create_order/widgets/Adjustment/adjustment_widget.dart';

// class CostTextfield extends StatelessWidget {
//   CostTextfield({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final WholeSaleController controller = Get.find();
//     List<AdjUser> users = <AdjUser>[const AdjUser("0", "Select Adjustments")];

//     for (int i = 0;
//         i < controller.AdjustmentListModelEntity.value.data9.length;
//         i++) {
//       users.add(
//         AdjUser(
//             controller
//                     .AdjustmentListModelEntity.value.data9[i].adjustmentSkuId ??
//                 " ",
//             controller.AdjustmentListModelEntity.value.data9[i]
//                     .adjustmentSkuDescription ??
//                 " "),
//       );
//     }

//     return Obx(() => Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             for (int i = 0;
//                 i < controller.AdjustmentListModelEntity.value.data9.length;
//                 i++)
//               if (controller.adjustmentselected.value ==
//                   controller
//                       .AdjustmentListModelEntity.value.data9[i].adjustmentSkuId)
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text("Sku"),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Container(
//                       width: double.infinity,
//                       padding: const EdgeInsets.all(15),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(5),
//                           color: Colors.grey[200],
//                           border: Border.all(color: Colors.black)),
//                       child: Text(
//                           "${controller.AdjustmentListModelEntity.value.data9[i].adjustmentSku}"),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     const Text("Cost"),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                   ],
//                 ),
//             DropdownButtonHideUnderline(
//               child: DropdownButtonFormField2(
//                 isExpanded: true,
//                 hint: const Text("Select Adjustments"),
//                 decoration: InputDecoration(
//                   isDense: false,
//                   contentPadding: const EdgeInsets.only(
//                       left: 10, right: 10, top: 0, bottom: 0),
//                   fillColor: Colors.white,
//                   filled: true,
//                   focusedBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(
//                           color: Color.fromARGB(255, 115, 214, 120))),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                 ),
//                 items: users
//                     .map((item) => DropdownMenuItem<String>(
//                           value: item.id,
//                           child: Text(
//                             item.name,
//                             style: const TextStyle(
//                               color: Colors.black,
//                             ),
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ))
//                     .toList(),
//                 onChanged: (value) async {
//                   controller.setSelected3(value as String);

//                   // await _controller.filterManufacturerApi();
//                   print(controller.adjustmentselected.value);
//                 },
//                 value: controller.adjustmentselected.value.isNotEmpty
//                     ? controller.adjustmentselected.value
//                     : null,
//                 icon: const Icon(
//                   Icons.keyboard_arrow_down,
//                 ),
//                 iconSize: 20,
//                 iconEnabledColor: Colors.grey,
//                 iconDisabledColor: Colors.grey,
//                 buttonHeight: 52,
//                 itemHeight: 40,
//                 itemPadding: const EdgeInsets.only(left: 14, right: 14),
//                 dropdownMaxHeight: 200,
//                 dropdownPadding: null,
//                 dropdownDecoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(2),
//                 ),
//                 dropdownElevation: 4,
//                 scrollbarRadius: const Radius.circular(2),
//                 scrollbarThickness: 4,
//                 scrollbarAlwaysShow: true,
//               ),
//             ),

//             ///
//           ],
//         ));
//   }
// }

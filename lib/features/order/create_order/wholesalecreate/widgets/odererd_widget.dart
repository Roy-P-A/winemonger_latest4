// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:winemonger_sonu/controller/wholesale_controller.dart';

// class OrderedWidgets extends StatelessWidget {
//   const OrderedWidgets({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<WholeSaleController>(
//         init: WholeSaleController(),
//         builder: (controller) {
//           return Obx(
//             () => Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: 10),
//                 for (int j = 0;
//                     j < controller.bulkAddAdjustmentslist.value.value.length;
//                     j++)
//                   Container(
//                     width: double.infinity,
//                     child: Row(
//                       children: [
//                         Expanded(
//                           flex: 2,
//                           child: Container(
//                             padding: EdgeInsets.all(3),
//                             child: Text(
//                                 "${controller.bulkAddAdjustmentslist.value.value[j].sku}"),
//                           ),
//                         ),
//                         Expanded(
//                           flex: 2,
//                           child: Container(
//                             padding: EdgeInsets.all(3),
//                             child: controller.bulkAddAdjustmentslist.value
//                                         .value[j].value !=
//                                     null
//                                 ? Text(
//                                     "\$${double.parse(controller.bulkAddAdjustmentslist.value.value[j].value!)}")
//                                 : Text(""),
//                           ),
//                         ),
//                         Expanded(
//                           flex: 2,
//                           child: Container(
//                             alignment: Alignment.topLeft,
//                             padding: EdgeInsets.all(3),
//                             child: Text(
//                               "",
//                               textAlign: TextAlign.start,
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           flex: 2,
//                           child: Container(
//                             padding: EdgeInsets.all(3),
//                             child: Text(
//                               "\$${controller.bulkAddAdjustmentslist.value.value[j].total}",
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           flex: 1,
//                           child: InkWell(
//                             child: Icon(Icons.delete),
//                             onTap: () {
//                               //selectButtonToAddToOrders = false;
//                               //_controller.addToOrders.value = false;
//                             },
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//               ],
//             ),
//           );
//         });
//   }
// }

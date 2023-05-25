// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:winemonger/features/order/create_order/wholesalecreate/wholesale_create_controller.dart';

// class OrderedProductWidget extends StatefulWidget {
//   const OrderedProductWidget({Key? key}) : super(key: key);

//   @override
//   State<OrderedProductWidget> createState() => _OrderedProductWidgetState();
// }

// class _OrderedProductWidgetState extends State<OrderedProductWidget> {
//   final WholesaleCreateController _controller = Get.find();
//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             height: 10,
//           ),
//           Container(
//               width: double.infinity,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Expanded(
//                     flex: 2,
//                     child: Container(
//                       padding: EdgeInsets.all(3),
//                       child: Text(
//                         "Product",
//                         style: TextStyle(fontWeight: FontWeight.w600),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 2,
//                     child: Container(
//                       padding: EdgeInsets.all(3),
//                       child: Text(
//                         "Cost",
//                         style: TextStyle(fontWeight: FontWeight.w600),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 2,
//                     child: Container(
//                       padding: EdgeInsets.all(3),
//                       child: Text(
//                         "Quantity",
//                         style: TextStyle(fontWeight: FontWeight.w600),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 2,
//                     child: Container(
//                       padding: EdgeInsets.all(3),
//                       child: Text(
//                         "Amount",
//                         style: TextStyle(fontWeight: FontWeight.w600),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 1,
//                     child: Container(
//                       padding: EdgeInsets.all(3),
//                       child: Text(
//                         "",
//                       ),
//                     ),
//                   ),
//                 ],
//               )),
//           for (int j = 0;
//               j < _controller.bulkAddAdjustmentslist1.value.value.length;
//               j++)
//             if (_controller.bulkAddAdjustmentslist1.value.value[j].sku !=
//                     "Discount" &&
//                 _controller
//                         .bulkAddAdjustmentslist1.value.value[j].sku !=
//                     "Product Samples" &&
//                 _controller.bulkAddAdjustmentslist1.value.value[j].sku !=
//                     "Donation" &&
//                 _controller
//                         .bulkAddAdjustmentslist1.value.value[j].sku !=
//                     "Shipping surcharge" &&
//                 _controller.bulkAddAdjustmentslist1.value.value[j].sku !=
//                     "Breakage" &&
//                 _controller
//                         .bulkAddAdjustmentslist1.value.value[j].sku !=
//                     "Spoiled products" &&
//                 _controller.bulkAddAdjustmentslist1.value.value[j].sku !=
//                     "Other" &&
//                 _controller.bulkAddAdjustmentslist1.value.value[j].sku !=
//                     "Note" &&
//                 _controller.bulkAddAdjustmentslist1.value.value[j].sku !=
//                     "Sales Tax Payable" &&
//                 _controller.bulkAddAdjustmentslist1.value.value[j].sku !=
//                     "Sales Tax California - 7.25%" &&
//                 _controller.bulkAddAdjustmentslist1.value.value[j].sku !=
//                     "Product Samples" &&
//                 _controller.bulkAddAdjustmentslist1.value.value[j].sku !=
//                     "Sales Tax San Francisco - 8.5%" &&
//                 _controller.bulkAddAdjustmentslist1.value.value[j].sku !=
//                     "Sales Tax Marin - 8.25%" &&
//                 _controller.bulkAddAdjustmentslist1.value.value[j].sku !=
//                     "Sales Tax Napa - 7.75%" &&
//                 _controller.bulkAddAdjustmentslist1.value.value[j].sku !=
//                     "PO Number")
//               Container(
//                   width: double.infinity,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Expanded(
//                         flex: 2,
//                         child: Container(
//                           padding: EdgeInsets.all(3),
//                           child: Text(
//                               "${_controller.bulkAddAdjustmentslist1.value.value[j].lineDsc}"),
//                         ),
//                       ),
//                       Expanded(
//                         flex: 2,
//                         child: Container(
//                           padding: EdgeInsets.all(3),
//                           child: _controller.bulkAddAdjustmentslist1.value
//                                       .value[j].value !=
//                                   null
//                               ? Text(
//                                   "\$ ${double.parse(_controller.bulkAddAdjustmentslist1.value.value[j].value!)}")
//                               : Text(""),
//                         ),
//                       ),
//                       Expanded(
//                         flex: 2,
//                         child: Container(
//                           alignment: Alignment.topLeft,
//                           padding: EdgeInsets.all(3),
//                           child: Text(
//                             "${_controller.bulkAddAdjustmentslist1.value.value[j].qty}",
//                             textAlign: TextAlign.start,
//                           ),
//                         ),
//                       ),
//                       (_controller.bulkAddAdjustmentslist1.value.value[j]
//                                   .total !=
//                               null)
//                           ? Expanded(
//                               flex: 2,
//                               child: Container(
//                                 padding: EdgeInsets.all(3),
//                                 child: Text(
//                                   "\$ ${_controller.bulkAddAdjustmentslist1.value.value[j].total.toString()}",
//                                 ),
//                               ),
//                             )
//                           : Container(),
//                       Expanded(
//                         flex: 1,
//                         child: InkWell(
//                           child: Icon(Icons.delete),
//                           onTap: () {
//                             //selectButtonToAddToOrders = false;
//                             _controller.removeToOrdersApi(
//                                 id: _controller
//                                     .bulkAddAdjustmentslist1.value.value[j].id,
//                                 total: _controller.bulkAddAdjustmentslist1.value
//                                     .value[j].total,
//                                 totalPreOrderlineId: _controller
//                                     .bulkAddAdjustmentslist1
//                                     .value
//                                     .value[j]
//                                     .totalPreOrderlineId);
//                           },
//                         ),
//                       ),
//                     ],
//                   ))
//             else
//               Obx(
//                 () => Container(
//                     width: double.infinity,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Expanded(
//                           flex: 2,
//                           child: Container(
//                             padding: EdgeInsets.all(3),
//                             child: Text(
//                                 "${_controller.bulkAddAdjustmentslist1.value.value[j].sku}"),
//                           ),
//                         ),
//                         Expanded(
//                           flex: 2,
//                           child: Container(
//                             padding: EdgeInsets.all(3),
//                             child: _controller.bulkAddAdjustmentslist1.value
//                                         .value[j].value !=
//                                     null
//                                 ? Text(
//                                     "\$ ${double.parse(_controller.bulkAddAdjustmentslist1.value.value[j].value!)}")
//                                 : Text(""),
//                           ),
//                         ),
//                         Expanded(
//                           flex: 2,
//                           child: Container(
//                             alignment: Alignment.topLeft,
//                             padding: EdgeInsets.all(3),
//                             child: Text(
//                               "${_controller.bulkAddAdjustmentslist1.value.value[j].qty}",
//                               textAlign: TextAlign.start,
//                             ),
//                           ),
//                         ),
//                         (_controller.bulkAddAdjustmentslist1.value.value[j]
//                                     .total !=
//                                 null)
//                             ? Expanded(
//                                 flex: 2,
//                                 child: Container(
//                                   padding: EdgeInsets.all(3),
//                                   child: Text(
//                                     "\$ ${_controller.bulkAddAdjustmentslist1.value.value[j].total.toString()}",
//                                   ),
//                                 ),
//                               )
//                             : Container(),
//                         Expanded(
//                           flex: 1,
//                           child: InkWell(
//                             child: Icon(Icons.delete),
//                             onTap: () async {
//                               //selectButtonToAddToOrders = false;
//                               print(_controller.bulkAddAdjustmentslist1.value
//                                   .value[j].id.runtimeType);
//                               print(_controller.bulkAddAdjustmentslist1.value
//                                   .value[j].total.runtimeType);
//                               print(_controller.bulkAddAdjustmentslist1.value
//                                   .value[j].totalPreOrderlineId.runtimeType);
//                               await _controller.removeAdjustmentToOrdersApi(
//                                   id: _controller
//                                       .bulkAddAdjustmentslist1.value.value[j].id
//                                       .toString(),
//                                   total: _controller.bulkAddAdjustmentslist1
//                                       .value.value[j].total,
//                                   totalPreorderlineid: _controller
//                                       .bulkAddAdjustmentslist1
//                                       .value
//                                       .value[j]
//                                       .totalPreOrderlineId
//                                       .toString());
//                             },
//                           ),
//                         ),
//                       ],
//                     )),
//               ),
//         ],
//       ),
//     );
//   }
// }

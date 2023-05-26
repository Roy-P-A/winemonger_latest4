import 'package:flutter/material.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:get/get.dart';
import 'package:winemonger/features/order/create_order/wholesalecreate/wholesale_create_controller.dart';
import 'package:winemonger/features/order/create_order/wholesalecreate/widgets/adjustmentwidget.dart';
import 'package:winemonger/features/order/create_order/wholesalecreate/widgets/confirmingproductwidget.dart';
import 'package:winemonger/features/order/create_order/wholesalecreate/widgets/customertextfieldwidget.dart';
import 'package:winemonger/features/order/create_order/wholesalecreate/widgets/manufacturertextfieldwidget.dart';
import 'package:winemonger/features/order/create_order/wholesalecreate/widgets/orderedproductwidget.dart';
import 'package:winemonger/features/order/create_order/wholesalecreate/widgets/orderedwidget.dart';
import 'package:winemonger/features/order/create_order/wholesalecreate/widgets/producttextfieldwidget.dart';
import 'package:winemonger/features/order/create_order/wholesalecreate/widgets/warehousetextdfieldwidget.dart';
// import 'package:winemonger/models/ordermodel/order_detail_model.dart';

class WholeSaleCreateOrderList extends StatelessWidget {
   WholeSaleCreateOrderList({Key? key}) : super(key: key);

  final WholesaleCreateController _controller =
      Get.put(WholesaleCreateController());
  String? selectedValue;
  dynamic userSelected;

  final TextEditingController typeAheadController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return 
      SingleChildScrollView(
        child: Center(
          child: Container(
            margin:
                const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                // CustomerFieldTextWidget(),
                const SizedBox(
                  height: 20,
                ),
                // WarehouseTextField(),
                const SizedBox(
                  height: 20,
                ),
                // ManufacturerTextField(),
                const SizedBox(
                  height: 20,
                ),
                // ProductTextFieldtWidget(),
                const SizedBox(
                  height: 30,
                ),
                _selectProductButton(context),
                const SizedBox(
                  height: 10,
                ),
                // _controller.selectButtonToAddToOrders.value == true
                //     ? ConfirmingProductWidget()
                //     : Container(),
                // _controller.addToOrders.value == true
                //     ? OrderedProductWidget()
                //     : Container(),

                // AdjustmentWidget(),
                const SizedBox(
                  height: 10,
                ),
                // _totalAndConfirm(context),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      );
    
  }

  //
  Widget _selectProductButton(BuildContext context) {
    return Column(
      children: [
        InkWell(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: const Color(0xffcae3a8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(1, 1), // changes position of shadow
                ),
              ],
            ),
            child: const Text("Select Product",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.black)),
          ),
          onTap: () async {
            // _controller.selectProductButton();
            // await _controller.selectProductApi();
            // if (_controller
            //         .orderWholesaleSelectProductbuttomModelEntity.value.id !=
            //     null) {
            //   _controller.selectButtonToAddToOrders.value = true;
            // }
          },
        ),
      ],
    );
  }

  Widget _totalAndConfirm(BuildContext context) {
    final WholesaleCreateController _controller = Get.find();
    return Obx(
      () => Column(
        children: [
          Row(children: [
            const Expanded(
              flex: 1,
              child: Text(
                'Total',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            // Expanded(
            //   flex: 1,
            //   child: Align(
            //     alignment: Alignment.centerRight,
            //     child: Text(
            //       _controller.totalValue.value.toString(),
            //       style: const TextStyle(fontWeight: FontWeight.bold),
            //     ),
            //   ),
            // ),
          ]),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: const Color(0xffcae3a8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(1, 1), // changes position of shadow
                  ),
                ],
              ),
              child: const Text("Confirm Order",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.black)),
            ),
            onTap: () {
              // _controller.createOrder();
            },
          ),
        ],
      ),
    );
  }
  ////

}

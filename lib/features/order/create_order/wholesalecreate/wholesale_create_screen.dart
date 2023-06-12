import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:winemonger/features/order/create_order/wholesalecreate/wholesale_create_controller.dart';
import 'package:winemonger/features/order/create_order/wholesalecreate/widgets/confirmProductWidget.dart';
import 'package:winemonger/features/order/create_order/wholesalecreate/widgets/product/product_field_widget.dart';

import 'widgets/Adjustment/adjustment_widget.dart';
import 'widgets/manufacture/manufacture_widgets.dart';
import 'widgets/ordered_product_widget.dart';
import 'widgets/select_customer/select_customer_text_field.dart';
import 'widgets/warehouse/warehouse_widget.dart';

class WholeSaleCreateOrderList extends StatelessWidget {
const   WholeSaleCreateOrderList({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return GetBuilder<WholeSaleCreateController>(
        init: WholeSaleCreateController(),
        builder: (controller) {
          return
    
     SingleChildScrollView(
      child: Center(
        child: Container(
          margin: const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
               const SelectCustomer(),
              const SizedBox(
                height: 20,
              ),
             const   WareHouseField (),
              const SizedBox(
                height: 20,
              ),
             const   ManuFactureField(),
              const SizedBox(
                height: 20,
              ),
              const ProductField(),
              const SizedBox(
                height: 30,
              ),
              _selectProductButton(context,controller),
              const SizedBox(
                height: 10,
              ),
              controller.selectButtonToAddToOrders.value == true
                  ? const ConfirmProductWidgets ()
                  : Container(),
              controller.addToOrders.value == true
                  ? const OrderedProductWidget()
                  : Container(),
            
controller.addToOrders.value==true?
              const AdjustmentWidget():Container(),
              const SizedBox(
                height: 10,
              ),
              _totalAndConfirm(context,controller),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );});
  }

  //
  Widget _selectProductButton(BuildContext context , WholeSaleCreateController controller ) {
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
            child: controller.isProductButtonProgress==true?
            
             const Text("Select Product",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.black)):const SizedBox(
                      height: 30,width: 30,
                      child: CircularProgressIndicator(strokeWidth: 3,color: Colors.green
                      
                      
                      
                      ,))
          ),
          onTap: () async {
controller.changeProductButtonStateFalse();

controller.checkProductButton();

await controller.productButtonApi();
// controller.fieldClear();

            
            // _controller.selectProductButton();
            // await _controller.selectProductApi();
            if (controller
                    .productButtonModelEntity.value.id !=
                null) {
              controller.selectButtonToAddToOrders.value = true;
            }


            controller.changeProductButtonStateTrue();
          },
        ),
      ],
    );
  }

  Widget _totalAndConfirm(BuildContext context, WholeSaleCreateController controller) {
    // final WholeSaleCreateController controller = Get.find();
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
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(controller.adjustment==0?
                  controller.total1.value.toString():
                  controller.grandTotal.value.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
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
            controller.createOrderValidation();
            },
          ),
        ],
      ),
    );
  }
  ////

}

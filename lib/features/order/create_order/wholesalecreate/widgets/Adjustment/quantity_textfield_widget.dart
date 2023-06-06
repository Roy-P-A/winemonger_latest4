import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../wholesale_create_controller.dart';


class QauntityTextField extends StatelessWidget {
  QauntityTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WholeSaleCreateController controller = Get.find();
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 0;
                i < controller.adjustmentListModelEntity.value.data9.length;
                i++)
              if (controller.adjustmentselected.value ==
                  controller
                      .adjustmentListModelEntity.value.data9[i].adjustmentSkuId)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Quantity"),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 6,
                            child: TextFormField(
                              controller: controller.quantityController1.value,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (double.tryParse(controller
                                        .quantityController1.value.text) ==
                                    false) {
                                  return 'Please enter a number';
                                } else if (controller
                                    .quantityController1.value.text.isEmpty) {
                                  return 'Please enter a number';
                                }
                                //return 'Please enter a number';
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  contentPadding: EdgeInsets.all(13),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xffdfdfdf),
                                    ),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color.fromARGB(
                                              255, 115, 214, 120)))),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                )
          ],
        ));
  }
}

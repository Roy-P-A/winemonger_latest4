// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:winemonger_sonu/controller/wholesale_controller.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../wholesale_create_controller.dart';

class ManuFactureField extends StatelessWidget {
  const ManuFactureField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WholeSaleCreateController>(
        init: WholeSaleCreateController(),
        builder: (controller) {
          return Form(
            key: controller.formKey3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Manufacture"),
                         controller.isLoadingManufacture?const 
                         SizedBox(height: 11,width: 11,child: 
                      CircularProgressIndicator(strokeWidth: 2.5,color:  Color(0xffcae3a8),),)
                     :const SizedBox()
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                AbsorbPointer (
                  absorbing:controller.isLoadingManufacture?true:false, 
                  child: Opacity(
                    opacity: controller.isLoadingManufacture?0.5:1,
                    child: SizedBox(
                      child:  DropdownButtonFormField2(
                          validator: (value) {
                            return controller
                                .manufacturerNameValidator(value! as String);
                          },
                          isExpanded: true,
                          isDense: false,
                  
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 115, 214, 120)
                                      // Colors.lightBlueAccent
                                      )),
                              hintText: "Select manufacturer",
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(6))),
                  
                           items: 
                           controller.users2
                              .map((item) => DropdownMenuItem<String>(
                                    value: item.id,
                                    child: Row(children: [
                                      Text(
                                        item.name,
                                        // style: DefaultTextStyle.of(context)
                                        //     .style
                                        //     .copyWith(fontStyle: FontStyle.normal),
                                        overflow: TextOverflow.ellipsis,
                                      )
                                    ]),
                                  ))
                              .toList(),
                          icon: const Icon(Icons.keyboard_arrow_down),
                          iconSize: 20,
                          buttonHeight: 52,
                          itemHeight: 40,
                          itemPadding: const EdgeInsets.only(left: 14, right: 14),
                          dropdownMaxHeight: 200,
                          dropdownPadding: null,
                  
                          scrollbarAlwaysShow: true,
                          scrollbarThickness: 4,
                  
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                          ),
                          dropdownElevation: 4,
                  
                          scrollbarRadius: const Radius.circular(2),
                  
                          // controller.kim.map((location) {
                          //   return DropdownMenuItem(
                          //     child: Text(location.warehouseName.toString()),
                          //     value: location.warehouseId,
                          //   );
                          // }).toList(),
                          onChanged: (value) async {
                            controller.setSelected2(value as String);
                            await controller.filterProductApi();
                            print(controller.manufactureselected.value);
                  
                            // setState(() {
                            //   _myselection = value as String?;
                            // });
                          },
                          value: controller.manufactureselected.value.isNotEmpty
                              ? controller.manufactureselected.value
                              : null,
                  
                          //value: _myselection,
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

class User2 {
  final String id;
  final String name;

  User2(this.id, this.name);
}

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import 'package:get/get.dart';
import '../../wholesale_create_controller.dart';

class SelectCustomer extends StatelessWidget {
  const SelectCustomer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WholeSaleCreateController>(
        init: WholeSaleCreateController(),
        builder: (controller) {
          return Form(
             key: controller.formKey1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'customer',
                ),
                const SizedBox(
                  height: 10,
                ),
                Obx(() => TypeAheadFormField(
                      suggestionsBoxVerticalOffset: 0.0,
                       minCharsForSuggestions: 1,
                      keepSuggestionsOnLoading:false,
                      noItemsFoundBuilder: (context) => const SizedBox(
                        height: 50,
                        child: Center(
                          child: Text("data not found"),
                        ),
                      ),
                      textFieldConfiguration: TextFieldConfiguration(
                          controller: controller.customerController1.value,
                          autofocus: true,
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "Select Customer",
                              contentPadding: EdgeInsets.only(
                                  top: 2, right: 10, left: 10, bottom: 2),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xffcae3a8))),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              focusColor: Colors.white)),
                      suggestionsCallback: (value) async {
                        // await controller.customerDetailApi(value);

                        const List<User> addresses = <User>[
                          User("1243", "Derek's"),
                          User("2020", "David Berkley Fine Wines"),
                          User("2058", "DJ's Bistro"),
                          User("2291", "Desert Falls Country Club"),
                          User("2757", "Draeger's Markets-Los Altos"),
                          User("3493", "Delauren Wines & Liqours"),
                          User("3609", "D & M Wine and Liqour Co."),
                        ];
                        for (int i = 0;
                            i <
                                controller
                                    .CustomerModelEntity.value.data1!.length;
                            i++) {
                          addresses.add(
                            User(
                                controller.CustomerModelEntity.value.data1![i]
                                        .customerId ??
                                    " ",
                                controller.CustomerModelEntity.value.data1![i]
                                        .companyName ??
                                    " "),
                          );
                        }
                        return addresses;
                      },
                      itemBuilder: (context, User address) {
                        return Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.all(14),
                                child: Text(
                                  address.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            )
                          ],
                        );
                      },
                      validator: (value) {
                        return controller.customerNameValidator(value!);
                      },
                      onSuggestionSelected: (User address) {
                        controller.customerController1.value.text =
                            address.name;
                        controller.customerController2.value.text = address.id;
                       
                      },
                    )),
              ],
            ),
          );
        });
  }
}

class User {
  const User(this.id, this.name);

  final String id;
  final String name;
}

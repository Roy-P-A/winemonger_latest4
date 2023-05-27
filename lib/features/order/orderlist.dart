import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/la.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:intl/intl.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:winemonger/features/order/order_controller.dart';
import 'package:winemonger/utils/theme/theme_constants.dart';

class OrderList extends StatelessWidget {
  OrderList({Key? key}) : super(key: key);
  final OrdersController _controller = Get.put(OrdersController());

  @override
  Widget build(BuildContext context) {
    _controller.scrollControllerSection();
    return Obx(
      () => LoadingOverlay(
        isLoading: _controller.isLoadingFirst.value,
        opacity: 1,
        color: Theme.of(context).colorScheme.dashboardbackgroundColor,
        progressIndicator: const CircularProgressIndicator(
          color: Color(0xffcae3a8),
        ),
        child: Container(
          margin: const EdgeInsets.only(left: 45, right: 45, top: 0, bottom: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              _controller.isSearchItemBlank.value
                  ? const Text("No Item Found")
                  : const SizedBox(),
              Flexible(
                fit: FlexFit.tight,
                child: _orderlist(context),
              ),
              // _controller.isLoadingSecond.value
              //     ? Container(
              //         padding: const EdgeInsets.fromLTRB(0, 5, 0, 35),
              //         child: const CircularProgressIndicator(
              //           color: Color(0xffcae3a8),
              //         ),
              //       )
              //     : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }

  Widget _orderlist(BuildContext context) {
    var ids = List.empty(growable: true);
    for (int i = 0; i < _controller.bulklist.value.length; i++) {
      ids.add(DateFormat.yMMMMd()
          .format(DateTime.parse(_controller.bulklist.value[i].orderDt!)));
    }
    var distinctIds = ids.toSet().toList();
    print(distinctIds);
    return SizedBox(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                controller: _controller.scrollController,
                itemCount: distinctIds.length,
                // display each item of the product list
                itemBuilder: (context, k) {
                  return Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(3, 7, 3, 3),
                        padding:
                            const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                        decoration: BoxDecoration(
                          color: const Color(0xffcae3a8),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context)
                                  .colorScheme
                                  .viewOrderboxshadowColor,
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset:
                                  const Offset(0, 1.5), // changes position of shadow
                            ),
                          ],
                        ),
                        width: double.infinity,
                        child:Center(
                        child: Text(
                          "${distinctIds[k]}",
                          style: const TextStyle(
                            fontSize: 15,
                              fontWeight: FontWeight.w700, color: Colors.black),
                        ),
                      ), 
                      ),
                      
                      Container(
                        color:
                            Theme.of(context).colorScheme.viewOrderThroughborderColor,
                        child: Column(
                          children: [
                            for (int j = 0;
                                j < _controller.bulklist.value.length;
                                j++)
                              if (DateFormat.yMMMMd().format(DateTime.parse(
                                      _controller.bulklist.value[j].orderDt!)) ==
                                  distinctIds[k])
                                /////
                                InkWell(
                                  child: Container(
                                      margin: const EdgeInsets.fromLTRB(4, 7, 4, 0),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 5),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .cardbackgroundColor,
                                        borderRadius: BorderRadius.circular(5),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .viewOrderboxshadowColor,
                                            spreadRadius: 2,
                                            blurRadius: 2,
                                            offset: const Offset(
                                                0, 1.5), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      width: double.infinity,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 4,
                                            child: Text(
                                                "${_controller.bulklist.value[j].customerName!}",
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700)),
                                          ),
                                        ],
                                      )),
                                  onTap: () {
                                    Get.toNamed('/orderdetailscreen', arguments: {
                                      'orderId': _controller.bulklist.value[j].orderId
                                    });
                                  },
                                ),
                
                            ///
                          ],
                        ),
                      ),
                    ],
                  );
                
                  //////
                }),
          ),
           _controller.isLoadingSecond.value
                  ? Container(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 35),
                      child: const CircularProgressIndicator(
                        color: Color(0xffcae3a8),
                      ),
                    )
                  : const SizedBox()
        ],
      ),
    );

    ///
    ///
  }
}

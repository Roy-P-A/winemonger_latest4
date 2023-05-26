import 'package:flutter/material.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';

import 'package:winemonger/utils/theme/theme_constants.dart';

import 'wholesalecreate/wholesale_create_screen.dart';

class CreateOrderSection extends StatelessWidget {
  const CreateOrderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(left: 24, right: 24, top: 30, bottom: 0),
        child: DefaultTabController(
          initialIndex: 1,
          length: 3,
          child: Column(
            children: <Widget>[
              Container(
                constraints: const BoxConstraints(maxHeight: 45),
                child: Material(
                  color: Colors.white10,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context)
                              .colorScheme
                              .createOrderBorderColor,
                          width: 1),
                      borderRadius: BorderRadius.circular(
                        8.0,
                      ),
                    ),
                    child: TabBar(
                      unselectedLabelColor: Colors.black,
                      labelColor: Colors.black,
                      labelPadding: const EdgeInsets.all(0),
                      padding: const EdgeInsets.all(0),
                      indicator: BoxDecoration(
                        boxShadow:const  [
                         
                           BoxShadow(
                            color: Colors.grey,
                            blurRadius: 1.0, 
                            spreadRadius: 0.2, 
                            offset: Offset(
                              0.1, 
                              0.1, 
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(
                          8.0,
                        ),
                        color: const Color(0xffcae3a8),
                      ),
                      tabs: [
                        Tab(
                          child: SizedBox(
                            child: Text("Leads",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .drawerTextColor1,
                                )),
                          ),
                        ),
                        Tab(
                          child: SizedBox(
                            child: Text("Wholesale",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .drawerTextColor1,
                                )),
                          ),
                        ),
                        Tab(
                          child: SizedBox(
                            child: Text("Retail",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .drawerTextColor1,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
               Expanded(
                child: TabBarView(
                  physics: const  NeverScrollableScrollPhysics(),
                  children:  [
                   const  SizedBox(
                      child:  Center(child: Text('Coming soon')),
                    ),
                     WholeSaleCreateOrderList(),
                  const   SizedBox(
                      child:  Center(child:  Text('Coming soon')),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

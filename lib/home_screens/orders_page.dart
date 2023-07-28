import 'package:cheff_restaurant/componants/custom_circular_pargress_bar.dart';
import 'package:cheff_restaurant/home_screens/managers/home_manager.dart';
import 'package:cheff_restaurant/home_screens/models/on_going_orders_list_model.dart';
import 'package:cheff_restaurant/home_screens/widgets/ongoing_orders_card.dart';
import 'package:cheff_restaurant/network_calls/base_response.dart';
import 'package:cheff_restaurant/utils/color_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {

  List<String> images= ["assets/images/chicken.jpeg","assets/images/food.png","assets/images/chocklate_icecream.jpeg",
    "assets/images/fish.jpg","assets/images/icecream.png","assets/images/noodles.jpeg","assets/images/veg_noodles.png"];


  OnGoingOrdersListModel? orders;
  bool _fetching = false;

  Future<void> _fetchOrders() async {
    setState(() {
      _fetching = true;
    });
    try {
      final response = await homeManager.ongoingOrdersData();
      // setState(() {
      //   _fetching = false;
      // });

      print("==================================)");

      // if (response.status == ResponseStatus.SUCCESS) {
      if (response.status == ResponseStatus.SUCCESS) {
        //Fluttertoast.showToast(msg: response.message);

        print((response.data as OnGoingOrdersListModel).toJson());

        setState(() {
          orders = response.data;
        });


      } else {
        Fluttertoast.showToast(msg: response.message);
      }
    } catch (err) {
      print(err);
      setState(() {
        _fetching = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: ThemeConfig.screenPadding,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: ThemeConfig.screenPadding,
                  child: Text(
                    "Orders",
                    style: ThemeConfig.black18base,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),



                DefaultTabController(
                  length: 2, // length of tabs
                  initialIndex: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(6)
                        ),
                        height: 40,
                        child: TabBar(
                          unselectedLabelStyle: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                          labelStyle: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                          unselectedLabelColor: Colors.black,
                          labelColor: ThemeConfig.whiteColor,
                          indicator: BoxDecoration(
                            // boxShadow: const [
                            //   BoxShadow(
                            //     offset: Offset(0, 4),
                            //     color: Color(0xFFC4C4C4),
                            //     blurRadius: 15,
                            //     spreadRadius: 0,
                            //   )
                            // ],
                            color: ThemeConfig.primaryColor,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          tabs: const [
                            Tab(text: "OnGoing"),
                            Tab(text: "Completed"),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height *
                            0.7, //height of TabBarView

                        child: TabBarView(
                          children: <Widget>[
                            orders == null ? const CustomCircularProgressIndicator():
                            ListView.separated(
                                scrollDirection: Axis.vertical,
                                itemCount: orders!.data!.length,
                                //shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  // final product = featuredProducts!.results![index];
                                  return Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        DateFormat('EEEE, MMM d, yyyy').format(orders!.data![index].createdAt),
                                        style: ThemeConfig.medium12,
                                      ),

                                      const SizedBox(
                                        height: 10,
                                      ),
                                      ListView.separated(
                                          scrollDirection: Axis.vertical,
                                          // itemCount: images.length,
                                          itemCount: orders!.data![index].foodItemsList!.length,
                                          shrinkWrap: true,
                                          physics:
                                          const NeverScrollableScrollPhysics(),
                                          itemBuilder: (BuildContext context,
                                              int indexOne) {
                                            var order = orders!.data![index].foodItemsList![indexOne];
                                            // final product = featuredProducts!.results![index];
                                            return OnGoingOrderCard(
                                              onPress: () {
                                                // NavigationService()
                                                //     .navigatePage(OrderDetails(
                                                //     isCompleted: false));
                                              },
                                              title: "${order.foodItemName}",
                                              image: order.image,
                                              //slots: "12 Slots Available",
                                            );
                                          },
                                          separatorBuilder:
                                              (BuildContext context,
                                              int index) {
                                            return const SizedBox(
                                              height: 12,
                                            );
                                          }),
                                    ],
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const SizedBox(
                                    height: 12,
                                  );
                                }),
                            CompletedOrders(),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



class CompletedOrders extends StatefulWidget {
  const CompletedOrders({Key? key}) : super(key: key);

  @override
  State<CompletedOrders> createState() => _CompletedOrdersState();
}

class _CompletedOrdersState extends State<CompletedOrders> {
  List<String> images= ["assets/images/chicken.jpeg","assets/images/food.png","assets/images/chocklate_icecream.jpeg",
    "assets/images/fish.jpg","assets/images/icecream.png","assets/images/noodles.jpeg","assets/images/veg_noodles.png"];

  OnGoingOrdersListModel? orders;
  bool _fetching = false;

  Future<void> _fetchOrders() async {
    setState(() {
      _fetching = true;
    });
    try {
      final response = await homeManager.completedOrdersData();
      // setState(() {
      //   _fetching = false;
      // });

      print("==================================)");

      // if (response.status == ResponseStatus.SUCCESS) {
      if (response.status == ResponseStatus.SUCCESS) {
        //Fluttertoast.showToast(msg: response.message);

        print((response.data as OnGoingOrdersListModel).toJson());

        setState(() {
          orders = response.data;
        });


      } else {
        Fluttertoast.showToast(msg: response.message);
      }
    } catch (err) {
      print(err);
      setState(() {
        _fetching = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchOrders();
  }


  @override
  Widget build(BuildContext context) {
    return orders == null ? const CustomCircularProgressIndicator():
    ListView.separated(
        scrollDirection: Axis.vertical,
        itemCount: orders!.data!.length,
        //shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          // final product = featuredProducts!.results![index];
          return Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat('EEEE, MMM d, yyyy').format(orders!.data![index].createdAt),
                style: ThemeConfig.medium12,
              ),

              const SizedBox(
                height: 10,
              ),
              ListView.separated(
                  scrollDirection: Axis.vertical,
                  // itemCount: images.length,
                  itemCount: orders!.data![index].foodItemsList!.length,
                  shrinkWrap: true,
                  physics:
                  const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context,
                      int indexOne) {
                    var order = orders!.data![index].foodItemsList![indexOne];
                    // final product = featuredProducts!.results![index];
                    return OnGoingOrderCard(
                      onPress: () {
                        // NavigationService()
                        //     .navigatePage(OrderDetails(
                        //     isCompleted: false));
                      },
                      title: "${order.foodItemName}",
                      image: order.image,
                      //slots: "12 Slots Available",
                    );
                  },
                  separatorBuilder:
                      (BuildContext context,
                      int index) {
                    return const SizedBox(
                      height: 12,
                    );
                  }),
            ],
          );
        },
        separatorBuilder:
            (BuildContext context, int index) {
          return const SizedBox(
            height: 12,
          );
        });
  }
}
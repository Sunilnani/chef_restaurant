import 'package:cached_network_image/cached_network_image.dart';
import 'package:cheff_restaurant/cheff_bottom_navigation_bar.dart';
import 'package:cheff_restaurant/componants/app_custom_card.dart';
import 'package:cheff_restaurant/componants/custom_circular_pargress_bar.dart';
import 'package:cheff_restaurant/componants/elevated_buttons.dart';
import 'package:cheff_restaurant/home_screens/managers/home_manager.dart';
import 'package:cheff_restaurant/home_screens/models/table_details_model.dart';
import 'package:cheff_restaurant/home_screens/products_page.dart';
import 'package:cheff_restaurant/misc/navigation_service.dart';
import 'package:cheff_restaurant/network_calls/base_response.dart';
import 'package:cheff_restaurant/utils/color_styles.dart';
import 'package:cheff_restaurant/utils/url.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OrderSummary extends StatefulWidget {
  const OrderSummary({Key? key, this.tableId}) : super(key: key);
  final int? tableId;

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  int count = 0;

  void _incrementCount() {
    setState(() {
      count++;
    });
  }

  void _decrementCount() {
    setState(() {
      if (count > 0) {
        count--;
      }
    });
  }

  var couponId;

  final couponCodeController = TextEditingController();

  bool coupon = false;
  double couponAmount = 0;



  int _selectedIndex = 1;

  bool isFavourite = false;

  void _toggleFavourite() {
    setState(() {
      isFavourite = !isFavourite;
    });
  }

  List<String> images= ["assets/images/chicken.jpeg","assets/images/chocklate_icecream.jpeg",
  ];


  final _formKey = GlobalKey<FormState>();
  int couponStatus = 0;

  int _selectedTip = -1;

  int _selectedTips = 0;

  TextEditingController _tipController = TextEditingController();

  List<String> tips= ["10","20"
  ];


  TableDetailsModel? tableDetails;
  bool _fetching = false;

  Future<void> _fetchTablerDetails() async {
    setState(() {
      _fetching = true;
    });
    print("..........responsed");
    final response = await homeManager.tableDetailsData(widget.tableId);
    //print((response.data as OrderDetails).toJson());
    print(response.data);
    setState(() {
      _fetching = false;
    });

    if (response.status == ResponseStatus.SUCCESS) {
      Fluttertoast.showToast(msg: response.message);
      setState(() {
        tableDetails = response.data;

      });

      // print(orderDetails?.OrderDetails?.productImages);
    } else {
      Fluttertoast.showToast(msg: response.message);
    }
  }

  Future<void> _updateOrder() async {

    final Map<String, dynamic> data = {
      "order_id":tableDetails!.orderId,
      "status":2
      // "table_name":"THREE",
      // "additional_request": _additionalRequestController.text.toString().trim(),
    };
    setState(() {
      _fetching = true;
    });
    try {
      final response = await homeManager.updateOrder(
        data,
      );



      if (response.status == ResponseStatus.SUCCESS) {
        print("object ${response.data}");
        setState(() {
          verifySuccess();
          _goNext();
        });

        Fluttertoast.showToast(msg:"order Successfully placed");

        setState(() {
        });
        setState(() {
          _fetching = false;
        });
      }

      else {
        Fluttertoast.showToast(msg: response.message);
        // Fluttertoast.showToast(msg: response.message);
      }
    } catch (err) {
      print("add cart");
      // run now once
      setState(() {
        _fetching = false;
      });
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchTablerDetails();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(
          "Table Details",
          style: ThemeConfig.black18base,
        ) ,
        elevation: 2,
      ),
      body: SafeArea(
        child: Padding(
          padding: ThemeConfig.screenPadding,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: tableDetails == null ? const CustomCircularProgressIndicator():
             // tableDetails!.foodItemsList!.isEmpty  ?  Center(child: Text("This table is Empty",style: ThemeConfig.Medium14grey,)):


              Column(
                children: [

                  const SizedBox(
                    height: 24,
                  ),

                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    // physics:
                    // const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: tableDetails!.foodItemsList!.length,
                    itemBuilder: (context, index) {
                      var orders= tableDetails!.foodItemsList![index];
                      return Container(
                        //padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                        decoration: ThemeConfig.radius,
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                height: 90,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(
                                          ThemeConfig.borderRadius / 2),
                                      topRight: Radius.circular(
                                          ThemeConfig.borderRadius / 2),
                                      bottomRight: Radius.circular(
                                          ThemeConfig.borderRadius / 2),
                                      bottomLeft: Radius.circular(
                                          ThemeConfig.borderRadius / 2),
                                    ),
                                    // color: Theme.of(context)
                                    //     .colorScheme.secondary.withOpacity(0.5),
                                    boxShadow: [
                                      BoxShadow(
                                          color: ThemeConfig.blackColor
                                              .withOpacity(0.2),
                                          blurRadius: 1,
                                          spreadRadius: 0.5)
                                    ],
                                    image: DecorationImage(
                                        image: CachedNetworkImageProvider(
                                          URLS.parseImage(
                                              tableDetails!.foodItemsList![index].image),
                                          // maxWidth: 50
                                        ),
                                        fit: BoxFit.fill)
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${orders.foodItemName}",
                                  style: ThemeConfig.black12base,
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "${orders.description}",
                                  style: ThemeConfig.medium10,
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                RichText(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  text:  TextSpan(
                                    text: 'Quantity: ',
                                    style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: ThemeConfig.blackColor,
                                      fontSize: 10,
                                      //decoration: TextDecoration.lineThrough,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: '${orders.quantity}',
                                        style: const TextStyle(
                                          // overflow: TextOverflow.ellipsis,
                                            color: Colors.black,
                                            decoration: TextDecoration.none,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                RichText(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  text:  TextSpan(
                                    text: '\u{20b9} 200',
                                    style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.grey,
                                      fontSize: 10,
                                      decoration:
                                      TextDecoration.lineThrough,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: '  \u{20b9}${orders.price}',
                                        style: const TextStyle(
                                          // overflow: TextOverflow.ellipsis,
                                            color: Colors.black,
                                            decoration: TextDecoration.none,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 6,
                            ),

                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 16);
                    },
                  ),
                  const SizedBox(
                    height: 14,
                  ),


                  const SizedBox(
                    height: 14,
                  ),

                  LDFilledButton(

                    minWidth: double.infinity,
                    onPressed: () {
                      _fetching ? const CustomCircularProgressIndicator():
                      _updateOrder();

                      //NavigationService().navigatePage(BottomNavigation());
                    },
                    color: ThemeConfig.primaryColor,
                    child: Text(
                      "Update",
                      style: ThemeConfig.white14medium,
                    ),
                  ),


                  const SizedBox(
                    height: 14,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // isExtended: true,
        backgroundColor:ThemeConfig.primaryColor,
        onPressed: () {
          NavigationService().navigatePage(ProductPage());
          setState(() {

          });
        },
        child: const Icon(Icons.add,color: Colors.white,),
      ),
    );
  }

  Future verifySuccess() async {
    // final res = await showModalBottomSheet(
    await showModalBottomSheet(
      context: context,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      builder: (context) {
        return Container(
          padding:const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: 250,
          color: Colors.white,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                "assets/images/verify_success.png",
                width: 66,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Order Successfully Placed",
                style: ThemeConfig.grey12medium,
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "Redirect to HomePage",
                style: ThemeConfig.black12low,
              )
            ],
          ),
        );
      },
    );
  }

  _goNext() async {
    Future.delayed(
      const Duration(seconds: 2),
          () {
        // widget.pilotID == true ?
        NavigationService().navigatePage(
          const CheffBottomNavigationBar(),
          replaceAll: true,
        );
        //:
        // NavigationService().navigatePage(
        //   const HomePage(),
        //   replaceAll: true,
        // );
      },
    );
  }

}


class RowCard extends StatelessWidget {
  final title;
  final value;
  const RowCard({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                // fontSize: 14,
                color: ThemeConfig.blackColor.withOpacity(0.8),
              )),
          Text(value,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                color: ThemeConfig.blackColor,
                fontWeight: FontWeight.w500,
              ))
        ],
      ),
    );
  }
}
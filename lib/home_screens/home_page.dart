import 'package:cheff_restaurant/componants/app_custom_card.dart';
import 'package:cheff_restaurant/componants/custom_circular_pargress_bar.dart';
import 'package:cheff_restaurant/home_screens/managers/home_manager.dart';
import 'package:cheff_restaurant/home_screens/models/tables_list_model.dart';
import 'package:cheff_restaurant/home_screens/table_details_page.dart';
import 'package:cheff_restaurant/home_screens/widgets/orders_card.dart';
import 'package:cheff_restaurant/misc/navigation_service.dart';
import 'package:cheff_restaurant/network_calls/base_response.dart';
import 'package:cheff_restaurant/utils/color_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';


class ChefHomePage extends StatefulWidget {
  const ChefHomePage({Key? key}) : super(key: key);

  @override
  State<ChefHomePage> createState() => _ChefHomePageState();
}

class _ChefHomePageState extends State<ChefHomePage> {

  final bool _hasPayment = false;

  TablesListModel? table;

  List<TablesListModel>? tables;
  bool _fetching = false;


  Future<void> _fetchTablesList() async {
    setState(() {
      _fetching = true;
    });
    try {
      final response = await homeManager.tablesListData();
      // setState(() {
      //   _fetching = false;
      // });

      print("==================================)");

      // if (response.status == ResponseStatus.SUCCESS) {
      if (response.status == ResponseStatus.SUCCESS) {
        //Fluttertoast.showToast(msg: response.message);

        // print((response.data).toJson());

        setState(() {
          tables = response.data;
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
    _fetchTablesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Good day,",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.black),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                DateFormat('EEEEE, MMM d').format(DateTime.now()),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                          // Image(
                          //   image: AssetImage(
                          //     "assets/images/sun.png",
                          //   ),
                          //   height: 35,
                          //   width: 35,
                          // )
                        ],
                      ),

                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        margin: EdgeInsets.only(top: 20, bottom: 10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 2),
                                  blurRadius: 5,
                                  spreadRadius: 0,
                                  color: Color(0xFFC4C4C4))
                            ]),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Earned Today",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: Color(0xFF9E9E9E)),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "\u{20B9} 200",
                                          style: TextStyle(
                                              color: ThemeConfig.blackColor
                                                  .withOpacity(0.6),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 25),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Divider(
                                thickness: 1,
                                color: Color(0xffC4C4C4),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Total Orders",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          color: Color(0xFF9E9E9E)),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "20",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                  ],
                                ),

                              ],
                            )
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      tables == null ? const CustomCircularProgressIndicator():

                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount:tables!.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: InkWell(
                              onTap: (){
                                NavigationService().navigatePage(OrderSummary(tableId: tables![index].id,));
                              },
                              child: Container(
                                decoration:  BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color:tables![index].isOrdered == true ? ThemeConfig.redColor.withOpacity(0.2): Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: ThemeConfig.blackColor.withOpacity(0.1),
                                          blurRadius:  10,
                                          spreadRadius: 2)
                                    ],

                                ),

                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                       Image.asset("assets/images/chair.png",width:36),
                                      Text("${tables![index].name} ",style: ThemeConfig.Medium14grey,)
                                    ],
                                  )
                              )
                                  // .animate(onPlay: (controller)=> controller.repeat(period: 800.ms))
                                  // .scaleXY(end: 1.1,curve: Curves.easeInOutCirc)
                                  // .tint(color: Colors.transparent,end: 0.4)
                                  // .elevation(end: 1),
                            ),
                          );
                        },
                      )


                    ],
                  ),
                ),
              ),
            ),
          ],
        ),

      ),
    );
  }


Widget _ongoingOrders()  {


  return GestureDetector(
      onTap: () {


      },

      child:  AppCustomCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Row(
                  children: [
                    Container(
                      height: 90,
                      width: 80,
                      decoration:  BoxDecoration(
                        //shape: BoxShape.circle,
                        borderRadius: BorderRadius.circular(6),

                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/icecream.png")
                          // image: CachedNetworkImageProvider(URLS.parseImage(imageUrl),
                        ),
                      ),

                    ),


                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "product name",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color:Colors.black),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "user: Sunil",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              color: Color(0xFF626262)),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Text(
                              "Payment : ",
                              style: ThemeConfig.Medium14grey,
                            ),
                            _hasPayment == false?
                            const Text(
                              "Not Paid",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.red),
                            ):const Text(
                              " Paid",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: ThemeConfig.greenColor),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      "OrderId",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                          color: Color(0xFF626262)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 46,
                      width: 46,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 1),
                              spreadRadius: 0,
                              blurRadius: 4,
                              color: Color(0xFFC4C4C4),
                            )
                          ]),
                      child: Center(
                        child: Text(
                          "2",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),

          ],
        ),
      )

  );
}

Widget _pastOrders() {
  return

  // orders!.orders!.isEmpty ? Padding(
  //   padding: const EdgeInsets.only(top: 14.0,bottom:10),
  //   child: Text("No Previous Orders",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700,color: Theme.of(context).primaryColor),),
  // ):

  ListView.separated(
    padding: const EdgeInsets.all(0),
    scrollDirection: Axis.vertical,
   // physics: const NeverScrollableScrollPhysics(),
    physics: const BouncingScrollPhysics(),
    shrinkWrap: true,
    itemCount: 2,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: InkWell(
            onTap: () {
              //NavigationService().navigatePage(OngoingOrderDetails(orderId:orders!.orders![index].id));
            },
            child: const OrdersCard(
              title: "29 Apr",
                // title: "Ordered, ${DateFormat.yMMMd().format(orders!.orders![index].createdAt)??'-'}",
                subtitle: "product name",
                imageUrl: "",
                orderId: 3,
                // status: orders!.orders![index].status,
                status:  "order completed"
            )
        ),
      );
    },
    separatorBuilder: (BuildContext context, int index) {
      return const SizedBox(width: 8);
    },
  );
}


}

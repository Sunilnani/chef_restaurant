import 'package:cached_network_image/cached_network_image.dart';
import 'package:cheff_restaurant/cheff_bottom_navigation_bar.dart';
import 'package:cheff_restaurant/componants/custom_circular_pargress_bar.dart';
import 'package:cheff_restaurant/componants/custom_text_fields.dart';
import 'package:cheff_restaurant/componants/elevated_buttons.dart';
import 'package:cheff_restaurant/componants/user.dart';
import 'package:cheff_restaurant/home_screens/managers/cart_manager.dart';
import 'package:cheff_restaurant/home_screens/models/cart_list_model.dart';
import 'package:cheff_restaurant/home_screens/models/tables_list_model.dart';
import 'package:cheff_restaurant/misc/navigation_service.dart';
import 'package:cheff_restaurant/network_calls/base_response.dart';
import 'package:cheff_restaurant/utils/color_styles.dart';
import 'package:cheff_restaurant/utils/url.dart';


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OrderPlacePage extends StatefulWidget {
  const OrderPlacePage({Key? key}) : super(key: key);

  @override
  State<OrderPlacePage> createState() => _OrderPlacePageState();
}

class _OrderPlacePageState extends State<OrderPlacePage> {
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




  int _selectedIndex = 1;

  bool isFavourite = false;

  void _toggleFavourite() {
    setState(() {
      isFavourite = !isFavourite;
    });
  }

  List<String> images= ["assets/images/chicken.jpeg","assets/images/chocklate_icecream.jpeg",
  ];

  CartListModel? cartList;

  TablesListModel? table;

  List<TablesListModel>? tables;
  bool _fetching = false;

  Future<void> _fetchCartList() async {
    setState(() {
      _fetching = true;
    });
    try {
      final response = await cartManager.cartListData();
      // setState(() {
      //   _fetching = false;
      // });

      print("==================================)");

      // if (response.status == ResponseStatus.SUCCESS) {
      if (response.status == ResponseStatus.SUCCESS) {
        //Fluttertoast.showToast(msg: response.message);

        print((response.data as CartListModel).toJson());

        // for (final list in cartList) {
        //   list.doSomething(); // static method on both KlassOne and KlassTwo
        // }

        setState(() {
          cartList = response.data;
        });

        for(CartItemModel list in (cartList?.data ?? [])) {
          print("addred list of cart are ---------------->${list.toString()}");
          productCart[list.foodItemId] = list.orderedQuantity!;
        }



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

  Future<void> _fetchTablesList() async {
    setState(() {
      _fetching = true;
    });
    try {
      final response = await cartManager.tablesListData();
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


  final List<String> _categoryList = ["Veg", "Nog Veg","Curries","Dishes"];

  String? selectedTable;
  //String? dropdownValue;


  Map<int, int> productCart = {};
  Future<void> _addProductToCart(int productId, {int? clearCart}) async {
    print("_addProductToCart $productId --> ${productCart[productId]}");


    setState(() {
      _fetching = true;
    });
    try {
      final response = await cartManager.addCart(productId,
        // clearCart:clearCart
      );

      if (response.status == ResponseStatus.SUCCESS) {

        setState(() {
          //userInfo.cart += 1;

          print("object");
          //_orderSummary();
        });
        setState(() {
          _fetching=false;
        });
      } else {
        // final checkStatus = response.data['check_status'];

        Fluttertoast.showToast(msg: response.message);
        // if(checkStatus==true){
        //
        //   _addnewItemPopUp(productId);
        //
        //
        // }
      }
    } catch (err) {
      print(err);
      // run now once
      setState(() {
        _fetching = false;
      });
    }
  }
  Future<void> _updateProductInCart(int cartId, int quantity) async {
    // print("_updateProductInCart $productId --> $quantity");

    setState(() {
      _fetching = true;
    });
    try {
      final response = await cartManager.updateCart(cartId,quantity);

      if (response.status == ResponseStatus.SUCCESS) {
        Fluttertoast.showToast(msg: response.message);
        print("------->updated cart list are  ${(response.data)}");
        setState(() {
          //_orderSummary();
          print("object ${userInfo.productItems}");
          print("object ${userInfo.totalAmount}");

        });
        setState(() {
          _fetching=false;
        });
      } else {
        Fluttertoast.showToast(msg: response.message);
      }
    } catch (err) {
      print(err);
      // run now once
      setState(() {
        _fetching = false;
      });
    }
  }


  Future<void> _deleteProductFromCart(int productId) async {
    // print("_deleteProductFromCart $productId");
    setState(() {
      _fetching = true;
    });
    try {
      final response = await cartManager.deleteCart(productId);

      if (response.status == ResponseStatus.SUCCESS) {

        Fluttertoast.showToast(msg: response.message);
        print("------->deleted cart list are  ${(response.data)}");
        setState(() {
          //_orderSummary();

          userInfo.cart -= 1;
          //Fluttertoast.showToast(msg: "added to cart successfully");
          // Navigator.push(context, MaterialPageRoute(builder: (context)=> const OrderSummary()));
          //products = response.data;
        });
        setState(() {
          _fetching=false;
        });
      } else {
        Fluttertoast.showToast(msg: response.message);
      }
    } catch (err) {
      print(err);
      // run now once
      setState(() {
        _fetching = false;
      });
    }

  }

  final _additionalRequestController = TextEditingController();


  Future<void> _placeOrder() async {

    final Map<String, dynamic> data = {
      "table_name":selectedTable,
      "additional_request": _additionalRequestController.text.toString().trim(),
    };
    setState(() {
      _fetching = true;
    });
    try {
      final response = await cartManager.placeOrder(
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
  void initState(){
    super.initState();
    _fetchCartList();
    _fetchTablesList();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(
          "Order",
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const SizedBox(
                    height: 10,
                  ),


                  cartList == null ? const CustomCircularProgressIndicator():
                  ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    // physics:
                    // const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: cartList!.data!.length,
                    itemBuilder: (context, index) {
                      // productCart[cartList!.data![index].foodItemId] = cartList!.data![index].orderedQuantity!;
                      return Container(
                        //padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                        decoration: ThemeConfig.radius,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    image:  DecorationImage(
                                        fit: BoxFit.fill,
                                        image:
                                        CachedNetworkImageProvider(
                                          URLS.parseImage(
                                              cartList!.data![index].image),
                                          // maxWidth: 50
                                        )
                                    )
                                  // image: DecorationImage(
                                  //     image: AssetImage(images[index]),
                                  //     fit: BoxFit.fill)
                                )
                            ),
                            Flexible(
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${cartList!.data![index].foodName}",
                                      style: ThemeConfig.black12base,
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      "${cartList!.data![index].description}",
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
                                            text: '${cartList!.data![index].foodServingQuantity} persons',
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
                                            text: '  \u{20b9}${cartList!.data![index].price}',
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
                              ),
                            ),
                            const SizedBox(
                              width: 6,
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                if (productCart.containsKey(cartList!.data![index].foodItemId))
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              ThemeConfig.borderRadius / 2)),
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary
                                          .withOpacity(0.1),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: (){
                                            setState(() {
                                              if (productCart[cartList!.data![index].foodItemId]! > 1) {
                                                productCart[cartList!.data![index].foodItemId] = productCart[cartList!.data![index].foodItemId]! - 1;

                                                _updateProductInCart(
                                                    cartList!.data![index].foodItemId  , productCart[cartList!.data![index].foodItemId] ?? 1);
                                              } else {
                                                productCart.remove(
                                                    cartList!.data![index].foodItemId);
                                                _deleteProductFromCart(cartList!.data![index].foodItemId);
                                              }
                                            });
                                          },
                                          child: Container(
                                            padding:
                                            const EdgeInsets.symmetric(
                                                vertical: 1,
                                                horizontal: 10),

                                            alignment: Alignment.center,
                                            child: const Text(
                                              "-",
                                              style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "${productCart[cartList!.data![index].foodItemId]}",

                                        ),
                                        InkWell(
                                          onTap:(){
                                            setState(() {
                                              productCart[cartList!.data![index].foodItemId] = productCart[cartList!.data![index].foodItemId]! + 1;
                                            });
                                            _updateProductInCart(
                                                cartList!.data![index].foodItemId, productCart[cartList!.data![index].foodItemId] ?? 1);
                                          },
                                          child: Container(
                                            padding:
                                            const EdgeInsets.symmetric(
                                                vertical: 6,
                                                horizontal: 12),

                                            alignment: Alignment.center,
                                            child: const Text(
                                              "+",
                                              style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )

                                else
                                  InkWell(
                                    onTap: () {


                                      setState(() {
                                        productCart[cartList!.data![index].foodItemId] = 1;
                                        _addProductToCart(cartList!.data![index].foodItemId);
                                      });

                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6),

                                      alignment: Alignment.center,
                                      child: const Text(
                                        "+",
                                        style: TextStyle(
                                            fontSize: 26,fontWeight: FontWeight.w600
                                        ),
                                      ),
                                    ),
                                  )
                              ],
                            ),
                            const SizedBox(
                              width: 10,
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
                    height: 18,
                  ),

                  Text(
                    "Select Table",
                    style: ThemeConfig.textStyleTitle(context)!.copyWith(color: ThemeConfig.blackColor,fontWeight: FontWeight.w600),),
                  const SizedBox(
                    height: 10,
                  ),

                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    height: 50,
                    width: 450,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white,
                        border: Border.all(
                          width: 1,
                          color: const Color(0xFFD1D5DB),
                        )),
                    child: DropdownButton<TablesListModel>(
                      hint: const Text("Select table"),
                      isExpanded: true,
                      underline:
                      DropdownButtonHideUnderline(child: Container()),
                      value: table,
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        size: 30,
                        color:ThemeConfig.secondaryColor,
                      ),
                      items: tables?.map<DropdownMenuItem<TablesListModel>>((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(
                            "${value.name}",
                            style: ThemeConfig.primary16,
                          ),
                        );
                      }).toList(),
                      onChanged: (value) async {
                        print("${value?.id}");
                        setState(() {
                          selectedTable = value?.name as String;
                          table=value;
                        });
                      },
                    ),
                  ),

                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    "Additional Instructions if Any?",
                    style: ThemeConfig.textStyleTitle(context)!.copyWith(color: ThemeConfig.blackColor,fontWeight: FontWeight.w600),),
                  CommentTextFormField(
                    controller: _additionalRequestController,
                    maxLines: 3,
                    hintText: 'Type here',
                    inputDecorationPadding:
                    const EdgeInsets.all(12),
                  ),

                  const SizedBox(
                    height: 14,
                  ),

                  LDFilledButton(
                    minWidth: double.infinity,
                    onPressed: () {
                      // verifySuccess();
                      // _goNext();
                      _placeOrder();

                    },
                    color: ThemeConfig.primaryColor,
                    child: Text(
                      "Place Order",
                      style: ThemeConfig.white14medium,
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  // Text(
                  //   "Additional Instructions if Any?",
                  //   style: ThemeConfig.textStyleTitle(context)!.copyWith(color: ThemeConfig.blackColor,fontWeight: FontWeight.w600),),
                  // const CommentTextFormField(
                  //   maxLines: 3,
                  //   hintText: 'Type here',
                  //   inputDecorationPadding:
                  //   EdgeInsets.all(12),
                  // ),
                ],
              ),
            ),
          ),
        ),
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

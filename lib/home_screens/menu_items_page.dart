import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cheff_restaurant/cheff_bottom_navigation_bar.dart';
import 'package:cheff_restaurant/componants/custom_circular_pargress_bar.dart';
import 'package:cheff_restaurant/componants/elevated_buttons.dart';
import 'package:cheff_restaurant/home_screens/managers/home_manager.dart';
import 'package:cheff_restaurant/home_screens/models/category_list_model.dart';
import 'package:cheff_restaurant/home_screens/models/category_products_list_model.dart';
import 'package:cheff_restaurant/home_screens/widgets/category_card.dart';
import 'package:cheff_restaurant/misc/navigation_service.dart';
import 'package:cheff_restaurant/network_calls/base_response.dart';
import 'package:cheff_restaurant/utils/color_styles.dart';
import 'package:cheff_restaurant/utils/url.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MenuItemsPage extends StatefulWidget {
  const MenuItemsPage({Key? key, this.query}) : super(key: key);
  final String? query;

  @override
  State<MenuItemsPage> createState() => _MenuItemsPageState();
}

class _MenuItemsPageState extends State<MenuItemsPage> {
  final CarouselController _controller = CarouselController();
  void onPageChange(int index, CarouselPageChangedReason changeReason) {
    pageIndex = index;
  }

  int pageIndex = 0;


  List<String> category = [
    "All",
    "Non Veg",
    "Veg",
    "Curries",
    "Special Dishes"];

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




  int _selectedFilter = 0;

  bool isFavourite = false;

  void _toggleFavourite() {
    setState(() {
      isFavourite = !isFavourite;
    });
  }

  List<String> images= ["assets/images/chicken.jpeg","assets/images/food.png","assets/images/chocklate_icecream.jpeg",
    "assets/images/fish.jpg","assets/images/icecream.png","assets/images/noodles.jpeg","assets/images/veg_noodles.png"];







  CategoriesListModel? categories;
  bool _fetching = false;

  Future<void> _fetchCategories() async {
    setState(() {
      _fetching = true;
    });
    try {
      final response = await homeManager.categoryData();
      // setState(() {
      //   _fetching = false;
      // });

      print("==================================)");

      // if (response.status == ResponseStatus.SUCCESS) {
      if (response.status == ResponseStatus.SUCCESS) {
        //Fluttertoast.showToast(msg: response.message);

        print((response.data as CategoriesListModel).toJson());

        setState(() {
          categories = response.data;
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


  CategoryProductsListModel? categoryProducts;

  Future<void> _fetchCategoryProducts() async {
    setState(() {
      _fetching = true;
    });
    print("..........responsed");
    final response = await homeManager.categoryProductsData(
        _selectedFilter+1,query: _searchController.text.trim(),
        (_value== 0 ? 1:0) ,(_value == 1 ? 1:0)
    );
    //print((response.data as OrderDetails).toJson());
    print(response.data);
    setState(() {
      _fetching = false;
    });

    if (response.status == ResponseStatus.SUCCESS) {
      Fluttertoast.showToast(msg: response.message);
      setState(() {
        categoryProducts = response.data;
        duplicateItems = categoryProducts!.foodItemsList!;
        items = categoryProducts!.foodItemsList!;
      });
      for(FoodItemsList list in (items ?? [])) {
        print("addred list of cart are ---------------->${list}");
        if (list.isAvailable == true) {
          setState(() {
            _selecteCategorysID.add(list.foodItemId);
          });
        }

      }

      // print(orderDetails?.OrderDetails?.productImages);
    } else {
      Fluttertoast.showToast(msg: response.message);
    }
  }

  final TextEditingController _searchController = TextEditingController();
  var duplicateItems = <FoodItemsList>[];
  List<FoodItemsList> items =[];

  _searchProduct(){
    final String query=_searchController.text.trim();
    setState(() {
      items = duplicateItems
          .where((item) => item.name!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });

    // if(query.isEmpty){
    //   return;
    // }
    // // _fetchSearchVehicles(query);
    // _fetchCategoryProducts();

  }
  int? _value ;
  List<String> chips = [
    'Veg',
    'Non Veg',
  ];
  bool itemAvailable = true;
  bool isChecked = false;


  List _selecteCategorysID = [];


  void _onCategorySelected(bool selected, category_id) {
    if (selected == true) {
      setState(() {
        _selecteCategorysID.add(category_id);
      });
    } else {
      setState(() {
        _selecteCategorysID.remove(category_id);
      });
    }

  }//

  bool itemSelected = false;

  Future<void> _updateFoodItem(int foodItemId, bool? itemselect) async {

    final Map<String, dynamic> data = {
      "food_item_id":foodItemId,
      "is_available":itemselect
      // "table_name":"THREE",
      // "additional_request": _additionalRequestController.text.toString().trim(),
    };
    setState(() {
      _fetching = true;
    });
    try {
      final response = await homeManager.updateFoodItem(
        data,
      );


      if (response.status == ResponseStatus.SUCCESS) {
        print("object ${response.data}");
        Fluttertoast.showToast(msg:"item Successfully updated");

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
    _fetchCategories();
    _fetchCategoryProducts();
    if(widget.query != null){
      _searchController.text = widget.query ?? "";
      _searchProduct();
    }
    // if(widget.query!.isEmpty){
    //   // _searchController.text = widget.query ?? "";
    //   _searchProduct();
    // }
    setState(() {
    });
  }
  @override
  void dispose(){
    _searchController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    print(_selecteCategorysID);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            Padding(
              padding: ThemeConfig.screenPadding,
              child: Text(
                "Order Summary",
                style: ThemeConfig.black18base,
              ),
            ),

            Padding(
              padding: ThemeConfig.screenPadding,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        color: ThemeConfig.primary.withOpacity(0.2))),
                child: TextFormField(
                  controller: _searchController,
                  focusNode: FocusNode(),
                  onChanged: (value){
                    _searchProduct();
                  },
                  onTap: () {
                    //NavigationService().navigatePage(SearchProductPage());
                  },
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 14),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(30),
                  ],
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search_rounded,
                      color: ThemeConfig.secondaryColor,
                    ),
                    // suffixIcon: const Icon(Icons.search_rounded),
                    // suffixIcon: Image.asset("assets/images/search.png",width:14,),
                    hintStyle: TextStyle(
                      color: ColorConstant.blueGray200,
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                    hintText: "search here",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.fromLTRB(10, 14, 0, 0),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            categories == null ? const CustomCircularProgressIndicator():
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Container(
                padding: const EdgeInsets.only(left:10.0,top: 10,bottom: 10,right: 4),
                width: MediaQuery.of(context).size.width,
                height: 38,
                decoration:  BoxDecoration(
                    color: ThemeConfig.secondaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(14),bottomLeft: Radius.circular(14))
                ),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories!.data!.length,
                  itemBuilder: (context, index) {

                    return InkWell(
                        onTap: () {
                          setState(() {
                            _selectedFilter = index;
                            _fetchCategoryProducts();
                            // _selectedFilter = _filterList[index]['id'];
                          });
                        },
                        child: CategoryCard(
                          // isSelected: _selectedFilter ==_filterList[index]['id'] ,
                          child: Row(
                            children: [
                              // Icon(
                              //   _filterList[index]['icon'],
                              //   size: 20,
                              // ),
                              // const SizedBox(
                              //   width: 5,
                              // ),
                              Text(
                                "${categories!.data![index].categoryName}",
                                // _filterList[index]['category'],

                                style:  TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500,color:  _selectedFilter ==index ? ThemeConfig.secondaryColor: ThemeConfig.blackColor),
                              )
                            ],
                          ),
                        ));
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(width: 8);
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 14,
            ),

            categoryProducts == null ? const CustomCircularProgressIndicator():
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: ThemeConfig.screenPadding,
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        // physics:
                        // const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: items.length,
                        itemBuilder: (context, index) {


                          return  Container(
                            //padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                            decoration: ThemeConfig.radius,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topLeft:
                                              Radius.circular(ThemeConfig.borderRadius / 2),
                                              topRight:
                                              Radius.circular(ThemeConfig.borderRadius / 2),
                                              bottomRight:
                                              Radius.circular(ThemeConfig.borderRadius / 2),
                                              bottomLeft:
                                              Radius.circular(ThemeConfig.borderRadius / 2),
                                            ),
                                            // color: Theme.of(context)
                                            //     .colorScheme.secondary.withOpacity(0.5),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: ThemeConfig.blackColor.withOpacity(0.2),
                                                  blurRadius: 1,
                                                  spreadRadius: 0.5)
                                            ],
                                            image:  DecorationImage(
                                                image: CachedNetworkImageProvider(
                                                  URLS.parseImage(
                                                      items[index].image),
                                                  // maxWidth: 50
                                                ),
                                                fit: BoxFit.fill
                                            )
                                        )
                                    ),
                                     const SizedBox(width: 16,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("${items[index].name}",style: ThemeConfig.black12base,),
                                        const SizedBox(height: 4,),
                                        Text("${items[index].description}",style: ThemeConfig.medium10,),
                                        const SizedBox(height: 4,),


                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 6,),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,

                                  children:  [
                                    Checkbox(
                                      // value: _selecteCategorysID.contains(images[index]),
                                      value: _selecteCategorysID.contains(items[index].foodItemId),

                                      onChanged: (bool? selected) {
                                        _onCategorySelected(selected!, items[index].foodItemId);
                                        Future.delayed(
                                          const Duration(seconds: 2),
                                              () {
                                                _updateFoodItem(items[index].foodItemId,selected);
                                                print("===========================>${selected}, ${items[index].foodItemId}");

                                          },
                                        );
                                        //itemSelected = selected;

                                      },

                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      activeColor: ThemeConfig.secondaryColor,
                                      checkColor: Colors.white,
                                      //enabled: itemAvailable,
                                    ),

                                  ],
                                ),

                               // const SizedBox(width: 2,),

                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 16);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Text("${itemSelected}"),

            const SizedBox(
              height: 4,
            ),
            if(count > 0)
              Padding(
                padding: ThemeConfig.screenPadding,
                child: LDFilledButton(
                  minWidth: double.infinity,
                  onPressed: () {
                    //NavigationService().navigatePage(OrderPlacePage());
                  },
                  color: ThemeConfig.primaryColor,
                  child: Text(
                    "View Bucket",
                    style: ThemeConfig.white14medium,
                  ),
                ),
              ),

          ],
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

        NavigationService().navigatePage(
          const CheffBottomNavigationBar(),
          replaceAll: true,
        );

      },
    );
  }
}


class ProductsCardList extends StatefulWidget {
  const ProductsCardList({this.width,this.height,
    this.image,
    this.child,
    this.isSelected
  });
  final double? width;
  final double? height;
  final String? image;
  final Widget? child;
  final bool? isSelected;

  @override
  State<ProductsCardList> createState() => _ProductsCardListState();
}

class _ProductsCardListState extends State<ProductsCardList> {
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
  int _selectedFilter = 1;

  bool isFavourite = false;

  void _toggleFavourite() {
    setState(() {
      isFavourite = !isFavourite;
    });
  }

  List<String> images= ["assets/images/chicken.jpeg","assets/images/food.png","assets/images/chocklate_icecream.jpeg",
    "assets/images/fish.jpg","assets/images/icecream.png","assets/images/noodles.jpeg","assets/images/veg_noodles.png"];

  @override
  Widget build(BuildContext context) {
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
                    topLeft:
                    Radius.circular(ThemeConfig.borderRadius / 2),
                    topRight:
                    Radius.circular(ThemeConfig.borderRadius / 2),
                    bottomRight:
                    Radius.circular(ThemeConfig.borderRadius / 2),
                    bottomLeft:
                    Radius.circular(ThemeConfig.borderRadius / 2),
                  ),
                  // color: Theme.of(context)
                  //     .colorScheme.secondary.withOpacity(0.5),
                  boxShadow: [
                    BoxShadow(
                        color: ThemeConfig.blackColor.withOpacity(0.2),
                        blurRadius: 1,
                        spreadRadius: 0.5)
                  ],
                  image:  DecorationImage(
                      image: AssetImage(widget.image ?? ""),fit: BoxFit.fill
                  )
              )
          ),
          const SizedBox(width: 10,),
          Flexible(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Product Name",style: ThemeConfig.black12base,),
                  const SizedBox(height: 4,),
                  Text("Product Description is here spicy",style: ThemeConfig.medium10,),
                  const SizedBox(height: 4,),


                  RichText(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    text: const TextSpan(
                      text: 'Quantity: ',
                      style:  TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color:ThemeConfig.blackColor,
                        fontSize: 10,
                        //decoration: TextDecoration.lineThrough,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '2 persons',
                          style:  TextStyle(
                            // overflow: TextOverflow.ellipsis,
                              color: Colors.black,
                              decoration: TextDecoration.none,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 4,),

                  RichText(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    text: const TextSpan(
                      text: '\u{20b9} 200',
                      style:  TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Colors.grey,
                        fontSize: 10,
                        decoration: TextDecoration.lineThrough,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '  \u{20b9}180',
                          style:  TextStyle(
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
          const SizedBox(width: 6,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,

            children:  [
              InkWell(
                onTap: (){
                  _toggleFavourite();
                },
                child: Icon(  isFavourite ? Icons.favorite : Icons.favorite_border,
                  color: isFavourite ? Colors.red : null,size: 22,),
              ),
              const SizedBox(height: 14,),

              count == 0 ?   InkWell(
                  onTap: (){
                    _incrementCount();
                  },
                  child: Icon(Icons.add)):

              Row(
                children: [
                  // IconButton(
                  //   onPressed: _decrementCount,
                  //   icon: const Icon(Icons.remove),
                  // ),
                  InkWell(
                      onTap: (){
                        _decrementCount();
                      },
                      child: const Text("-",style: TextStyle(fontSize: 40),)),
                  const SizedBox(width: 10,),
                  SizedBox(
                    width: 20.0,
                    child: Text(
                      '$count',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(width: 10,),
                  InkWell(
                      onTap: (){
                        _incrementCount();
                      },
                      child: const Text("+",style: TextStyle(fontSize: 24),))
                  // IconButton(
                  //   onPressed: _incrementCount,
                  //   icon: Icon(Icons.add),
                  // ),
                ],
              ),


            ],
          ),
          const SizedBox(width: 10,),

        ],
      ),
    );
  }
}

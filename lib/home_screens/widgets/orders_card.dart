import 'package:cheff_restaurant/componants/app_custom_card.dart';
import 'package:cheff_restaurant/utils/color_styles.dart';
import 'package:flutter/material.dart';


class OrdersCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final int? orderId;
  final String imageUrl;
  final String status;

  // final int serviceId;

  const OrdersCard({Key? key,
    required this.title,
    required this.subtitle,
    this.orderId,
    // required this.serviceId,
    required this.imageUrl,
    required this.status,


  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCustomCard(
      // title: "Title",
      // titleColor: ThemeConfig.blackColor.withOpacity(0.8),
      // padding:  const EdgeInsets.all(6),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Flexible(
                child: Row(
                  children: [
                    Container(
                      height: 90,
                      width: 80,
                      decoration:  BoxDecoration(
                        //shape: BoxShape.circle,
                        borderRadius: BorderRadius.circular(6),

                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/food.png")
                          // image: CachedNetworkImageProvider(URLS.parseImage(imageUrl),
                        ),
                      ),

                    ),
                    // Container(
                    //   margin: const EdgeInsets.all(4),
                    //   width: 80,
                    //   height: 90,
                    //   decoration:
                    //   ThemeConfig.boxDecorationWithRoundBorder(
                    //       context,
                    //      bgImageUrl: "assets/images/food.png"
                    //      // bgImageUrl: "${URLS.baseUrl}$imageUrl"
                    //   ),
                    // ),



                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "$title",
                              style:
                              ThemeConfig.black14base ),
                            const SizedBox(height: 6,),

                            Text(
                              "OrderId : $orderId",
                              style:
                              ThemeConfig.Medium14grey ),
                            const SizedBox(height: 6,),

                            Text(
                              "$subtitle",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                              style: ThemeConfig.textStyleSubTitle(
                                  context),
                            ),
                            const SizedBox(height: 6,),
                            Text("${status}",style: ThemeConfig.textStyleTitle(context)!.copyWith(fontSize: 12,),),

                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // Icon(Icons.arrow_forward_ios,size: 22,)
            ],
          ),
          // ListTile(
          //   minVerticalPadding: 0,
          //   contentPadding: const EdgeInsets.all(0),
          //   leading: Container(
          //     child: Container(
          //       width: 100,
          //       height: double.infinity,
          //       color: Colors.red,
          //     ),
          //   ),
          //   title: Text("Vendor Name", style: ThemeConfig.textStyleHeader(context).copyWith(fontWeight: FontWeight.w500),),
          //   subtitle: Column(
          //     crossAxisAlignment: CrossAxisAlignment.stretch,
          //     children: [
          //       Text("Vendor Name", style: Theme.of(context).textTheme.bodyText2,),
          //       Text("Vendor Name", style: Theme.of(context).textTheme.bodyText2,),
          //     ],
          //   ),

          // ),
        ],
      ),
    );

  }
}
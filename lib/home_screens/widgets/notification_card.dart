import 'package:cached_network_image/cached_network_image.dart';
import 'package:cheff_restaurant/componants/app_custom_card.dart';
import 'package:cheff_restaurant/utils/color_styles.dart';

import 'package:flutter/material.dart';

class CheffNotificationCard extends StatelessWidget {
  const CheffNotificationCard({super.key,
    required this.orderId,
    this.payment,
    this.userRequest,

    this.price,
    required this.onPress,
    required this.onAccept,
    required this.onReject,
    required this.imageUrl,
    this.userName,
    this.phoneNumber,
    this.address,

  }) ;
  final String? payment;
  final String?  price;
  final String? userRequest;
  final String orderId;
  final GestureLongPressCallback onPress;
  final GestureLongPressCallback onAccept;
  final GestureLongPressCallback onReject;
  final String imageUrl;
  final String? userName;
  final String? phoneNumber;
  final String? address;


  @override
  Widget build(BuildContext context) {
    return  AppCustomCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 55,
                      width: 55,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,

                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/food.png")
                          // image: CachedNetworkImageProvider(URLS.parseImage(imageUrl),
                        ),
                      ),

                    ),

                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Order Id : ${orderId}",
                          style: ThemeConfig.black14base,
                        ),
                        const SizedBox(
                          height: 6,
                        ),

                        Text(
                          "Payment: ${payment}",
                          style: ThemeConfig.Medium12grey,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Price:  ${price}",
                          style: ThemeConfig.Medium12grey,
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: onPress,
                      child: Container(
                        alignment: Alignment.center,
                        height: 20,
                        width: 50,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(4),color: Theme.of(context).secondaryHeaderColor),
                        child: Text(
                          "More",
                          style: ThemeConfig.black12base,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    // Text(
                    //   "12",
                    //   style: ThemeConfig.Large14,
                    // ),
                  ],
                ),

              ],
            ),



            const SizedBox(
              height: 14,
            ),
            Text("User Details", style: ThemeConfig.textStyleTitle(context)!.copyWith(color:  Theme.of(context).primaryColor.withOpacity(0.8)),),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Divider(color: Theme.of(context).primaryColor.withOpacity(0.8),),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.person_outline),
                    const SizedBox(width: 20,),
                    Text("$userName",style: ThemeConfig.Medium12grey,),
                  ],
                ),
                const SizedBox(height: 10,),

              ],
            ),


            const SizedBox(
              height: 16,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: onReject,
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: ThemeConfig.whiteColor,
                          border: Border.all(color: Theme.of(context).primaryColor,width: 0.5)
                      ),
                      child: Text(
                        "Decline",
                        style: ThemeConfig.black14base,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: InkWell(
                    onTap: onAccept,
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Theme.of(context).primaryColor),
                      child: Text(
                        "Accept",
                        style: ThemeConfig.Large14white,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }
}

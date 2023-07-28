
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cheff_restaurant/utils/color_styles.dart';
import 'package:cheff_restaurant/utils/url.dart';
import 'package:flutter/material.dart';

class OnGoingOrderCard extends StatelessWidget {
  const OnGoingOrderCard({Key? key, this.title,this.image,this.slots,this.onPress,this.isCompleted}) : super(key: key);
  final String? title;
  final String? image;
  final String? slots;
  final bool? isCompleted;
  final GestureLongPressCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: onPress,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.center,
          height: 90,
          width: 100,
          decoration: BoxDecoration(
            // color: ThemeConfig.cardBgColor,
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(
                  color: ThemeConfig.greyLight,
                  blurRadius:  10,
                  spreadRadius:  2)
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: ThemeConfig.cardBgColor,
                      borderRadius: BorderRadius.circular(4),
                        image:  DecorationImage(
                            image: CachedNetworkImageProvider(
                              URLS.parseImage(
                                  image),
                              // maxWidth: 50
                            ),
                            fit: BoxFit.fill
                        )
                    ),
                   // child: Image.asset("${image}",width: 50,),
                  ),
                  SizedBox(width: 18,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${title}",style: ThemeConfig.Medium14,),
                      // SizedBox(height: 10,),
                      //
                      // isCompleted == true ?
                      //
                      // Text("${slots}",style: ThemeConfig.red12medium,):
                      //
                      // slots == null ? Text(""):  Text("${slots}",style: ThemeConfig.grey12medium,)
                    ],
                  )
                ],
              ),
              Icon(Icons.arrow_forward_ios,color: ThemeConfig.iconColor,)
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:cheff_restaurant/utils/color_styles.dart';
import 'package:flutter/material.dart';

import 'widgets/notification_card.dart';


class CheffNotificationsPage extends StatefulWidget {
  const CheffNotificationsPage({Key? key}) : super(key: key);

  @override
  State<CheffNotificationsPage> createState() => _CheffNotificationsPageState();
}

class _CheffNotificationsPageState extends State<CheffNotificationsPage> {

  final bool _hasPayment = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: ThemeConfig.screenPadding,
          child: Column(

            children: [
              Text(
                "Notifications",
                style: ThemeConfig.black18base,
              ),

              const SizedBox(height: 20,),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount:4,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {

                        return CheffNotificationCard(
                          onReject: (){

                          },
                          onAccept: (){

                          },
                          onPress:  (){
                            setState(() {

                            });

                          },
                          orderId: "1",
                          payment: _hasPayment == false ? "Not paid": "Paid",
                          price: "\u{20B9} 2000",
                          imageUrl: "",
                          userName: "Sunil",
                          phoneNumber: "9492324156",
                          userRequest: "Request from user:  -",
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height: 8);
                      },
                    ),
                  ),
                ),
              ),




            ],
          ),
        ),
      ),
    );
  }
}

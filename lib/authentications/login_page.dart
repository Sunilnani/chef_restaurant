import 'package:cheff_restaurant/authentications/manager/auth_manager.dart';
import 'package:cheff_restaurant/authentications/otp_page.dart';
import 'package:cheff_restaurant/componants/custom_text_fields.dart';
import 'package:cheff_restaurant/componants/elevated_buttons.dart';
import 'package:cheff_restaurant/misc/navigation_service.dart';
import 'package:cheff_restaurant/network_calls/base_response.dart';
import 'package:cheff_restaurant/utils/color_styles.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneNumberController = TextEditingController();


  bool _loading = false;


  Future<void> _performLogin() async {
    String number = _phoneNumberController.text.trim();
    //String password = _passwordController.text.trim();

    if (number.isEmpty) {
      Fluttertoast.showToast(msg: "Please Enter Your Number");
      return;
    }
    if (number.length < 10) {
      Fluttertoast.showToast(msg: "Invalid Number");
      return;
    }


    setState(() {
      _loading = true;
    });

    final response = await authManager.performLogin(number);

    setState(() {
      _loading = false;
    });

    if (response.status == ResponseStatus.SUCCESS) {

      print("data of response is --${response.data}");
      setState(() {
        NavigationService().navigatePage(OtpPage(phoneNumber: number,));
        // NavigationService().navigatePage(OTPPage(phoneNumber: number,));
      });
      // Fluttertoast.showToast(msg: response.message!);
    } else {
      Fluttertoast.showToast(msg: response.message!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: ThemeConfig.screenPadding,
          width: double.infinity,
          decoration: const BoxDecoration(
            // image: DecorationImage(
            //     image: AssetImage("assets/images/background.png"))
          ),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/restaurant_logo.png',
                      width: 104,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Welcome",
                      style: ThemeConfig.black16large,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    AppTextFormFieldTitled(
                      fillColor: Colors.grey.withOpacity(0.1),
                      title:"Enter mobile number",
                      borderColor: ThemeConfig.primaryColor.withOpacity(0.1),
                      hintText: "Mobile Number",
                      prefixIcon: Icons.mobile_screen_share_rounded,
                      textInputType: TextInputType.phone,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Enter valid number";
                        }
                        return null;
                      },
                      controller: _phoneNumberController,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                      ],
                      // color: ThemeConfig.primaryColor,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    LDFilledButton(
                      minWidth: double.infinity,
                      onPressed: () {
                        _performLogin();

                        NavigationService().navigatePage(const OtpPage());
                      },
                      color: ThemeConfig.primaryColor,
                      child: Text(
                        "Login",
                        style: ThemeConfig.white14medium,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}

import 'dart:async';

import 'package:cheff_restaurant/authentications/manager/auth_manager.dart';
import 'package:cheff_restaurant/cheff_bottom_navigation_bar.dart';
import 'package:cheff_restaurant/componants/elevated_buttons.dart';
import 'package:cheff_restaurant/misc/navigation_service.dart';
import 'package:cheff_restaurant/network_calls/base_response.dart';
import 'package:cheff_restaurant/utils/color_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


class OtpPage extends ConsumerStatefulWidget {
  const OtpPage({Key? key ,this.phoneNumber}) : super(key: key);


  final String? phoneNumber;

  @override
  ConsumerState<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends ConsumerState<OtpPage> {
  int _seconds = 30;
  Timer? _timer;
  TextEditingController _controller = TextEditingController();

  final pilotIdController = TextEditingController();

  bool _loading = false;
  final _formKey = GlobalKey<FormState>();
  //final TextEditingController _otpController = TextEditingController();
  final _otpController = TextEditingController();



  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    //otpController.dispose();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  void _resendOtp() {
    setState(() {
      _seconds = 30;
      _startTimer();
      _controller.clear();
    });
    // resend OTP code here
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
        //     :
        // NavigationService().navigatePage(
        //   const CheffBottomNavigationBar(),
        //   replaceAll: true,
        // );
      },
    );
  }




  Future<void> _verifyOTP() async {
    // String number = _otpController.text.trim();
    String otp = _otpController.text.trim();

    // if (number.isEmpty) {
    //   Fluttertoast.showToast(msg: "Please Enter Your Number");
    //   return;
    // }
    // if (number.length < 3) {
    //   Fluttertoast.showToast(msg: "Invalid Number");
    //   return;
    // }

    if (otp.isEmpty) {
      Fluttertoast.showToast(msg: "Please Enter Your otp");
      return;
    }

    setState(() {
      _loading = true;
    });

    final response = await authManager.verifyOTP(widget.phoneNumber,otp);

    setState(() {
      _loading = false;
    });

    if (response.status == ResponseStatus.SUCCESS) {

      print("data of response is --${response.data}");
      // _fetchProfileData();

      setState(() {
        verifySuccess();
        _goNext();
        print("----------------------------> ${widget.phoneNumber}, ${otp}");
        // NavigationService().navigatePage(HomePage());
      });

    } else {
      Fluttertoast.showToast(msg: response.message!);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: ThemeConfig.screenPadding,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                // Text("${widget.phoneNumber}"),
                const Align(
                    alignment: Alignment.topLeft,
                    child: Icon(Icons.arrow_back_ios_outlined)),
                const SizedBox(
                  height: 50,
                ),
                Image.asset(
                  "assets/images/otp_verify.png",
                  width: 54,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Verification",
                  style: ThemeConfig.Medium14,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Verification Code",
                  style: ThemeConfig.black16large,
                ),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Code send to",
                        style: TextStyle(
                          color: ColorConstant.blueGray600,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.04,
                        ),
                      ),
                      const TextSpan(text: " "),
                      TextSpan(
                        text: "+${widget.phoneNumber}",
                        style: TextStyle(
                          color: ColorConstant.black900,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.04,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),

                const SizedBox(height: 30,),

                PinCodeTextField(
                  controller: _otpController,
                  length: 4,
                  scrollPadding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  obscureText: false,
                  obscuringCharacter: '*',
                  keyboardType: TextInputType.number,
                  autoDismissKeyboard: true,
                  enableActiveFill: true,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  onChanged: (value) {
                    // Handle pin code changes
                  },
                  pinTheme: PinTheme(
                    fieldHeight: 60,
                    fieldWidth: 60,
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(6),
                    selectedFillColor: ColorConstant.gray100,
                    activeFillColor: ColorConstant.gray100,
                    inactiveFillColor: ColorConstant.gray100,
                    // inactiveColor: ColorConstant.black900Cc,

                    inactiveColor: ThemeConfig.primaryColor.withOpacity(0.2),
                    selectedColor: ThemeConfig.primaryColor.withOpacity(0.2),
                    // selectedColor: ColorConstant.black900Cc,

                    activeColor: ThemeConfig.primaryColor.withOpacity(0.2),
                    // activeColor: ColorConstant.black900Cc,
                  ),
                  onCompleted: (value) {
                    // Handle pin code completion
                  },
                  appContext: context,
                ),
                const SizedBox(
                  height: 50,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "No OTP",
                        style: TextStyle(
                          color: ColorConstant.blueGray600,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.04,
                        ),
                      ),
                      const TextSpan(text: " "),
                      TextSpan(
                          text:"Resend OTP",
                          style: ThemeConfig.red12medium),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 30,
                ),
                LDFilledButton(
                  minWidth: double.infinity,
                  onPressed: () {
                    _verifyOTP();
                    // verifySuccess();
                    // _goNext();
                    //NavigationService().navigatePage(OtpPage());
                  },
                  color: ThemeConfig.primaryColor,
                  child: Text(
                    "Verify OTP",
                    style: ThemeConfig.white14medium,
                  ),
                )
              ],
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
                "Verify Success",
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
}

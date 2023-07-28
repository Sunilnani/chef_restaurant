
import 'package:flutter/material.dart';

class ThemeConfig {
  // RGB of #000000 is rgb(0, 0, 0)
  static const Map<int, Color> primarySwatchColor = {
    50: Color.fromRGBO(67, 182, 71, .1),
    100: Color.fromRGBO(67, 182, 71, .2),
    200: Color.fromRGBO(67, 182, 71, .3),
    300: Color.fromRGBO(67, 182, 71, .4),
    400: Color.fromRGBO(67, 182, 71, .5),
    500: Color.fromRGBO(67, 182, 71, .6),
    600: Color.fromRGBO(67, 182, 71, .7),
    700: Color.fromRGBO(67, 182, 71, .8),
    800: Color.fromRGBO(67, 182, 71, .9),
    900: Color.fromRGBO(67, 182, 71, 1),
  };
  static const MaterialColor primaryColor = MaterialColor(0xffffc529, primarySwatchColor);
  //static const MaterialColor primaryColor = MaterialColor(0xff123F69, primarySwatchColor);
  // static const MaterialColor secondaryColor = MaterialColor(0xFFC29A6B, primarySwatchColor);
  static const MaterialColor secondaryColor = MaterialColor(0xFFfe724c, primarySwatchColor);

  static const Color surfaceColor = Color(0xFFFFFFFF);

  static const Color primaryLightColor = Color(0xff304443);
  static const Color whiteTextColor = Color(0xFFFFFFFF);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color orangeColor = Color(0xFFf39304);

  static const Color errorColor = Color(0xFFe74c3c);
  static const Color blueColor = Color.fromARGB(255, 0, 85, 255);
  static const Color redColor = Color(0xFFCC0000);
  static const Color greenColor = Color(0xFF107F3E);
  static const Color lightGreenColor = Color(0xFF20BE79);
  static const Color limitCrossedColor = Color(0xFFc0392b);
  static const Color appBgGreyColor = Color(0xffE7E7E7);

  static const Color foodColor = Color(0xFFEC6064);
  static const Color roomItemsColor = Color(0xFF67C0D1);
  static const Color maintenanceColor = Color(0xFFD18067);
  static const Color fuelColor = Color(0xFFe84393);
  static const Color moviesColor = Color(0xFF3533B8);
  static const Color restaurantColor = Color(0xFF9D4083);
  static const Color totalColor = Color(0xFF169871);

  static const Color generalTextColor = Color(0xFF1C1C1C);
  static const Color borderColor = Color(0xFFE7E7E7);

  static const Color lightGreyColor = Color.fromRGBO(18, 18, 18, 0.5);
  static const Color shadowColor = Color.fromRGBO(0, 0, 0, 0.08);

  static  Color bgColor = secondaryColor.withOpacity(0.1);
  static const Color bgGreyColor = Color(0xffE7E7E7);
  static const Color textFieldBgColor = Color(0xffE7E7E7);

  static const Color lightBlackColor = Color(0xff121212);
  static Color formBorderColor = blackColor.withOpacity(0.1);


  static const double elevationCard = 5;
  static const double buttonCircular = 8;
  static const double screenPaddingValue = 20;
  static const EdgeInsets screenPadding = EdgeInsets.symmetric(horizontal: 20,vertical: 10);

  static Color titleBackground = const Color(0xFF123F69).withOpacity(0.1);
  static Color cardBgColor =const Color(0xFFF8F8F8);
  static const Color blackColor = Color(0xFF272d2f);
  static Color iconColor = const Color(0xFF777777);
  static Color goldColor = const Color(0xFFFBC52C);
  static Color boxGreyColor = const Color(0xFFF6F6F6);

  static TextStyle black16large = const TextStyle(color: Color(0xFF272d2f),fontSize: 16,fontWeight: FontWeight.w600);
  static TextStyle black12low = const TextStyle(color: Color(0xFF111111),fontSize: 12,fontWeight: FontWeight.w500);
  static TextStyle black12base = const TextStyle(color: Color(0xFF1c1c1c),fontSize: 12,fontWeight: FontWeight.w500,overflow: TextOverflow.ellipsis);
  static TextStyle black18base = const TextStyle(color: Color(0xFF1c1c1c),fontSize: 18,fontWeight: FontWeight.w500);
  static TextStyle black16base = const TextStyle(color: Color(0xFF1c1c1c),fontSize: 16,fontWeight: FontWeight.w500);
  static TextStyle black14base = const TextStyle(color: Color(0xFF1c1c1c),fontSize: 14,fontWeight: FontWeight.w500);
  static TextStyle black12large = const TextStyle(color: Color(0xFF1c1c1c),fontSize: 12,fontWeight: FontWeight.w600);
  static TextStyle titleblack = const TextStyle(color: Color(0xFF1c1c1c),fontSize: 14,fontWeight: FontWeight.w600);
  static TextStyle Medium14 = const TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xFF1C1C1C));
  static TextStyle black14large = const TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xFF1C1C1C));
  static TextStyle Medium14grey = const TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xFF777777));

  static TextStyle primary12base = const TextStyle(color: Color(0xFF123F69),fontSize: 12,fontWeight: FontWeight.w500);

  static TextStyle primary12baseLarge = const TextStyle(color: Color(0xFF123F69),fontSize: 12,fontWeight: FontWeight.w600);

  static TextStyle green12base = const TextStyle(color: Color(0xFF2EC458),fontSize: 12,fontWeight: FontWeight.w500);

  static TextStyle green14base = const TextStyle(color: Color(0xFF2EC458),fontSize: 14,fontWeight: FontWeight.w500);



  static TextStyle white14medium = const TextStyle(color:Colors.white,fontSize: 14,fontWeight: FontWeight.w500);
  static TextStyle white12base = const TextStyle(color:Color(0xFFFFFFFF),fontSize: 12,fontWeight: FontWeight.w500);
  static TextStyle white28large = const TextStyle(color:Color(0xFFFFFFFF),fontSize: 28,fontWeight: FontWeight.w600);


  static TextStyle red12medium = const TextStyle(color: Color(0xFFE12030),fontSize: 12,fontWeight: FontWeight.w500);

  static TextStyle baseGreay12Medium =const TextStyle(color: Color(0xFF626262),fontSize: 12,fontWeight: FontWeight.w500);
  static TextStyle grey12medium = const TextStyle(color: Color(0xFF999999),fontSize: 12,fontWeight: FontWeight.w500);
  static TextStyle grey12large = const TextStyle(color: Color(0xFF999999),fontSize: 12,fontWeight: FontWeight.w600);
  static TextStyle darkGrey12medium = const TextStyle(color: Color(0xFF777777),fontSize: 12,fontWeight: FontWeight.w500);
  static TextStyle grey12lightbase = TextStyle(color: Color(0xFF959595),fontSize: 12,fontWeight: FontWeight.w400);
  static TextStyle darkGrey12low = const TextStyle(color: Color(0xFF777777),fontSize: 12,fontWeight: FontWeight.w400);

  static TextStyle grey10low = const TextStyle(color: Color(0xFF777777),fontSize: 10,fontWeight: FontWeight.w500,);

  static TextStyle primary10medium = const TextStyle(color: Color(0xFF123F69),fontSize: 10,fontWeight: FontWeight.w500);
  static TextStyle primary12medium = const TextStyle(color: Color(0xFF123F69),fontSize: 12,fontWeight: FontWeight.w500);
  static TextStyle primary14medium = const TextStyle(color: Color(0xFF123F69),fontSize: 14,fontWeight: FontWeight.w500);


  static TextStyle redColor14= TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.red);
  static TextStyle redColor14Medium =const TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xFFE12030));


  static bool isTab(context) => MediaQuery.of(context).size.shortestSide > 530 ? true : false ;







  // static const Color shadowColor = Color.fromRGBO(0, 0, 0, 0.08);
  static const BoxShadow boxShadow1 = BoxShadow(
    color: shadowColor,
    blurRadius: 20.0,
    offset: Offset(0.0, 4.0),
    spreadRadius: 0.0,
  );
  static const BoxShadow boxShadow2 = BoxShadow(
    color: shadowColor,
    blurRadius: 20.0,
    offset: Offset(4.0, 4.0),
    spreadRadius: 0.0,
  );
  static double appRadius = 12;
  static RoundedRectangleBorder roundedRectangleBorder1 = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(4),
  );


  static BorderRadius borderRadiusRounded = BorderRadius.circular(appRadius);
  static BorderRadius cutomBorderRadiusRounded(double borderRadius) => BorderRadius.circular(borderRadius);
  static const TextStyle textStyle1 = TextStyle(
      fontSize: 12,
      color: lightBlackColor
  );
  static  TextStyle textStyleGrey = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Colors.black.withOpacity(0.4)
  );
  static  TextStyle textStyleGrey14 = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.black.withOpacity(0.4)
  );

  static  TextStyle textStyleGrey16 = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.black.withOpacity(0.4)
  );

  static  TextStyle textStyleblackshade14 = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.black.withOpacity(0.6)
  );


  static  TextStyle textStylered14 = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: ThemeConfig.redColor
  );


  static  TextStyle textStylegrey12 = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: ThemeConfig.lightGreyColor
  );

  static  TextStyle textStyleprimary12 = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: ThemeConfig.primary
  );

  static  TextStyle textStyleSecondary = const TextStyle(

      fontSize: 12,
      color:ThemeConfig.secondaryColor
  );
  static  TextStyle textStyleSecondary14 = const TextStyle(
      fontSize: 14,
      color:ThemeConfig.secondaryColor
  );

  // static const TextStyle textStyleTitle = TextStyle(
  //     fontSize: 16,
  //     color: secondaryColor,
  //     fontWeight: FontWeight.w700
  // );
  static const TextStyle textStyleSecondary20 = TextStyle(
      fontSize: 20,
      color: secondaryColor,
      fontWeight: FontWeight.w700
  );

  static const TextStyle textStyleListTileTitle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500
  );
  static const TextStyle textStyleHeading = TextStyle(
      fontSize: 22,
      color: secondaryColor,
      fontWeight: FontWeight.w700
  );
  static TextStyle textStyleHint = TextStyle(color: ThemeConfig.blackColor.withOpacity(0.5), fontWeight: FontWeight.w400, fontSize: 14, letterSpacing: 0.5);
  static TextStyle textStyleListTileSubTitle = textStyleHint.copyWith(fontSize: 12);

  static const TextStyle textStyleHeadingWhite = TextStyle(
      fontSize: 22,
      color: Colors.white,
      fontWeight: FontWeight.w500
  );

  static const TextStyle textStyleAccent = TextStyle(
      fontSize: 12,
      color: secondaryColor,
      fontWeight: FontWeight.w500
  );
  static const TextStyle textStyleAccent6Bold = TextStyle(
      fontSize: 12,
      color: secondaryColor,
      fontWeight: FontWeight.w700
  );
  static const TextStyle textStylePrimary1 = TextStyle(
      fontSize: 16,
      color: primaryColor,
      fontWeight: FontWeight.w500
  );
  static const TextStyle textStylewhite16 = TextStyle(
      fontSize: 16,
      color:Colors.white,
      fontWeight: FontWeight.w500
  );

  static const TextStyle textStylewhite16500 = TextStyle(
      fontSize: 16,
      color:Colors.white,
      fontWeight: FontWeight.w600
  );

  static  TextStyle textStylePrimary16 = TextStyle(
      fontSize: 16,
      color:ThemeConfig.primary,
      fontWeight: FontWeight.w500
  );
  static const TextStyle textStylePrimary2 = TextStyle(
      fontSize: 14,
      color: primaryColor,
      fontWeight: FontWeight.w500
  );
  static  TextStyle minimumStyleGrey =  TextStyle(
      fontSize: 14,
      color: Colors.black.withOpacity(0.6),
      fontWeight: FontWeight.w500
  );
  static  TextStyle minimumStyleGrey12 = const TextStyle(
      fontSize: 12,
      color: Colors.grey,
      fontWeight: FontWeight.w500
  );

  static TextStyle textStyleWithColor({Color? color}) => TextStyle(
      fontSize: 16,
      color: color ?? primaryColor,
      fontWeight: FontWeight.w500
  );
  static TextStyle textStyleWithColorBold({Color? color}) => TextStyle(
      fontSize: 16,
      color: color ?? primaryColor,
      fontWeight: FontWeight.w600
  );

  static TextStyle textStyleHeadingBlack({Color? color}) => const TextStyle(
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.w500
  );
  static TextStyle textStyleHeadingBlack16({Color? color}) => const TextStyle(
      fontSize: 16,
      color: Colors.black,
      fontWeight: FontWeight.w500
  );
  static const TextStyle textStylePrimary6Bold = TextStyle(
      fontSize: 12,
      color: primaryColor,
      fontWeight: FontWeight.w700
  );
  static const TextStyle textStyleCaption = TextStyle(
      fontSize: 12,
      color: lightBlackColor,
      fontWeight: FontWeight.w300
  );

  static const TextStyle textStyleWhite = TextStyle(
      fontSize: 12,
      color: ThemeConfig.whiteColor,
      fontWeight: FontWeight.w500
  );

  static const TextStyle textStyleWhite14 = TextStyle(
      fontSize: 14,
      color: ThemeConfig.whiteColor,
      fontWeight: FontWeight.w500
  );

  static TextStyle rowTextStyle(bool isBold) => TextStyle(
      fontSize: 12,
      color: lightBlackColor,
      fontWeight: isBold ? FontWeight.w700 : FontWeight.w400
  );
  static double roundBorderRadius = 8;


  static TextStyle Medium16 = const TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black);
  static TextStyle Large16Black = const TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black);
  static TextStyle Large16white = const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white);
  static TextStyle Large14white = const TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white);

  static TextStyle? textStyleSubTitle(context) => Theme.of(context).textTheme.bodyText2!.copyWith(color: blackColor.withOpacity(0.8));
  // static TextStyle? textStyleTitle(context) => TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1);

  static TextStyle Large20 = const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black);


  // static TextStyle Medium14grey =   TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: ThemeConfig.blackColor.withOpacity(0.8));
  static TextStyle Medium12grey = const TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.grey);

  static TextStyle medium12 =  TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: ThemeConfig.blackColor.withOpacity(0.8));
  static TextStyle medium10 =  TextStyle(fontSize: 10,fontWeight: FontWeight.w500,color: ThemeConfig.blackColor.withOpacity(0.8));
  static TextStyle Medium16grey =   TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.grey);

  static TextStyle primary14= TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: ThemeConfig.primary);

  static TextStyle Large14Black = const TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.black);

  static TextStyle Large12Black = const TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: Colors.black);

  static Color greyLight= Colors.grey.withOpacity(0.2);

  // static Color redColor= Colors.red;

  static Widget divider = Container(
    height: 40,
    width: 2,
    color:ThemeConfig.greyLight,
  );



  static BoxDecoration boxDecorationWithRoundBorder(context, {
    Color? color, double? radius, String? bgImageUrl, BoxFit ?fit, double ?elivation, double ? spreadRadius ,Border? border}) =>

      BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? roundBorderRadius),
          image: bgImageUrl == null ? null : DecorationImage(
              fit: fit??BoxFit.cover,
              image: NetworkImage(bgImageUrl)),
          border:border,
          boxShadow: [
            BoxShadow(
                color: blackColor.withOpacity(0.1),
                blurRadius: elivation ?? 10,
                spreadRadius: spreadRadius?? 2)
          ],
          color: color ?? Theme.of(context).primaryColor.withOpacity(0.2)
      );

  static double borderRadius = 12;

  static Color primary= Color(0xFF0F4068);

  static TextStyle primary12= TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: ThemeConfig.primary);
  //static TextStyle primary16= TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: ThemeConfig.primary);

  static TextStyle red14= TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.red);
  static TextStyle red16= TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.red);


  static TextStyle primary145=  TextStyle(
      color:ThemeConfig.primary,
      fontWeight: FontWeight.w500,
      fontSize: 14);

  static TextStyle primary145black=  TextStyle(
      color:Colors.black,
      fontWeight: FontWeight.w500,
      fontSize: 14);
  static TextStyle primary16= TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: ThemeConfig.primary);
  static TextStyle primary20= TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: ThemeConfig.primary);






  static TextStyle? textStyleTitle(context) => TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1);


  static BoxDecoration radius=BoxDecoration(
    borderRadius: BorderRadius.circular(6),
    color: ThemeConfig.whiteColor,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.3),
        offset: const Offset(
          1.0,
          1.0,
        ),
        blurRadius: 2.0,
        spreadRadius: 2.0,
      ),
      const BoxShadow(
        color:Colors.white38,
        offset: Offset(0.0, 0.0),
        blurRadius: 0.0,
        spreadRadius: 0.0,
      ), //BoxShadow
    ],
    //boxShadow: [
    //   BoxShadow(
    //   color:Colors.grey.withOpacity(0.4),
    //   offset: const Offset(
    //     1.0,
    //     1.0,
    //   ),
    //   blurRadius: 1.0,
    //   spreadRadius: 1.0,
    // ), ]
  );

  static BoxDecoration radius_primaryColor=BoxDecoration(
    borderRadius: BorderRadius.circular(8),
    color: ThemeConfig.primaryColor,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.3),
        offset: const Offset(
          1.0,
          1.0,
        ),
        blurRadius: 1.0,
        spreadRadius: 1.0,
      ),
      const BoxShadow(
        color:Colors.white38,
        offset: Offset(0.0, 0.0),
        blurRadius: 0.0,
        spreadRadius: 0.0,
      ), //BoxShadow
    ],
    //boxShadow: [
    //   BoxShadow(
    //   color:Colors.grey.withOpacity(0.4),
    //   offset: const Offset(
    //     1.0,
    //     1.0,
    //   ),
    //   blurRadius: 1.0,
    //   spreadRadius: 1.0,
    // ), ]
  );


  static BoxDecoration radiuslaunch=BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: ThemeConfig.primaryColor,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.3),
        offset: const Offset(
          1.0,
          1.0,
        ),
        blurRadius: 1.0,
        spreadRadius: 1.0,
      ),
      const BoxShadow(
        color:Colors.white38,
        offset: Offset(0.0, 0.0),
        blurRadius: 0.0,
        spreadRadius: 0.0,
      ), //BoxShadow
    ],
    //boxShadow: [
    //   BoxShadow(
    //   color:Colors.grey.withOpacity(0.4),
    //   offset: const Offset(
    //     1.0,
    //     1.0,
    //   ),
    //   blurRadius: 1.0,
    //   spreadRadius: 1.0,
    // ), ]
  );

}


class ColorConstant {
  static Color black9007f = fromHex('#7f000000');

  static Color gray5001 = fromHex('#f6faff');

  static Color black9007e = fromHex('#7e000000');

  static Color gray5002 = fromHex('#fff5f5');

  static Color black900B2 = fromHex('#b2000000');

  static Color gray5003 = fromHex('#fff4f4');

  static Color gray90099 = fromHex('#991e1e1e');

  static Color black90090 = fromHex('#90000000');

  static Color blueGray900A2 = fromHex('#a2172b4d');

  static Color indigo800A2 = fromHex('#a21f4d8a');

  static Color greenA100 = fromHex('#b2ffb1');

  static Color green700 = fromHex('#1e8a49');

  static Color gray50070 = fromHex('#70979797');

  static Color black90087 = fromHex('#87000000');

  static Color blueGray90002 = fromHex('#1b2c57');

  static Color blueGray90001 = fromHex('#363636');

  static Color blueGray900 = fromHex('#172b4d');

  static Color indigo80001 = fromHex('#1f4d8a');

  static Color blueGray90087 = fromHex('#87172b4d');

  static Color deepOrange100 = fromHex('#ffc1c1');

  static Color blue10075 = fromHex('#75c5deff');

  static Color gray400 = fromHex('#aeaeb2');

  static Color blueGray100 = fromHex('#d9d9d9');

  static Color blueGray500 = fromHex('#617786');

  static Color amber100 = fromHex('#ffe8c1');

  static Color black90099 = fromHex('#99000000');

  static Color gray8000f = fromHex('#0f363746');

  static Color blue100 = fromHex('#cce0ff');

  static Color red700 = fromHex('#cd3426');

  static Color gray50 = fromHex('#f4f9ff');

  static Color teal400 = fromHex('#2ec28b');

  static Color black90066 = fromHex('#66000000');

  static Color blueGray1007f = fromHex('#7fcecece');

  static Color teal800 = fromHex('#008050');

  static Color gray50001 = fromHex('#a4a4a4');

  static Color gray50003 = fromHex('#a1a1a1');

  static Color gray50002 = fromHex('#a7a7a7');

  static Color blueGray90066 = fromHex('#66172b4d');

  static Color gray50004 = fromHex('#939393');

  static Color gray10090 = fromHex('#90f3f3f3');

  static Color blueGray200 = fromHex('#b3bac5');

  static Color black900A2 = fromHex('#a2000000');

  static Color gray500 = fromHex('#909090');

  static Color blueGray600 = fromHex('#5e6c84');

  static Color gray900 = fromHex('#202020');

  static Color gray100 = fromHex('#f4f5f7');

  static Color cyan100 = fromHex('#c6ffea');

  static Color whiteA7007f = fromHex('#7fffffff');

  static Color gray600Cc = fromHex('#cc787878');

  static Color red600 = fromHex('#ee2020');

  static Color green900 = fromHex('#026700');

  static Color gray20001 = fromHex('#ececec');

  static Color red70087 = fromHex('#87cd3426');

  static Color redA700 = fromHex('#d30000');

  static Color black9004c = fromHex('#4c000000');

  static Color gray600 = fromHex('#787878');

  static Color redA200 = fromHex('#ff5c5c');

  static Color orange800 = fromHex('#bb7800');

  static Color gray200 = fromHex('#f0f0f0');

  static Color gray10003 = fromHex('#f2f2f7');

  static Color gray10002 = fromHex('#f4f4f4');

  static Color gray10005 = fromHex('#f7f7f7');

  static Color gray10004 = fromHex('#f3f3f3');

  static Color gray40001 = fromHex('#c8c8cd');

  static Color gray10087 = fromHex('#87f4f5f7');

  static Color gray40002 = fromHex('#bababa');

  static Color gray10001 = fromHex('#f4f3f6');

  static Color gray40003 = fromHex('#b3b3b3');

  static Color blueGray40001 = fromHex('#8993a4');

  static Color whiteA700 = fromHex('#ffffff');

  static Color indigo800 = fromHex('#1f4d89');

  static Color gray60099 = fromHex('#99787878');

  static Color red900 = fromHex('#a30000');

  static Color red100 = fromHex('#ffcece');

  static Color black900 = fromHex('#000000');

  static Color blueGray800 = fromHex('#253857');

  static Color black900Bf = fromHex('#bf000000');

  static Color gray60087 = fromHex('#87787878');

  static Color red70090 = fromHex('#90cd3426');

  static Color gray60001 = fromHex('#777777');

  static Color blueGray400 = fromHex('#898a8d');

  static Color black900E0 = fromHex('#e0000000');

  static Color indigo80090 = fromHex('#901f4d8a');

  static Color gray90001 = fromHex('#1e1e1e');

  static Color blueGray90003 = fromHex('#0f2e58');

  static Color blueGray60001 = fromHex('#606d7a');

  static Color blueGray60002 = fromHex('#636c84');

  static Color blueGray60003 = fromHex('#486484');

  static Color gray300 = fromHex('#e2e2e2');

  static Color gray30001 = fromHex('#dfe1e6');

  static Color black900Cc = fromHex('#cc000000');

  static Color whiteA70001 = fromHex('#fcfcfe');

  static Color gray6007e = fromHex('#7e787878');

  static Color blueGray600B2 = fromHex('#b25e6c84');

  static Color blueGray90099 = fromHex('#99172b4d');

  static Color indigo900 = fromHex('#00226b');

  static Color blue10001 = fromHex('#c6d9ff');




  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
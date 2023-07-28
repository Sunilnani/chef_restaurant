import 'package:cheff_restaurant/authentications/login_page.dart';
import 'package:cheff_restaurant/cheff_bottom_navigation_bar.dart';
import 'package:cheff_restaurant/misc/navigation_service.dart';
import 'package:cheff_restaurant/utils/storage_keys.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _goNext() async {
    Future.delayed(
      const Duration(seconds: 2),
          () {
        // NavigationService().navigatePage(
        //   const LoginPage(),
        //   replaceAll: true,
        // );

        // NavigationService().navigatePage(
        //   const LanguageSelectionPage(),
        //   replaceAll: true,
        // );
      },
    );
  }

  Future<void> _forward() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    try {
      final token = sharedPreferences.getString(StorageKeys.token) ?? "";
      final user = sharedPreferences.getString(StorageKeys.user) ?? "";
      try {
        // final userModel = userDataModelFromJson(user);
        // ref.read(userDataProvider.notifier).updateUserData(userModel);
      } catch(err) {
        // try {
        //   final response = await authManager.fetchProfile();
        //   ref.read(userDataProvider.notifier).updateUserData(response.data);
        // } catch (err) {
        //   print(err);
        // }
        print(err);
      }
      Future.delayed(const Duration(seconds: 2), () {
        if(token.isNotEmpty){
          NavigationService().navigatePage(CheffBottomNavigationBar(),replaceAll: true);
        }
        else{
          NavigationService().navigatePage(
            const LoginPage(),
            replaceAll: true,
          );
          // NavigationService().navigatePage(LoginPage(), replaceAll: true);
        }

      });
    } catch (err) {
      await sharedPreferences.clear();
      // NavigationService().navigatePage(IntroductionScreens(), replaceAll: true);
    }
  }


  @override
  void initState() {
    super.initState();
    _forward();
    //_goNext();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          child: Image.asset(
            'assets/images/restaurant_logo.png',
          ),
        ),
      ),
    );
  }
}







//
// import 'package:cheff_restaurant/authentications/login_page.dart';
// import 'package:cheff_restaurant/misc/navigation_service.dart';
// import 'package:cheff_restaurant/utils/storage_keys.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   _goNext() async {
//     Future.delayed(
//       const Duration(seconds: 2),
//           () {
//         // NavigationService().navigatePage(
//         //   const LoginPage(),
//         //   replaceAll: true,
//         // );
//
//         // NavigationService().navigatePage(
//         //   const LanguageSelectionPage(),
//         //   replaceAll: true,
//         // );
//       },
//     );
//   }
//
//   Future<void> _forward() async {
//     final sharedPreferences = await SharedPreferences.getInstance();
//     try {
//       final token = sharedPreferences.getString(StorageKeys.token) ?? "";
//       final user = sharedPreferences.getString(StorageKeys.user) ?? "";
//       try {
//         // final userModel = userDataModelFromJson(user);
//         // ref.read(userDataProvider.notifier).updateUserData(userModel);
//       } catch(err) {
//         // try {
//         //   final response = await authManager.fetchProfile();
//         //   ref.read(userDataProvider.notifier).updateUserData(response.data);
//         // } catch (err) {
//         //   print(err);
//         // }
//         print(err);
//       }
//       Future.delayed(const Duration(seconds: 2), () {
//         if(token.isNotEmpty){
//           //NavigationService().navigatePage(BottomNavigation(),replaceAll: true);
//         }
//         else{
//
//           NavigationService().navigatePage(LoginPage(), replaceAll: true);
//         }
//
//       });
//     } catch (err) {
//       await sharedPreferences.clear();
//       // NavigationService().navigatePage(IntroductionScreens(), replaceAll: true);
//     }
//   }
//
//
//   @override
//   void initState() {
//     super.initState();
//     _forward();
//     //_goNext();
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           width: MediaQuery.of(context).size.width / 2,
//           child: Image.asset(
//             'assets/images/restaurant_logo.png',
//           ),
//         ),
//       ),
//     );
//   }
// }

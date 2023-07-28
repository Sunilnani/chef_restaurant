import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
  static final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
  Future<dynamic> navigateTo<T extends Object>(
      Route<T> route, {
        bool replaceAll = false,
        bool replace = false,
        removeUntil,
      }) {
    if(replace) {
      return navigatorKey.currentState!.pushReplacement(route);
    }
    if (removeUntil != null) {
      return navigatorKey.currentState!.pushAndRemoveUntil(route, removeUntil);
    }
    if (replaceAll) {
      return navigatorKey.currentState!.pushAndRemoveUntil(route, (route) => false);
    } else {
      return navigatorKey.currentState!.push(route);
    }
  }
  void popUntil<T extends Object>(
      String title
      ) {
    return navigatorKey.currentState!.popUntil(ModalRoute.withName(title));
  }

  pop() {
    return navigatorKey.currentState!.pop();
  }

  Future<dynamic> navigatePage(Widget page,
      {PageTransitionType type = PageTransitionType.fade, bool replaceAll = false, bool replace = false, dynamic removeUntil, bool isModal = false, String? name}) {

    if (isModal) {
      return navigateTo<PageRouteBuilder<dynamic>>(PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) {
          return page;
        },
        fullscreenDialog: true,
        settings: RouteSettings(name: name),
      )
//        MaterialPageRoute(
//          builder: (context) {
//            return page;
//          },
//          fullscreenDialog: true,
//          settings: RouteSettings(name: name),
//        ),
      );
    }
    return navigateTo<PageRouteBuilder<dynamic>>(
        PageTransition(
          settings: RouteSettings(name: name),
          child: page,
          type: type,
          curve: Curves.easeInOut,
        ),
        removeUntil: removeUntil,
        replace: replace,
        replaceAll: replaceAll);
  }
}

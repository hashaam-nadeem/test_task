import 'dart:io';

import 'package:flutter/material.dart';

class AppRoutes {
  static void push(BuildContext context, Widget page) {
    Platform.isIOS
        ? Navigator.push(
            context,
            // PageTransition(type: PageTransitionType.bottomToTop, child: page)
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return page;
              },
              reverseTransitionDuration: Duration(milliseconds: 500),
              transitionDuration: Duration(
                milliseconds: 500,
              ), // Set transition duration here
            ),
          )
        : Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => page));
  }

  static void replace(BuildContext context, Widget page) {
    Platform.isIOS
        ? Navigator.pushReplacement(
            context,
            // PageTransition(type: PageTransitionType.topToBottom, child: page)
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return page;
              },
              reverseTransitionDuration: Duration(milliseconds: 500),
              transitionDuration: Duration(
                milliseconds: 500,
              ), // Set transition duration here
            ),
          )
        : Navigator.of(
            context,
          ).pushReplacement(MaterialPageRoute(builder: (context) => page));
  }

  static void makeFirst(BuildContext context, Widget page) {
    Navigator.of(context).popUntil((predicate) => predicate.isFirst);
    Platform.isIOS
        ? Navigator.pushReplacement(
            context,
            // PageTransition(type: PageTransitionType.topToBottom, child: page)
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return page;
              },
              reverseTransitionDuration: Duration(milliseconds: 500),
              transitionDuration: Duration(
                milliseconds: 500,
              ), // Set transition duration here
            ),
          )
        : Navigator.of(
            context,
          ).pushReplacement(MaterialPageRoute(builder: (context) => page));
  }

  static void pop(BuildContext context) {
    // Platform.isIOS
    //     ? Navigator.pop(
    //         context,
    //         // PageTransition(
    //         //   type: PageTransitionType.leftToRight,
    //         //   child: Container(),
    //         // )
    //         PageRouteBuilder(
    //           pageBuilder: (context, animation, secondaryAnimation) {
    //             return Container();
    //           },
    //           reverseTransitionDuration: Duration(milliseconds: 500),
    //           transitionDuration:
    //               Duration(milliseconds: 500), // Set transition duration here
    //         ),
    //       )
    //     :
    Navigator.of(context).pop();
  }

  static void dismissAlert(context) {
    Navigator.of(context).pop();
  }
}

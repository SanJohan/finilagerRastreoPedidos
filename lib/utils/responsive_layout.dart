import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget largeScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;
  final Widget? tabletScreen;

  const ResponsiveLayout({
  Key? key,
  required this.largeScreen,
   this.mediumScreen,
   this.smallScreen,
   this.tabletScreen,
}) : super(key: key);

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 900;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 900 &&
        MediaQuery.of(context).size.width < 1200;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 1200 && MediaQuery.of(context).size.height > 700 ;
  }
  static bool isTabletScreen(BuildContext context) {
    return  MediaQuery.of(context).size.height > MediaQuery.of(context).size.width ;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return largeScreen;
        } else if (constraints.maxWidth < 1200 && constraints.maxWidth > 800) {
          return mediumScreen ?? largeScreen;
        }else {
          return smallScreen ?? largeScreen;
        }
      },
    );
  }
}
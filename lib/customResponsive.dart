import 'package:flutter/material.dart';

class CustomResponsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const CustomResponsive({Key key, this.mobile, this.tablet, this.desktop})
      : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 450;
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 450 &&
      MediaQuery.of(context).size.width < 1024;
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1024;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (size.width >= 1024) {
      return desktop;
    } else if (size.width >= 450 && tablet != null) {
      return tablet;
    } else {
      return mobile;
    }
  }
}

import 'package:flutter/material.dart';

class BaseWidgetContainer extends StatelessWidget {
  const BaseWidgetContainer({
    super.key,
    this.appBar,
    required this.body,
    this.scrollController,
    this.scrollPhysics,
    this.actvateScroll = false,
    this.backgroundColor,
    this.scaffoldKey,
    this.bottomNavigationBar,
  });

  final PreferredSizeWidget? appBar;
  final Widget body;
  final ScrollController? scrollController;
  final ScrollPhysics? scrollPhysics;
  final bool? actvateScroll;
  final Color? backgroundColor;
  final Key? scaffoldKey;
  final Widget? bottomNavigationBar;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: actvateScroll ?? false
          ? SingleChildScrollView(
              controller: scrollController,
              physics: scrollPhysics ?? const NeverScrollableScrollPhysics(),
              child: body,
            )
          : body,
      backgroundColor: backgroundColor,
      key: scaffoldKey,
      bottomNavigationBar: bottomNavigationBar,

    );
  }
}
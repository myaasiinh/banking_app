
import 'package:flutter/material.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:motion_tab_bar_v2/motion-tab-controller.dart';
import '../../core/constants/colors.dart';
import '../analitik/analitik_screen.dart';
import '../home/home_screen.dart';
import '../saldo/saldo_screen.dart';


class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({super.key});

  @override
  State<MainMenuScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainMenuScreen> with TickerProviderStateMixin{
  // TabController _tabController;
  MotionTabBarController? _motionTabBarController;

  @override
  void initState() {
    super.initState();

    _motionTabBarController = MotionTabBarController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _motionTabBarController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: ColorUtils.purpleHoneycreeper,
          child: Center(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(), // swipe navigation handling is not supported
              // controller: _tabController,
              controller: _motionTabBarController,
              children: const <Widget>[
                 HomeScreen(),
                SaldoScreen(),
                AnalitikScreen(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: MotionTabBar(
          controller: _motionTabBarController, // ADD THIS if you need to change your tab programmatically
          initialSelectedTab: "Home",
          labels: const ["Home", "Wallet", "Analitik"],
          icons: const [Icons.home, Icons.wallet, Icons.analytics],
          tabSize: 50,
          tabBarHeight: 55,
          textStyle: const TextStyle(
            fontSize: 12,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          tabIconColor: Colors.grey,
          tabIconSize: 28.0,
          tabIconSelectedSize: 26.0,
          tabSelectedColor: ColorUtils.peachCream,
          tabIconSelectedColor: ColorUtils.coralOrange,
          tabBarColor: Colors.white,
          onTabItemSelected: (int value) {
            setState(() {
              // _tabController!.index = value;
              _motionTabBarController!.index = value;
            });
          },
        ),
      ),
    );
  }
}

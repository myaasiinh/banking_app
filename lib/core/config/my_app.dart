import 'package:flutter/material.dart';

import '../utils/route_app.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Your App',
      initialRoute: RouteApp.splash,  // Set the initial route
      onGenerateRoute: RouteApp.generateRoute,  // Set the routing logic
    );
  }
}
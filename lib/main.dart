import 'package:flutter/material.dart';

import 'core/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Islamic',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      routes: AppRoutes.routes,
    );
  }
}

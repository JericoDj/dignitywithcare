
import 'package:dignitywithcare/webDashboard.dart';
import 'package:flutter/material.dart';



class AdminWebApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin Web Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      home: WebDashboard(),
    );
  }
}

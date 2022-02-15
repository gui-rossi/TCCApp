import 'package:flutter/material.dart';

import 'Routes.dart';

void main() {
  runApp( const MyApp() );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.indigo),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute
    );
  }
}









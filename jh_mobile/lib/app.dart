import 'package:flutter/material.dart';
import 'views/_views_lib.dart';

class App extends StatelessWidget {
  const App({
    super.key
  });
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SENAI',
      builder: (context, child) {
        return SafeArea(
          child: child!,
        );
      },
      home: HomeView(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:jh_mobile/views/home_view.dart';

class App extends StatelessWidget {
  const App({
    Key? key
  }) : super(key: key);
  
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
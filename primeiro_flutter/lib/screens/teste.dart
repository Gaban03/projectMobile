import 'package:flutter/material.dart';

class Teste extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tela de Teste")),
      body: Center(
        child: Text("Login bem-sucedido!", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

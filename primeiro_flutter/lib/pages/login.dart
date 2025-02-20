import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.all(40.0), // Adiciona espaçamento ao redor de tudo
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Faz os inputs ocuparem toda a largura
          children: [
            SizedBox(height: 130),
            Text("Usuario", style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
            SizedBox(height: 10), 
            TextField(
              decoration: InputDecoration(
                hintText: 'Digite seu usuário...',
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue), // Muda cor ao focar
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: 50), // Adiciona espaçamento entre os campos
            Text("Senha", style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
            SizedBox(height: 10), 
            TextField(
              obscureText: true, // Oculta a senha
              decoration: InputDecoration(
                hintText: 'Digite sua senha...',
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        "MONITORAMENTO \nCOMPRESSOR",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.red,
      toolbarHeight: 80,
      elevation: 0.0,
      centerTitle: true,
    );
  }
}

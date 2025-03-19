import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key}); // Add key parameter

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // variaveis para armazenar usuario e senha usando textEditingController para controlar o texto quando escrito
  final userName = TextEditingController();
  final userPassword = TextEditingController();

  // Boleana para mostrar ou nao a senha
  bool visivel = true;

  //Boleana para exibiar a mensagem de usuario ou senha invalido
  bool isLoginTrue = false;

  // chave global para o form
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 140),
          Image.asset("assets/images/senai.png", width: 300),
          SizedBox(height: 15),
          Text(
            "Monitoramento Compressor",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 50),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                // Criei um form para colocar os inputs para controlalos e nao permitir que fiquem vazios
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      // Input do usuario
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          controller: (userName),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Preencha o campo de usuário";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            icon: Icon(Icons.person),
                            hintText: "Usuario",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),

                      // Input da senha
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          controller: (userPassword),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Preencha o campo de senha";
                            }
                            return null;
                          },
                          obscureText: visivel,
                          decoration: InputDecoration(
                            icon: Icon(Icons.lock),
                            hintText: "Senha",
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              onPressed: () {
                                // Cria funcao para mostrar/esconder a senha
                                setState(() {
                                  visivel = !visivel;
                                });
                              },
                              icon: Icon(
                                (visivel
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 30),
                      // Botao de login
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width * .9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.redAccent,
                        ),
                        child: TextButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              //Funcao de login
                            }
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),

                      SizedBox(height: 10),
                      // Sing up
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Não tem cadastro?"),
                          TextButton(
                            onPressed: () {
                              // funcao para se cadastrar
                            },
                            child: Text(
                              "SIGN UP",
                              style: TextStyle(color: Colors.redAccent),
                            ),
                          ),
                        ],
                      ),

                      /*
                        Mensagem de erro caso a senha ou o usuario estarem invalidos
                        por padrao a mensagem esta oculta, so é exibida apos a validacao
                        */
                      isLoginTrue
                          ? const Text(
                              "Usuário ou senha inválido",
                              style: TextStyle(color: Colors.redAccent),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

part of '_views_lib.dart';

class Login extends StatefulWidget {
  const Login({super.key}); // Add key parameter

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // variaveis para armazenar usuario e senha usando textEditingController para controlar o texto quando escrito
  final userEmail = TextEditingController();
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
    resizeToAvoidBottomInset: true,
    body: GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 140),
                Image.asset("assets/images/senai.png", width: 300),
                SizedBox(height: 10),
                Text(
                  "Monitoramento Compressor",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        // Input Email
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey.shade300),
                            color: Colors.white,
                          ),
                          child: TextFormField(
                            controller: userEmail,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Preencha o campo de email";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              icon: Icon(Icons.person),
                              hintText: "Email",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),

                        // Input Senha
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey.shade300),
                            color: Colors.white,
                          ),
                          child: TextFormField(
                            controller: userPassword,
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
                                  setState(() {
                                    visivel = !visivel;
                                  });
                                },
                                icon: Icon(
                                  visivel ? Icons.visibility : Icons.visibility_off,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        // Botão de login
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width * .9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.redAccent,
                          ),
                          child: TextButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                await AuthService().signin(
                                  email: userEmail.text,
                                  password: userPassword.text,
                                  context: context,
                                );
                              }
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Não tem cadastro?"),
                            TextButton(
                              onPressed: () {
                                // navegar para cadastro
                              },
                              child: Text(
                                "SIGN UP",
                                style: TextStyle(color: Colors.redAccent),
                              ),
                            ),
                          ],
                        ),
                              ElevatedButton.icon(onPressed: () async{
                                  await AuthService().signinWithProvider(context: context);
                              },
                              icon: const Icon(FontAwesomeIcons.microsoft),
                              label: const Text("Entrar com Microsoft", style: TextStyle(color: Colors.black)),
                              ),
                              ElevatedButton.icon(onPressed: () async{
                                await AuthService().loginWithGoogle(context: context);
                              },
                                icon: const Icon(FontAwesomeIcons.google),
                                label: const Text("Entrar com Google", style: TextStyle(color: Colors.black)),
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
}

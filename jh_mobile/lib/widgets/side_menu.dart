part of '_widgets_lib.dart';

final User? user = AuthService().currentUser;

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 255, 66, 66),
                    Color.fromARGB(255, 255, 0, 0),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StreamBuilder<User?>(
                            stream: FirebaseAuth.instance.authStateChanges(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return const Text(
                                  "Carregando...",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              } else if (snapshot.hasData && snapshot.data != null) {
                                final user = snapshot.data!;
                                String limparEmail(String? email) {
                                  if (email == null) return "";
                                  if (email.contains("#ext#@")) {
                                    return email.split("#ext#@").first.replaceAll("_", "@");
                                  }
                                  return email;
                                }
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Logado como:",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    Text(
                                        limparEmail(user.email),
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                    SizedBox(
                                      height: 40,
                                    ),
                                    Text(
                                      "Último login registrado:",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      user.metadata.lastSignInTime != null
                                      ? DateFormat('dd/MM/yyyy  HH:mm').format(user.metadata.lastSignInTime!.toLocal()): "Desconhecido",
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                );
                              } else {
                                return const Text(
                                  "Nenhum usuário logado",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              }
                            },
                          ),
                          SizedBox(height: 20,),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: const Icon(Icons.home_outlined),
                  title: const Text("Início"),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) {
                        return const HomeView();
                      }),
                    );
                  },
                  trailing: Icon(
                    Icons.chevron_right,
                    color: Colors.grey.shade300,
                  ),
                  style: ListTileStyle.list,
                  shape: Border(
                    bottom: BorderSide(
                      color: Colors.grey.shade300,
                      width: 1,
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.settings_outlined),
                  title: const Text("Configurações"),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) {
                        return ConfigPage();
                      }),
                    );
                  },
                  trailing: Icon(
                    Icons.chevron_right,
                    color: Colors.grey.shade300,
                  ),
                  style: ListTileStyle.list,
                  shape: Border(
                    bottom: BorderSide(
                      color: Colors.grey.shade300,
                      width: 1,
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.info_outline),
                  title: const Text("Sobre"),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) {
                        return About();
                      }),
                    );
                  },
                  trailing: Icon(
                    Icons.chevron_right,
                    color: Colors.grey.shade300,
                  ),
                  style: ListTileStyle.list,
                  shape: Border(
                    bottom: BorderSide(
                      color: Colors.grey.shade300,
                      width: 1,
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.logout,
                    color: Colors.red,
                  ),
                  title: const Text(
                    "Sair",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                  onTap: () async {
                    Navigator.of(context).pop();

                    await AuthService().signout(context: context);

                    if(context.mounted){
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => const Login()
                          )
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
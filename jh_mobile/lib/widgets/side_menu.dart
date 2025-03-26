part of '_widgets_lib.dart';

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
                          Text(
                            "Logado como:",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "",
                                //ViewModelBase.appUser?.login ?? "?",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "Último login registrado:",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          /*Text(
                            ViewModelBase.appUser?.lastAuth != null
                                ? AppCommons.dateToFormattedString(
                                    dt: ViewModelBase.appUser!.lastAuth!)
                                : "?",
                            style: TextStyle(
                              fontSize: AppConstants.szFonteMuitoPeq,
                              color: Colors.white,
                            ),
                          ),*/
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          if (Scaffold.of(context).hasDrawer) {
                            Scaffold.of(context).closeDrawer();
                          }
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 40,
                        ),
                        padding: EdgeInsets.zero,
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
                        return Container();
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
                        return Container();
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
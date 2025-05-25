part of '_views_lib.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Content(
          title: "SENAI",
          body: ListView(
            children: [
            ListTile(
            leading: const Icon(Icons.settings_ethernet),
            title: const Text("Configurar IP e Porta", style: TextStyle(fontSize: 25,),),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ConfigIP(),
                  ));
            },
          ),
        ],
      ),
    ));
  }
}


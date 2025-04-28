part of '_views_lib.dart';

class EmergencyHistory extends StatefulWidget {
  const EmergencyHistory({super.key});

  @override
  State<EmergencyHistory> createState() => _EmergencyHistoryState();
}

class _EmergencyHistoryState extends State<EmergencyHistory> {

  Future<bool> _onWillPop() async {
    // Navegar para a HomeView substituindo a tela atual
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeView()),
    );
    // Impedir a navegação para a tela anterior
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
        child: Scaffold(
            body: Content(
                title: "SENAI",
                body: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 20,
                  ),
                  child: Center(
                      child: Text("Pagina de Historico De Emergencia")),
                )
            )
        ),
    );
  }
}

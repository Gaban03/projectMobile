part of '_views_lib.dart';

class Temperature extends StatefulWidget {
  const Temperature({super.key});

  @override
  State<Temperature> createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {

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
                  child: Text("Teste"),
            )
        )
      ),
    ));
  }
}

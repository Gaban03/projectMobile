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
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Center(
              child: FutureBuilder<Map<String, dynamic>>(
                future: fetchDados(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Erro: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    final data = snapshot.data!;
                    return Text(
                      'Temperatura: ${data['temperatura']}°C\n'
                          'DataHora: ${data['dataHora']}',
                      textAlign: TextAlign.center,
                    );
                  } else {
                    return const Text('Nenhum dado disponível');
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
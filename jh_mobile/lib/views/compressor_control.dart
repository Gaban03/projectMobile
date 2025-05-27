part of '_views_lib.dart';

class CompressorControl extends StatefulWidget {
  const CompressorControl({super.key});

  @override
  State<CompressorControl> createState() => _CompressorControlState();
}

class _CompressorControlState extends State<CompressorControl> {
  bool isTapped = false;
  bool ligado = false;

  @override
  void initState() {
    super.initState();
    carregarEstado();
  }

  Future<void> carregarEstado() async {
    try {
      bool estado = await recebeEstado();
      setState(() {
        ligado = estado;
      });
    } catch (e) {
      print('Erro ao carregar estado: $e');
    }
  }

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
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .25,
                    ),
                    Icon(
                      ligado ? Icons.power : Icons.power_off,
                      color: ligado ? Colors.red : Colors.grey,
                      size: 100,
                    ),
                    Text(
                      ligado ? 'Compressor ligado' : 'Compressor desligado',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .05,
                    ),
                    Center(
                        child: Container(
                      width: MediaQuery.of(context).size.width * .5,
                      height: 60,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(2)),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ligado ? Colors.red : Colors.green,
                          elevation: 8,
                          shadowColor: Colors.black.withOpacity(0.9),
                        ),
                        onPressed: () async {
                          // adds a delay to prevent spamming
                          if (!isTapped) {
                            try {
                              isTapped = true;
                              final novoEstado = !ligado;
                              await enviarEstado(novoEstado);
                              setState(() {
                                ligado = novoEstado;
                              });
                              await Future.delayed(const Duration(milliseconds: 5000));
                              isTapped = false;
                            } catch (e) {
                              print('Erro ao enviar estado $e');
                            }
                          }
                        },
                        child: Text(ligado ? 'Desligar' : 'Ligar',
                            style:
                                TextStyle(color: Colors.white, fontSize: 30)),
                      ),
                    )),
                  ],
                ),
              ))),
    );
  }
}

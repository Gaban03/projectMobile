part of '_views_lib.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<StatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Content(
        title: "SENAI",
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                ),
                child: Text(
                  "Serviços Disponíveis",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 187, 187, 187),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              HomeMenuItem(
                title: "Histórico de emergência",
                subtitle: "Todas as emergências emitidas",
                icon: Icons.emergency,
                onPressed: () async {
                  if(context.mounted){
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => const EmergencyHistory()
                        )
                    );
                  }
                },
              ),
              HomeMenuItem(
                title: "Gráfico de temperatura",
                subtitle: "Dados de temperatura do compressor",
                icon: Icons.list,
                onPressed: () async {
                  if(context.mounted){
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => const Temperature()
                        )
                    );
                  }
                },
              ),
              HomeMenuItem(
                title: "Controle do compressor",
                subtitle: "Liga e desliga o compressor",
                icon: Icons.control_point_rounded,
                onPressed: () async {
                  if(context.mounted){
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => const CompressorControl()
                        )
                    );
                  }
                },
              ),    
            ],
          ),
        ),
      ),
    );
  }
}

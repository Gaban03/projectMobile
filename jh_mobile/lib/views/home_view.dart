part of '_views_lib.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<StatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 232, 232),
      appBar: AppBar(
        backgroundColor: Colors.red,
        toolbarHeight: 80,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(
                Icons.menu_rounded,
                color: Colors.white,
                size: 40,
              ),
              onPressed: () {
                
              },
            ),
            const Text(
              'SENAI',
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
                size: 28,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
          "Serviços Disponíveis",
                style: TextStyle(
                  color: Color.fromARGB(255, 143, 153, 163),
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            HomeMenuItem(
               title: "Lista de Falhas",
                subtitle: "Falhas do compressor",
                icon: Icons.list,
                onPressed: () async {
                  
                },
            ),
             HomeMenuItem(
               title: "Alerta de Manutenção",
                subtitle: "Manutenção do compressor",
                icon: Icons.build,
                onPressed: () async {
                  
                },
            ),
          ],
        ),
      ),
    );
  }
}

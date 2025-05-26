part of '_views_lib.dart';

class MonitoramentoCompressorPage extends StatefulWidget {
  const MonitoramentoCompressorPage({super.key});

  @override
  State<MonitoramentoCompressorPage> createState() =>
      _MonitoramentoCompressorPageState();
}

class _MonitoramentoCompressorPageState
    extends State<MonitoramentoCompressorPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Temperature(),
    const Humidity(),
    const Pressure(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<bool> _onWillPop() async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeView()),
    );
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        extendBody: true,
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          child: _pages[_selectedIndex],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 0, 0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12.withOpacity(0.08),
                blurRadius: 10,
                offset: const Offset(0, -1),
              ),
            ],
          ),
          child: SalomonBottomBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            selectedItemColor: const Color.fromARGB(255, 255, 255, 255),
            unselectedItemColor: const Color.fromARGB(255, 255, 255, 255),
            items: [
              SalomonBottomBarItem(
                icon: const Icon(Icons.thermostat_outlined),
                title: const Text("Temperatura"),
                selectedColor: const Color.fromARGB(255, 255, 255, 255),
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.water_drop_outlined),
                title: const Text("Umidade"),
                selectedColor: const Color.fromARGB(255, 255, 255, 255),
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.speed_outlined),
                title: const Text("Pressão"),
                selectedColor: const Color.fromARGB(255, 255, 255, 255),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

part of '_views_lib.dart';

class ConfigIP extends StatefulWidget {
  const ConfigIP({super.key});

  @override
  State<ConfigIP> createState() => _ConfigIPState();
}

class _ConfigIPState extends State<ConfigIP> {

  final ipController = TextEditingController();
  final portController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _carregarDados();
  }

  Future<void> _carregarDados() async {
    final prefs = await SharedPreferences.getInstance();
    ipController.text = prefs.getString('ip') ?? '';
    portController.text = prefs.getString('port') ?? '';
  }

  Future<void> _salvarDados() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('ip', ipController.text.trim());
    await prefs.setString('port', portController.text.trim());

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Configurações salvas!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Content(
          title: "SENAI",
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 20
            ),child: Column(
            children: [

              SizedBox(height: MediaQuery.of(context).size.height * .22,),

              Text("Configurações de IP", style: TextStyle(fontSize: 23),),

              SizedBox(height: MediaQuery.of(context).size.height * .02,),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade600),
                    color: Colors.white,
                    ),
                child: TextField(
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  controller: ipController,
                  decoration: InputDecoration(
                    labelText: 'Endereço IP',
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * .04,),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade600),
                  color: Colors.white,
                ),
                child: TextField(
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  controller: portController,
                  decoration: InputDecoration(
                    labelText: 'Porta',
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * .02,),
              
              Container(
                    width: MediaQuery.of(context).size.width * .35,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                      ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    elevation: 8,
                    shadowColor: Colors.black.withOpacity(0.9),
                  ),
                  onPressed: _salvarDados,
                  child: Text(
                      'Salvar',
                      style: TextStyle(color: Colors.white, fontSize: 23)),
                ),
              )
            ],
          ),
          )),
    );
  }
}

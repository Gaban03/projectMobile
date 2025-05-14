part of '_views_lib.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {

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
      child: Content(
        title: "SENAI",
        body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 12,
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sobre o Projeto',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Este projeto tem como objetivo o monitoramento de compressores em tempo real, '
                    'utilizando sensores e dispositivos de medição para garantir o bom funcionamento e a manutenção preventiva dos compressores. '
                    'Ele visa otimizar o desempenho e reduzir custos operacionais ao proporcionar uma análise precisa e contínua do funcionamento dos compressores.',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 40),
              const Text(
                'Desenvolvedores',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              _buildResponsavelCard('Murilo Camargo', 'Desenvolvedor Mobile', 'muriloherrick@gmail.com', 'Celular: (16) 99754-4500'),
              _buildResponsavelCard('Nicolas Ribeiro', 'Desenvolvedor de embarcados e infraestrutura', 'oloconicao@gmail.com', 'Celular: (16) 98888-8888'),
              _buildResponsavelCard('Pedro Martins', 'Desenvolvedor backend', 'pedrohenriquelopesmartins@gmail.com', 'Celular: (16) 97777-7777'),
              _buildResponsavelCard('Vinicius Ramos', 'Desenvolvedor de embarcados', 'viniciusaugusto@gmail.com', 'Celular: (16) 96666-6666'),
              _buildResponsavelCard('Vinicius Gaban', 'Desenvolvedor Mobile', 'viniciusgaban@gmail.com', 'Celular: (16) 95555-5555'),
            ],
          ),
        ),
      ),
      )
    );
  }

  Widget _buildResponsavelCard(String nome, String cargo, String email, String telefone) {
    return Container(
      width: 700,
      child: Card(
        margin: const EdgeInsets.only(bottom: 16),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nome,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                cargo,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                email,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                telefone,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
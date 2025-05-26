part of '_views_lib.dart';

class ConfigView extends StatefulWidget {
  const ConfigView({Key? key}) : super(key: key);

  @override
  State<ConfigView> createState() => _ConfigViewState();
}

class _ConfigViewState extends State<ConfigView> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  final ConfigViewModel _viewModel = ConfigViewModel();

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadCurrentConfig();
  }

  Future<void> _loadCurrentConfig() async {
    final config = await _viewModel.getCurrentConfiguration();
    if (config != null) {
      _controller.text = config.dataSource;
      setState(() {});
    }
  }

  Future<void> _onSave() async {
    if (!_formKey.currentState!.validate()) return;

    final dataSource = _controller.text.trim();
    setState(() => _isLoading = true);

    try {
      await _viewModel.updateConfiguration(dataSource: dataSource);
      _showSuccess("Configuração salva com sucesso!");

      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const HomeView()),
        );
      }
    } catch (e) {
      _showError("Erro ao salvar configuração: $e");
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _showError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg), backgroundColor: Colors.red),
    );
  }

  void _showSuccess(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg), backgroundColor: Colors.green),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Content(
        title: "SENAI",
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const SizedBox(height: 20),
                Text(
                  "Informe o IP e a porta do seu servidor Node-RED:",
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _controller,
                  keyboardType: TextInputType.url,
                  decoration: InputDecoration(
                    labelText: "Endereço do servidor",
                    hintText: "http://192.168.0.28:1880",
                    prefixIcon: const Icon(Icons.link),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Campo obrigatório";
                    }
                    if (!_viewModel.validate(value.trim())) {
                      return "Endereço inválido";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 48,
                  child: ElevatedButton.icon(
                    onPressed: _isLoading ? null : _onSave,
                    icon: _isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                                strokeWidth: 2, color: Colors.white),
                          )
                        : const Icon(Icons.save),
                    label: const Text("Salvar Configuração"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

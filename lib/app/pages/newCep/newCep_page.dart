import 'package:cep_helper/app/services/cep_request.dart';
import 'package:cep_helper/app/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class NewCepPage extends StatefulWidget {
  const NewCepPage({Key? key}) : super(key: key);

  @override
  _NewCepPageState createState() => _NewCepPageState();
}

class _NewCepPageState extends State<NewCepPage> {
  FirestoreService firestore = FirestoreService.getInstance();

  late String cep;
  late String _cep;
  String logradouro = "";
  String bairro = "";
  String cidade = "";
  String estado = "";
  late DateTime data;
  late Map dados;
  bool validate = false;

  var cepInputController = MaskTextInputFormatter(mask: "#####-###");
  final cepController = TextEditingController();
  final logradouroController = TextEditingController();
  final bairroController = TextEditingController();
  final cidadeController = TextEditingController();
  final estadoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text("Novo CEP"),
                TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [cepInputController],
                  autovalidateMode: AutovalidateMode.always,
                  controller: cepController,
                  validator: (value) {
                    if (validate) {
                      return null;
                    } else {
                      return "erro";
                    }
                  },
                  onChanged: (value) async {
                    _cep = cepController.text.replaceAll("-", "");
                    try {
                      dados = await CepData().getCepData(_cep);
                      setState(() {
                        validate = true;
                      });
                      logradouro = dados['logradouro'];
                      bairro = dados['bairro'];
                      cidade = dados['localidade'];
                      estado = dados['uf'];
                    } catch (e) {
                      setState(() {
                        validate = false;
                      });
                    }
                    logradouroController.text = logradouro;
                    bairroController.text = bairro;
                    cidadeController.text = cidade;
                    estadoController.text = estado;
                    print(logradouro);
                  },
                ),
                TextFormField(
                  controller: logradouroController,
                  readOnly: true,
                  enabled: false,
                ),
                TextFormField(
                  controller: bairroController,
                  readOnly: true,
                  enabled: false,
                ),
                TextFormField(
                  controller: cidadeController,
                  readOnly: true,
                  enabled: false,
                ),
                TextFormField(
                  controller: estadoController,
                  readOnly: true,
                  enabled: false,
                ),
                Container(),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            Map<String, dynamic> infos = {
              "cep": dados['cep'],
              "logradouro": logradouro,
              "bairro": bairro,
              "cidade": cidade,
              "estado": estado,
              "data": DateTime.now().toString()
            };
            await firestore.adicionarCep(infos);
            print(dados);
          },
          label: Text("Adicionar"),
        ),
      ),
    );
  }
}

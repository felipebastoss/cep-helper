import 'package:cep_helper/app/constants.dart';
import 'package:cep_helper/app/services/cep_request.dart';
import 'package:cep_helper/app/services/firestore_service.dart';
import 'package:cep_helper/app/services/lat_long_request.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class NewCepPage extends StatefulWidget {
  const NewCepPage({Key? key}) : super(key: key);

  @override
  _NewCepPageState createState() => _NewCepPageState();
}

class _NewCepPageState extends State<NewCepPage> {
  FirestoreService firestore = FirestoreService.getInstance();

  String cep = "";
  late String _cep;
  late final latLong;
  String logradouro = "";
  String bairro = "";
  String cidade = "";
  String estado = "";
  late Timestamp data;
  late Map dados;
  bool validate = false;

  var cepInputController = MaskTextInputFormatter(mask: "#####-###");
  final cepController = TextEditingController();
  final logradouroController = TextEditingController();
  final bairroController = TextEditingController();
  final cidadeController = TextEditingController();
  final estadoController = TextEditingController();

  late GoogleMapController mapController;

  LatLng _center = LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  "Novo CEP",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [cepInputController],
                  autovalidateMode: AutovalidateMode.always,
                  decoration: kTextFieldDecoration.copyWith(hintText: 'CEP'),
                  controller: cepController,
                  validator: (value) {
                    if (validate) {
                      return null;
                    } else {
                      if (value != null && value.length > 8) {
                        return "CEP inválido";
                      }
                    }
                  },
                  onChanged: (value) async {
                    _cep = cepController.text.replaceAll("-", "");
                    try {
                      dados = await CepData().getCepData(_cep);
                      cep = dados['cep'];
                      logradouro = dados['logradouro'];
                      bairro = dados['bairro'];
                      cidade = dados['localidade'];
                      estado = dados['uf'];
                      latLong = await LatLongData().getLatLongData(cep);
                      _center = LatLng(latLong['lat'], latLong['lng']);
                      mapController.moveCamera(CameraUpdate.newLatLng(_center));
                      setState(() {
                        validate = true;
                      });
                      print(latLong);
                      print(_center);
                    } catch (e) {
                      setState(() {
                        validate = false;
                      });
                    }
                    logradouroController.text = logradouro;
                    bairroController.text = bairro;
                    cidadeController.text = cidade;
                    estadoController.text = estado;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: logradouroController,
                  readOnly: true,
                  enabled: false,
                  decoration:
                      kTextFieldDecoration.copyWith(hintText: 'Logradouro'),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: bairroController,
                  readOnly: true,
                  enabled: false,
                  decoration: kTextFieldDecoration.copyWith(hintText: 'Bairro'),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: cidadeController,
                  readOnly: true,
                  enabled: false,
                  decoration: kTextFieldDecoration.copyWith(hintText: 'Cidade'),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: estadoController,
                  readOnly: true,
                  enabled: false,
                  decoration: kTextFieldDecoration.copyWith(hintText: 'Estado'),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: GoogleMap(
                      zoomControlsEnabled: false,
                      onMapCreated: _onMapCreated,
                      initialCameraPosition: CameraPosition(
                        target: _center,
                        zoom: 16.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Color(0xFF00ae8b),
          onPressed: () async {
            Map<String, dynamic> infos = {
              "cep": dados['cep'],
              "logradouro": logradouro,
              "bairro": bairro,
              "cidade": cidade,
              "estado": estado,
              "latitude": _center.latitude,
              "longitude": _center.longitude,
              "data": Timestamp.now()
            };
            await firestore.adicionarCep(infos);
            Navigator.pop(context);
          },
          label: Text("Adicionar"),
        ),
      ),
    );
  }
}

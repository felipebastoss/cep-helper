import 'package:cloud_firestore/cloud_firestore.dart';

class CardItem {
  late String cep;
  late String bairro;
  late Timestamp data;
  late String cidade;
  late String logradouro;
  late String estado;

  CardItem({
    required this.cep,
    required this.bairro,
    required this.data,
    required this.cidade,
    required this.estado,
    required this.logradouro,
  });

  CardItem.fromMap(dynamic map) {
    cep = map["cep"];
    bairro = map["bairro"];
    data = map["data"];
    cidade = map['cidade'];
    logradouro = map['logradouro'];
    estado = map['estado'];
  }

  toJson() {
    return {
      'cep': cep,
      'bairro': bairro,
      'data': data,
      'cidade': cidade,
      'logradouro': logradouro,
      'estado': estado,
    };
  }
}

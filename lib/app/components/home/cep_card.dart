import 'package:cep_helper/app/pages/cepPage/cep_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CepCard extends StatelessWidget {
  CepCard({
    Key? key,
    required this.cep,
    required this.bairro,
    required this.data,
    required this.cidade,
    required this.estado,
    required this.logradouro,
  }) : super(key: key);

  final String cep;
  final String bairro;
  final Timestamp data;
  final String cidade;
  final String logradouro;
  final String estado;

  factory CepCard.fromJson(Map<String, dynamic> json) {
    return CepCard(
      cep: json['cep'],
      bairro: json['bairro'],
      data: json['data'],
      cidade: json['cidade'],
      logradouro: json['logradouro'],
      estado: json['estado'],
    );
  }

  @override
  Widget build(BuildContext context) {
    String dia = data.toDate().day.toString();
    String mes = data.toDate().month.toString();
    String ano = data.toDate().year.toString();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      child: GestureDetector(
        child: Card(
          child: ListTile(
            title: Hero(
              child: Text(cep),
              tag: 'hero',
            ),
            subtitle: bairro.isEmpty ? Text(cidade) : Text(bairro),
            trailing: Text('$dia/$mes/$ano'),
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => CepPage(
                      cep: cep,
                      bairro: bairro,
                      cidade: cidade,
                      logradouro: logradouro,
                      estado: estado,
                    )),
          );
        },
      ),
    );
  }
}

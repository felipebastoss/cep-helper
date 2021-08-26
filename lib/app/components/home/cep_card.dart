import 'package:flutter/material.dart';

class CepCard extends StatelessWidget {
  CepCard({
    Key? key,
    required this.cep,
    required this.bairro,
    required this.data,
  }) : super(key: key);

  final String cep;
  final String bairro;
  final DateTime data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text(cep),
          subtitle: Text(bairro),
          trailing: Text(data.weekday.toString()),
        ),
      ),
      onTap: () {},
    );
  }
}

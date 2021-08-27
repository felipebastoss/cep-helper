import 'package:cep_helper/app/constants.dart';
import 'package:flutter/material.dart';

class CepPage extends StatefulWidget {
  const CepPage({
    Key? key,
    required this.cep,
    required this.bairro,
    required this.cidade,
    required this.estado,
    required this.logradouro,
  }) : super(key: key);

  final String cep;
  final String bairro;
  final String cidade;
  final String logradouro;
  final String estado;

  @override
  _CepPageState createState() => _CepPageState();
}

class _CepPageState extends State<CepPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(8),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'CEP:',
                        style: kTextStyle,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Hero(
                        tag: 'hero',
                        child: Text(
                          widget.cep,
                          style: kTextStyle1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Logradouro:',
                        style: kTextStyle,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        widget.logradouro,
                        style: kTextStyle1,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Bairro:',
                        style: kTextStyle,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        widget.bairro,
                        style: kTextStyle1,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Cidade:',
                        style: kTextStyle,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        widget.cidade,
                        style: kTextStyle1,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Estado:',
                        style: kTextStyle,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        widget.estado,
                        style: kTextStyle1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

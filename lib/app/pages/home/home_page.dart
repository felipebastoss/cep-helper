import 'package:cep_helper/app/components/home/cep_card.dart';
import 'package:cep_helper/app/pages/newCep/newCep_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Caderneta de CEP's"),
        ),
        body: ListView(
          children: [
            CepCard(
              cep: "40210-620",
              bairro: "Federação",
              data: DateTime(2021),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => NewCepPage()));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

import 'package:cep_helper/app/components/home/cep_card.dart';
import 'package:cep_helper/app/model/card.dart';
import 'package:cep_helper/app/pages/newCep/newCep_page.dart';
import 'package:cep_helper/app/services/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

Widget buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
  return ListView(
    children: snapshot.map((data) => buildListItem(context, data)).toList(),
  );
}

Widget buildListItem(BuildContext context, DocumentSnapshot data) {
  final card = CardItem.fromMap(data.data());
  var cardJson = card.toJson();
  return CepCard.fromJson(cardJson);
}

FirestoreService firestore = FirestoreService.getInstance();

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Caderneta de CEP's"),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: firestore.firestore.collection("ceps").snapshots(),
          builder: (BuildContext context, snapshot) {
            if (!snapshot.hasData) return Container();
            return buildList(context, snapshot.data!.docs);
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF00ae8b),
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

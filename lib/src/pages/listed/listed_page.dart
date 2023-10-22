import 'package:dio_viacep_flutter/src/pages/listed/listed_controller.dart';
import 'package:dio_viacep_flutter/src/repositories/local/local_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/listed_card.dart';

class ListedPage extends StatefulWidget {
  const ListedPage({super.key});

  @override
  State<ListedPage> createState() => _ListedPageState();
}

class _ListedPageState extends State<ListedPage> {
  late final ListedController listedController;

  @override
  void initState() {
    super.initState();
    listedController = ListedController(context.read<LocalRepository>())
      ..addListener(() {
        setState(() {});
      })
      ..getAllCep();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,     
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
          title: const Text('Cep\'s salvos', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: listedController.cepList.length,
            itemBuilder: (context, index) {
              return ListedCard(
                index: index,
                listedController: listedController,
              );
            },
          ),
        ),
      ),
    );
  }
}

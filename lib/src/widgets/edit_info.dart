import 'package:dio_viacep_flutter/src/pages/listed/listed_controller.dart';
import 'package:flutter/material.dart';

import 'input_text.dart';

class EditInfo extends StatelessWidget {
  const EditInfo({
    super.key,
    required this.index,
    required this.listedController,
  });

  final int index;
  final ListedController listedController;

  @override
  Widget build(BuildContext context) {
    final logradouro = TextEditingController();
    final complemento = TextEditingController();

    logradouro.text = listedController.cepList[index].logradouro;
    complemento.text = listedController.cepList[index].complemento;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Editar Cep'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Form(
                child: Column(
                  children: [
                    InputText(
                      controller: logradouro,
                      label: 'Logradouro',
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InputText(
                      controller: complemento,
                      label: 'Complemento',
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        listedController.updateCep(
                            listedController.cepList[index].cep
                                .replaceAll('-', ''),
                            listedController.cepList[index]
                                .copyWith(
                                    logradouro: logradouro.text,
                                    complemento: complemento.text)
                                .toMap());
                        Navigator.of(context).pop();
                      },
                      child: const Text('Editar'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places/providers/greate_places.dart';
import 'package:great_places/widgets/image_input.dart';
import 'package:provider/provider.dart';

class PlaceFormPage extends StatefulWidget {
  const PlaceFormPage({Key? key}) : super(key: key);

  @override
  State<PlaceFormPage> createState() => _PlaceFormPageState();
}

class _PlaceFormPageState extends State<PlaceFormPage> {
  final _titleController = TextEditingController();
  File? pickedImage;

  void _selectImage(File pickedImage) {
    //setar a imagem que pertence ao meu estado usando a imagem q acabei de receber
    pickedImage = pickedImage;
  }

  void _submitForm() {
    //aqui vamos verificar se o titulo esta definido e se a imagem esta selecionada
    if (_titleController.text.isEmpty || pickedImage == null) {
      return;
    }
    Provider.of<GreatePlaces>(context, listen: false)
        .addPlace(_titleController.text, pickedImage!);
    // o comportamento esperado é que se as informacoes estiverem preenchidas
    //com o nome e a imagem, o formulario sera submetido e a tela sera fechada
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Lugar'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            //expanded pra ajustar o botao na parte inferior da tela, ao inves do mainaxisalignment
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(children: [
                  TextField(
                    controller: _titleController,
                    decoration: const InputDecoration(labelText: 'Titulo'),
                    //criar controller pra gerenciar o textfield
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ImageInput(_selectImage)
                ]),
              ),
            ),
          ),
          //fica fora da primeira coluna para ficar sempre visivel quando fizer scroll da tela
          TextButton.icon(
              style: TextButton.styleFrom(
                backgroundColor: Colors.amber,
              ),
              onPressed: _submitForm,
              icon: const Icon(Icons.add),
              label: Text(
                'Adicionar',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ))
        ],
      ),
    );
  }
}

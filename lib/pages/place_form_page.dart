import 'package:flutter/material.dart';
import 'package:great_places/widgets/image_input.dart';

class PlaceFormPage extends StatefulWidget {
  const PlaceFormPage({super.key});

  @override
  State<PlaceFormPage> createState() => _PlaceFormPageState();
}

class _PlaceFormPageState extends State<PlaceFormPage> {
  final _titleController = TextEditingController();

  void _submitForm() {}
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
                  const ImageInput()
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

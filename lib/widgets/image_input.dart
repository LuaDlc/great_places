// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput(
    this.onSelectImage, {
    Key? key,
  }) : super(key: key);

  final Function? onSelectImage;

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;

  _takePicture() async {
    //async para poder usar o await ja que o imagePicker tem metodos async
    final ImagePicker picker = ImagePicker(); //instancia do imagepicker
    //com a instancia podemos chamar o metodo getImage pra pegar uma imagem
    XFile imageFile = await picker.pickImage(
        source: ImageSource.camera, maxWidth: 600) as XFile;

    //caso nao seja nulo chama o setState para alterar o estado do componente
    setState(() {
      _storedImage = File(
          imageFile.path); //armazena a imagem no estado do componente (file
    });

    // widget.onSelectImge(...);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          //responsavel por mostra o preview da imagem
          width: 180,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          //alinhamento do conteudo dentro do container
          alignment: Alignment.center,
          child: _storedImage != null
              ? Image.file(
                  _storedImage!,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
              : const Text('Nenhuma imagem'),
        ),
        const SizedBox(width: 10), //espaco entre o preview e o botao
        Expanded(
          child: TextButton.icon(
            onPressed:
                _takePicture, //chama o takePicture sempre q pedir pra tirar uma foto
            icon: const Icon(Icons.camera),
            label: Text(
              'Tirar foto',
              style: TextStyle(color: Colors.blue[500]),
            ),
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
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
          child: const Text('Nenhuma imagem'),
        ),
        const SizedBox(width: 10), //espaco entre o preview e o botao
        Expanded(
          child: TextButton.icon(
            onPressed: () {},
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

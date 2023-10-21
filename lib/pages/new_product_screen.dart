import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class NewProductPage extends StatefulWidget {
  static const String routeName = '/newproduct';
  const NewProductPage({super.key});

  @override
  State<NewProductPage> createState() => _NewProductPageState();
}

class _NewProductPageState extends State<NewProductPage> {
  String? localImagePath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('newProduct'),
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          _buildImageSection()
        ],
      ),
    );
  }
Widget  _buildImageSection(){
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            localImagePath == null ? const Icon(Icons.card_giftcard):
                Image.file(File(localImagePath!),width: 100,height: 100,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                    onPressed: (){
                      _getImage;
                    },
                  icon: const Icon(Icons.camera),
                  label:  const Text('capture'),
                ),
                TextButton.icon(
                    onPressed: (){},
                  icon: const Icon(Icons.browse_gallery),
                  label:  const Text('Gallery'),
                )
              ],
            )
          ],
        ),
      ),
    );
}

  void _getImage(ImageSource source)async {
    final file = await ImagePicker().pickImage(source: source);

  }
}


import 'package:flutter/material.dart';
class CategoryScreen extends StatelessWidget {
  static const String routeName = '/categoryscreen';
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category'),
      ),
    );
  }
}

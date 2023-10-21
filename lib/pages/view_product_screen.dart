import 'package:flutter/material.dart';
class ViewProductScreen extends StatelessWidget {
  static const String routeName = '/viewproduct';
  const ViewProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Product'),
      ),
    );
  }
}

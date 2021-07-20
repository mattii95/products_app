import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
      ),
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.purple,
        ),
      ),
    );
  }
}
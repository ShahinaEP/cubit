import 'package:flutter/material.dart';
class ApiCallingPage extends StatefulWidget {
  const ApiCallingPage({Key? key}) : super(key: key);

  @override
  State<ApiCallingPage> createState() => _ApiCallingPageState();
}

class _ApiCallingPageState extends State<ApiCallingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title:  const Text('Api Calling page'),
          centerTitle: true,
        ),
    );
  }
}

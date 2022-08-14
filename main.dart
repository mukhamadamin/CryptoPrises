// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';


void main() {
  runApp(const CP());
}

class CP extends StatelessWidget {
  const CP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: CryptoPrice());
  }
}

class CryptoPrice extends StatefulWidget {
  const CryptoPrice({Key? key}) : super(key: key);

  @override
  _CryptoPriceState createState() => _CryptoPriceState();
}

class _CryptoPriceState extends State<CryptoPrice> {
  final List<String> _CryptoPrice = <String>[];
  final TextEditingController _textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('CryptoPrices')),
        body: ListView(children: _getItems()),
        floatingActionButton: FloatingActionButton(
            onPressed: () => _displayDialog(context),
            tooltip: 'Edit Item',
            child: const Icon(Icons.edit)));
  }



  void _addTolist(String title) {
    setState(() {
      _CryptoPrice.add(title);
    });
    _textFieldController.clear();
    
  }
  

  Widget _CP(String title) {
    return ListTile(title: Text(title));
  }

  Future<Future> _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Edit to your list'),
            content: TextField(
              controller: _textFieldController,
              decoration:
                  const InputDecoration(hintText: 'Enter name of crypto here'),
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context).pop();
                  
                  _addTolist(_textFieldController.text);
                },
              ),
              IconButton(
                icon: const Icon(Icons.cancel),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  List<Widget> _getItems() {
    final List<Widget> CryptoWidgets = <Widget>[];
    for (String title in _CryptoPrice) {
      CryptoWidgets.add(_CP(title));
    }
    return CryptoWidgets;
  }
}

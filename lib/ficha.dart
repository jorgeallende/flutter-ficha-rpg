import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:primeiro_flutter/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FichaPage extends StatefulWidget {
  @override
  _FichaPage createState() => _FichaPage(index: 0);
}

class _FichaPage extends State<FichaPage> {
  final int index;
  String _inputText = '';

  _FichaPage({required this.index});

  Future<List<MyObject>> getObjects() async {
    final prefs = await SharedPreferences.getInstance();
    final objectsJson = prefs.getString('myObjects');
    if (objectsJson != null) {
      final decodedJson = jsonDecode(objectsJson);
      return (decodedJson as List)
          .map((json) => MyObject.fromJson(json))
          .toList();
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ficha'),
        backgroundColor: Colors.brown,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                final retrievedObjects = await getObjects();
                print('Retrieved Objects:');
                print(retrievedObjects[index].charName);
              },
              child: Text('Retrieve Objects'),
            ),
            TextField(
              onChanged: (newValue) {
                setState(() {
                  _inputText = newValue; // Update the state when input changes.
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
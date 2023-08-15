import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:primeiro_flutter/ficha.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyObject {
  final String charName;
  final String playerName;
  final String classe;
  final String antecedente;
  final String race;
  final String alinhamento;
  final int xPoints;
  final int bonusDeProeficiencia;

  final int forca;
  final int destreza;
  final int constituicao;
  final int inteligencia;
  final int sabedoria;
  final int carisma;

  final int sgForca;
  final int sgDestreza;
  final int sgConsituicao;
  final int sgInteligencia;
  final int sgSabedoria;
  final int sgCarisma;

  final int percepcao;
  final String equipamento;
  final int classeDeArmadura;
  final int iniciativa;
  final double deslocamento;

  final int pv;
  final int pvMax;
  final int pvTemporario;

  final int totalDadoVida;
  final int totalVida;

  MyObject(this.charName, this.playerName, this.classe, this.alinhamento, this.antecedente, this.bonusDeProeficiencia, this.carisma, this.classeDeArmadura, this.constituicao, this.deslocamento, this.destreza, this.equipamento, this.forca, this.iniciativa, this.inteligencia, this.percepcao, this.pv, this.pvMax, this.pvTemporario, this.race, this.sabedoria, this.sgCarisma, this.sgConsituicao, this.sgDestreza, this.sgForca, this.sgInteligencia, this.sgSabedoria, this.totalDadoVida, this.totalVida, this.xPoints);

  Map<String, dynamic> toJson() {
    return {
      'name': charName,
      'classe': classe,
      'alinhamento': alinhamento,
      'antededente': antecedente,
      'bonusDeProeficiencia': bonusDeProeficiencia,
      'carisma': carisma,
      'classeDeArmadura': classeDeArmadura,
      'constituicao': constituicao,
      'deslocamento': deslocamento,
      'destreza': destreza,
      'equipamento': equipamento,
      'forca': forca,
      'iniciativa': iniciativa,
      'inteligencia': inteligencia,
      'percepcao': percepcao,
      'pv': pv,
      'pvMax': pvMax,
      'pvTemporario': pvTemporario,
      'race': race,
      'sabedoria': sabedoria,
      'sgCarisma': sgCarisma,
      'sgConsituicao': sgConsituicao,
      'sgDestreza': sgDestreza,
      'sgForca': sgForca,
      'sgInteligencia': sgInteligencia,
      'sgSabedoria': sgSabedoria,
      'totalDadoVida': totalDadoVida,
      'totalVida': totalVida,
      'xPoints': xPoints
    };
  }

  factory MyObject.fromJson(Map<String, dynamic> json) {
    return MyObject(
        json['name'],
        json['playerName'],
        json['classe'],
        json['classe'],
        json['alinhamento'],
        json['antecedente'],
        json['bonusDeProeficiencia'],
        json['carisma'],
        json['classeDeArmadura'],
        json['constituicao'],
        json['deslocamento'],
        json['destreza'],
        json['equipamento'],
        json['forca'],
        json['iniciativa'],
        json['inteligencia'],
        json['percepcao'],
        json['pv'],
        json['pvTemporario'],
        json['race'],
        json['sabedoria'],
        json['sgCarisma'],
        json['sgConsituicao'],
        json['sgDestreza'],
        json['sgForca'],
        json['sgInteligencia'],
        json['sgSabedoria'],
        json['totalDadoVida'],
        json['totalVida'],
        json['xPoints']
    );
  }
}

class PlayerPage extends StatelessWidget {
  final List<MyObject> myObjects = [
    // Add more objects here
  ];

  Future<void> saveObjects() async {
    final prefs = await SharedPreferences.getInstance();
    final objectsJson = myObjects.map((obj) => obj.toJson()).toList();
    prefs.setString(
        'myObjects', jsonEncode(objectsJson)); // Serialize to JSON here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white10,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          children: [
            SizedBox(height: 50 , width: MediaQuery.of(context).size.width),
            Column(
              children: [
                Text(
                  "D&D",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: Offset(0, 3),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                ),
                Text(
                  "5ª geração",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: Offset(0, 3),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          SizedBox(height: 48),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nome do jogador: ",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.brown,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 4),
                TextFormField(
                  style: TextStyle(
                    color: Colors.white54
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown)
                    ),
                    focusColor: Colors.white70,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown)
                    ),
                    fillColor: Colors.white60,
                  ),
                    ),
                SizedBox(height: 40),
                Text(
                    "Fichas",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown
                  )
                ),
                ElevatedButton(
                  onPressed: saveObjects,
                  child: Text('Save Objects'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FichaPage()),
                    );
                  },
                  child: Text('Ficha 1'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FichaPage()),
                    );
                  },
                  child: Text('Ficha 2'),
                ),
                  ],
                ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PlayerPage(),
  ));
}


import 'package:flutter/material.dart';

import 'home_screen.dart';

void main(){
  runApp(Pokedex());
}

class Pokedex extends StatelessWidget {
  const Pokedex({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
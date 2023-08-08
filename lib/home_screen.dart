import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/pokemon_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var pokeApi =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  List pokedex = [];
  @override
  void initState() {
    super.initState();
    if (mounted) {
      fetchPokemonData();
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    // var height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          top: -50,
          right: -50,
          child: Image.asset(
            'images/pokeball.png',
            width: 200,
            fit: BoxFit.fitWidth,
            color: Colors.orangeAccent,
          ),
        ),
        Positioned(
          top: 80,
          left: 20,
          child: Text("Pokedex",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              )),
        ),
        Positioned(
          top: 150,
          bottom: 0,
          width: width,
          child: Column(
            children: [
              // ignore: unnecessary_null_comparison
              pokedex.length != null
                  ? Expanded(
                      child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.4,
                      ),
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: pokedex.length,
                      itemBuilder: (context, index) {
                        // var type = pokedex[index]['type'];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 5,
                          ),
                          child: InkWell(
                            child: SafeArea(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: pokedex[index]['type'][0] == "Grass"
                                      ? Colors.greenAccent
                                      : pokedex[index]['type'][0] == "Fire"
                                          ? Colors.redAccent
                                          : pokedex[index]['type'][0] == "Water"
                                              ? Colors.blue
                                              : pokedex[index]['type'][0] ==
                                                      "Poison"
                                                  ? Colors.deepPurpleAccent
                                                  : pokedex[index]['type'][0] ==
                                                          "Electric"
                                                      ? Colors.amber
                                                      : pokedex[index]['type']
                                                                  [0] ==
                                                              "Rock"
                                                          ? Colors.grey
                                                          : pokedex[index]['type']
                                                                      [0] ==
                                                                  "Ground"
                                                              ? Colors.brown
                                                              : pokedex[index]['type']
                                                                          [0] ==
                                                                      "Psychic"
                                                                  ? Colors
                                                                      .indigo
                                                                  : pokedex[index]['type']
                                                                              [
                                                                              0] ==
                                                                          "Fighting"
                                                                      ? Colors
                                                                          .orange
                                                                      : pokedex[index]['type'][0] ==
                                                                              "Bug"
                                                                          ? Colors
                                                                              .lightGreenAccent
                                                                          : pokedex[index]['type'][0] == "Ghost"
                                                                              ? Colors.deepPurple
                                                                              : pokedex[index]['type'][0] == "Normal"
                                                                                  ? Colors.grey
                                                                                  : Colors.pink,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25)),
                                ),
                                child: Stack(children: [
                                  Positioned(
                                      bottom: -10,
                                      right: -10,
                                      child: Image.asset(
                                        'images/pokeball.png',
                                        height: 100,
                                        fit: BoxFit.fitHeight,
                                      )),
                                  Positioned(
                                      top: 20,
                                      left: 10,
                                      child: Text(pokedex[index]['name'],
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.white,
                                          ))),
                                  Positioned(
                                      top: 45,
                                      left: 10,
                                      child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                            color: Colors.black26,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0,
                                                right: 8.0,
                                                top: 4.0,
                                                bottom: 4.0),
                                            child: Text(
                                              pokedex[index]['type'][0],
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ))),
                                  Positioned(
                                      bottom: 2,
                                      right: 2,
                                      child: Hero(
                                        tag: index,
                                        child: CachedNetworkImage(
                                          imageUrl: pokedex[index]['img'],
                                          height: 90,
                                          fit: BoxFit.fitHeight,
                                        ),
                                      )),
                                ]),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => PokemonDetailScreen(
                                            pokemonDetail: pokedex[index],
                                            color: pokedex[index]['type'][0] ==
                                                    "Grass"
                                                ? Colors.greenAccent
                                                : pokedex[index]['type'][0] ==
                                                        "Fire"
                                                    ? Colors.redAccent
                                                    : pokedex[index]['type']
                                                                [0] ==
                                                            "Water"
                                                        ? Colors.blue
                                                        : pokedex[index]['type']
                                                                    [0] ==
                                                                "Poison"
                                                            ? Colors
                                                                .deepPurpleAccent
                                                            : pokedex[index]['type']
                                                                        [0] ==
                                                                    "Electric"
                                                                ? Colors.amber
                                                                : pokedex[index]['type'][
                                                                            0] ==
                                                                        "Rock"
                                                                    ? Colors
                                                                        .grey
                                                                    : pokedex[index]['type'][0] ==
                                                                            "Ground"
                                                                        ? Colors
                                                                            .brown
                                                                        : pokedex[index]['type'][0] == "Psychic"
                                                                            ? Colors.indigo
                                                                            : pokedex[index]['type'][0] == "Fighting"
                                                                                ? Colors.orange
                                                                                : pokedex[index]['type'][0] == "Bug"
                                                                                    ? Colors.lightGreenAccent
                                                                                    : pokedex[index]['type'][0] == "Ghost"
                                                                                        ? Colors.deepPurple
                                                                                        : pokedex[index]['type'][0] == "Normal"
                                                                                            ? Colors.grey
                                                                                            : Colors.pink,
                                            heroTag: index,
                                          )));
                            },
                          ),
                        );
                      },
                    ))
                  : Center(
                      child: CircularProgressIndicator(),
                    )
            ],
          ),
        ),
      ],
    ));
  }

  void fetchPokemonData() {
    var url = Uri.https("raw.githubusercontent.com",
        "/Biuni/PokemonGO-Pokedex/master/pokedex.json");
    http.get(url).then((value) {
      if (value.statusCode == 200) {
        var decodedJsonData = jsonDecode(value.body);
        pokedex = decodedJsonData['pokemon'];
        // print(pokedex[0]['name']);
        setState(() {});
      }
    });
  }
}

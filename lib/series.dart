import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'Models/details.dart';

class SeriesPageNet extends StatefulWidget {
  const SeriesPageNet({Key? key}) : super(key: key);

  @override
  State<SeriesPageNet> createState() => _SeriesPageNetState();
}

class _SeriesPageNetState extends State<SeriesPageNet> {
  // Future<Details> readJson() async {
  //   http.Response response = await http.get(Uri.parse(
  //       'https://raw.githubusercontent.com/StreamCo/react-coding-challenge/master/feed/sample.json?'));
  //   Map<String, dynamic> data = await json.decode(response.body);
  //   Details entries = Details.fromJson(data);
  //   setState(() {
  //     _items = data['entries'];
  //   });
  //   return entries;
  // }
  Future<Details> readJson() async {
    http.Response response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/StreamCo/react-coding-challenge/master/feed/sample.json?'));
    Map<String, dynamic> data = await json.decode(response.body);
    return Details.fromJson(data);
  }

  void init() {
    readJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Series Net'),
      ),
      body: FutureBuilder(
          future: readJson(),
          builder: ((context, AsyncSnapshot<Details> snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: GridView.builder(
                  itemCount: _items.length,
                  itemBuilder: (BuildContext context, int index) {
                    var model = snapshot.entries.length;
                    model.programType = 'movie';
                    return Stack(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 125,
                              height: 150,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(_items[index]["images"]
                                      ["Poster Art"]["url"]),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              left: 5,
                              child: Container(
                                alignment: Alignment.center,
                                width: 90,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  _items[index]['programType'],
                                  style: const TextStyle(
                                      fontSize: 10,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: 0,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              '${_items[index]["title"]} - ${_items[index]["releaseYear"]}',
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,

                                  // color: const Color.fromARGB(255, 90, 15, 10),

                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 125,
                      mainAxisExtent: 170,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          })),
    );
  }
}

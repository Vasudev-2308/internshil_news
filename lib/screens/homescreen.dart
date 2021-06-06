import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kalpas_project/models/newsinfo.dart';
import 'package:kalpas_project/screens/favsscreen.dart';
import 'package:kalpas_project/services/apimanager.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;

  Future<void> newsLoader() async {
    setState(() {
      isLoading = true;
    });
    await Provider.of<NewsProvider>(context, listen: false).getNews();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    newsLoader();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var newsResults =
        Provider.of<NewsProvider>(context, listen: false).currentNews;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Column(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.grey[300],
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30)
                              ),
                              child: Card(
                                color: Colors.white,
                                elevation: 5,
                                child: Row(
                                  children: [
                                    IconButton(
                                      icon: newsResults[index].isFav!
                                          ? Icon(Icons.favorite)
                                          : Icon(Icons.favorite_border),
                                      iconSize: 35,
                                      color: newsResults[index].isFav!
                                          ? Colors.red
                                          : null,
                                      onPressed: () {
                                        setState(() {
                                          Provider.of<NewsProvider>(context,
                                                  listen: false)
                                              .handleFavourites(index);
                                        });
                                      },
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              newsResults[index].title!,
                                              maxLines: 2,
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              newsResults[index].summary!,
                                              maxLines: 2,
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.ellipsis,
                                              
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              newsResults[index].published!,
                                              maxLines: 2,
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.ellipsis,
                                              
                                                
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: newsResults.length,
                      ),
                    ),
                  ),
                ]  
                  
              ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:kalpas_project/models/newsinfo.dart';
import 'package:kalpas_project/screens/homescreen.dart';
import 'package:provider/provider.dart';

class FavsScreen extends StatefulWidget {
  const FavsScreen({Key? key}) : super(key: key);

  @override
  _FavsScreenState createState() => _FavsScreenState();
}

class _FavsScreenState extends State<FavsScreen> {
  
   @override
  Widget build(BuildContext context) {
    var favoriteList =
        Provider.of<NewsProvider>(context, listen: false).favoriteNews;
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
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Card(
                          color: Colors.white,
                          elevation: 5,
                          child: Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.favorite),
                                color: Colors.red,
                                iconSize: 35,
                                onPressed: () {
                                  setState(() {
                                    Provider.of<NewsProvider>(context,
                                            listen: false)
                                        .removeFromFav(favoriteList[index]);
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
                                        favoriteList[index].title!,
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
                                        favoriteList[index].summary!,
                                        maxLines: 2,
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        favoriteList[index].published!,
                                        maxLines: 2,
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300),
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
                  itemCount: favoriteList.length,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),      
          ],
        ),
      ),
    );
  }
}
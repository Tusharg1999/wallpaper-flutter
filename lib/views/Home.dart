import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_first/data/categories_data.dart';
import 'package:my_first/data/wallpaper_data.dart';
import 'package:my_first/model/categories_model.dart';
import 'package:my_first/model/wallpaper_model.dart';
import 'package:my_first/widgets/brandName.dart';
import 'package:my_first/widgets/category.dart';
import 'package:my_first/widgets/searchBar.dart';
import 'package:http/http.dart' as http;
import 'package:my_first/widgets/wallpapersGrid.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategorieModel> categories = new List();
  List<WallpaperModel> wallpapers = new List();

  @override
  void initState() {
    super.initState();
    categories = getCategoriesList();
    getTrendingWallpaper();
  }

  getTrendingWallpaper() async {
    var response = await http
        .get("https://api.pexels.com/v1/curated?per_page=10", headers: {
      "Authorization":
          '563492ad6f91700001000001c805d03cfd264a4a8d43339c21312e5e'
    });
    Map<String, dynamic> data = json.decode(response.body);
    wallpapers = getDataList(data);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
        centerTitle: true,
        title: brandName(),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).primaryColor,
          child: Column(
            children: <Widget>[
              SearchBar(),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 60,
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Category(
                      imgUrl: categories[index].imgUrl,
                      name: categories[index].categorieName,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(child: WallpaperList(context, wallpapers)),
            ],
          ),
        ),
      ),
    );
  }
}

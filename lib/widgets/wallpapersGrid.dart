import 'package:flutter/material.dart';
import 'package:my_first/model/wallpaper_model.dart';

class WallpaperList extends StatelessWidget {
  final BuildContext context;
  final List<WallpaperModel> wallpapers;
  WallpaperList(this.context, this.wallpapers);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: GridView.count(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        crossAxisCount: 2,
        childAspectRatio: .6,
        crossAxisSpacing: 6.0,
        mainAxisSpacing: 6.0,
        children: wallpapers.map((wallpaper) {
          return GridTile(
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  wallpaper.src.portrait,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

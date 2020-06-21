import '../model/wallpaper_model.dart';

List<WallpaperModel> getDataList(data) {
  List<WallpaperModel> dataList = new List();
  data["photos"].forEach((index) {
    WallpaperModel wallpaper = new WallpaperModel();
    SrcModel srcModel = new SrcModel();
    wallpaper.id = index["id"];
    wallpaper.photographer = index["photographer"];
    wallpaper.photographerUrl = index["photographer_url"];
    wallpaper.photographerId = index["photographer_id"];
    srcModel.original = index["src"]["original"];
    srcModel.portrait = index["src"]["portrait"];
    srcModel.small = index["src"]["small"];
    wallpaper.src = srcModel;
    dataList.add(wallpaper);
  });
  return dataList;
}

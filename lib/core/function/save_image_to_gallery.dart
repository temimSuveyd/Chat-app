import 'package:gallery_saver_plus/gallery_saver.dart';

Future<void> saveImageToGallery(String url) async {
  GallerySaver.saveImage(url, toDcim: true, albumName: "chati");
}

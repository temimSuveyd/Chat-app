
import 'package:gallery_saver_plus/gallery_saver.dart';


Future<void> saveVdieoToGallery(String url) async {
    GallerySaver.saveVideo(url, toDcim: true, albumName: "chati");
}

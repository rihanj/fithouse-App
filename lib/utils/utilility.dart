import 'dart:convert';
import 'dart:io';
import 'package:image/image.dart' as Img;
import 'package:localstorage/localstorage.dart';

import '../config/js_log.dart';

class Utility {
  static File compressImage(File image) {
    Img.Image? compressedImage;
    Img.Image? imageToCompress = Img.decodeImage(image.readAsBytesSync());

    if (imageToCompress != null) {
      // Perform image compression logic
      compressedImage = Img.copyResize(imageToCompress, width: 800);

      // Save the compressed image to a temporary file
      File compressedFile = File('${image.path}_compressed.jpg');
      compressedFile
          .writeAsBytesSync(Img.encodeJpg(compressedImage, quality: 75));
      JSLog.success(msg: "Success Compressed");
      return compressedFile;
    } else {
      JSLog.error(msg: "Failed to decode the selected image");
      return image;
    }
  }
  static Future<dynamic> getName()async{
    final LocalStorage storage =  LocalStorage('user-info');
    var data = await jsonDecode(storage.getItem('info'))!;
    print(data);
    return data["full_name"];
  }
}
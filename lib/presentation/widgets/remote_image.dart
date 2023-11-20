import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../themes/f_h_colors.dart';


class RemoteImage extends StatelessWidget {
  final String? imageUrl;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit? fit;
  final BorderRadius? borderRadius;
  const RemoteImage({
    Key? key,
    this.height,
    this.width,
    this.color,
    this.fit,
    this.imageUrl,
    this.borderRadius = BorderRadius.zero,
  }) : super(key: key);

  static Map? header;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius??BorderRadius.circular(0),
      child:  CachedNetworkImage(
          fit: fit ?? BoxFit.cover,
          // httpHeaders: {
          //   'Authorization': imageUrl!.contains("176.58")?"Bearer ${AppData.accessToken}":"Bearer ${AppData.kAccessToken}",
          // },
          height: height,
          // httpHeaders: NetworkHttp.getHeaders(),
          // maxHeightDiskCache: 100,
          filterQuality: FilterQuality.high,
          // maxWidthDiskCache: (Get.width * 0.4).toInt(),
          // memCacheHeight: 500,
          //memCacheWidth: (Get.width * 0.4).toInt(),
          cacheKey: imageUrl,
          width: width,
          color: color,
          useOldImageOnUrlChange: false,
          imageUrl: imageUrl!,
          progressIndicatorBuilder: (context, url, downloadProgress) => const Center(
              child: CircularProgressIndicator(color: FHColor.appColor,)
          ),
          errorWidget: (context, url, error) {
            return CircleAvatar(
              radius: 26,
              backgroundColor: Colors.grey.shade200,
              child:

              Text("No image")
            );
          }),
    );
  }
}
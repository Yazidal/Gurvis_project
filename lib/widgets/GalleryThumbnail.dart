import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/GalleryItemModel.dart';
import 'package:cached_network_image/cached_network_image.dart';

class GalleryItemThumbnail extends StatelessWidget {
  final GalleryItemModel? galleryItemModel;
  final GestureTapCallback? onTap;

  const GalleryItemThumbnail({Key? key, this.galleryItemModel, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('image de la galerie : ${galleryItemModel!.resource}');
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: GestureDetector(
        onTap: onTap,
        child: Hero(
          tag: galleryItemModel!.id!,
          child: CachedNetworkImage(
            imageUrl: galleryItemModel!.resource!,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),

          // Image.network(

          //   galleryItemModel!.resource!,
          //   height: 300.0,
          //   width: 800.0,
          //   fit: BoxFit.fill,
          // )

          // (galleryItemModel!.assetType == "url")
          //     ? Image.network(
          //         galleryItemModel!.resource!,
          //         height: 300.0,
          //         width: 800.0,
          //         fit: BoxFit.fill,
          //       )
          //     : Image.asset(
          //         galleryItemModel!.resource!,
          //         height: 300.0,
          //         width: 800.0,
          //         fit: BoxFit.fill,
          //       )
        ),
      ),
    );
  }
}

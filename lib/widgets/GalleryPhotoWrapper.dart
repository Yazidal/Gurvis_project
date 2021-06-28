import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/GalleryItemModel.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class GalleryPhotoWrapper extends StatefulWidget {
  final LoadingBuilder? loadingBuilder;
  final Decoration? backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;
  final int initalIndex;
  final PageController pageController;
  final List<GalleryItemModel>? galleries;
  final Axis? scrollDirection;

  GalleryPhotoWrapper(
      {Key? key,
      this.loadingBuilder,
      this.backgroundDecoration,
      this.minScale,
      this.maxScale,
      required this.initalIndex,
      this.galleries,
      this.scrollDirection})
      : pageController = PageController(initialPage: initalIndex);

  @override
  State<StatefulWidget> createState() {
    return _GalleryPhotoWrapper();
  }
}

class _GalleryPhotoWrapper extends State<GalleryPhotoWrapper> {
  late int currentIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = widget.initalIndex;
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: PhotoViewGallery.builder(
      scrollPhysics: const BouncingScrollPhysics(),
      builder: (BuildContext context, int index) {
        return PhotoViewGalleryPageOptions(
          imageProvider:
              NetworkImage(widget.galleries![index].resource.toString()),
          initialScale: PhotoViewComputedScale.contained * 0.8,
          heroAttributes: PhotoViewHeroAttributes(
              tag: int.parse(widget.galleries![index].id.toString())),
        );
      },
      itemCount: widget.galleries!.length,
      loadingBuilder: (context, event) => Center(
        child: Container(
          width: 20.0,
          height: 20.0,
          child: CircularProgressIndicator(
            value: event == null
                ? 0
                : event.cumulativeBytesLoaded /
                    num.parse(event.expectedTotalBytes.toString()),
          ),
        ),
      ),
      backgroundDecoration: widget.backgroundDecoration as BoxDecoration,
      pageController: widget.pageController,
      onPageChanged: onPageChanged,
    ));

    // return Scaffold(
    //   body: Container(
    //       decoration: widget.backgroundDecoration,
    //       constraints:
    //           BoxConstraints.expand(height: MediaQuery.of(context).size.height),
    //       child: Stack(
    //         alignment: Alignment.bottomRight,
    //         children: [
    //           PhotoViewGallery.builder(
    //             scrollPhysics: const BouncingScrollPhysics(),
    //             builder: (BuildContext context, int index) {
    //               return PhotoViewGalleryPageOptions(
    //                 imageProvider: NetworkImage(
    //                     widget.galleries![index].resource.toString()),
    //                 initialScale: PhotoViewComputedScale.contained * 0.8,
    //                 // heroAttributes:
    //                 //     PhotoViewHeroAttributes(tag: widget.galleries![index].id),
    //               );
    //             },
    //             itemCount: widget.galleries!.length,
    //             loadingBuilder: widget.loadingBuilder,
    //             backgroundDecoration:
    //                 widget.backgroundDecoration as BoxDecoration?,
    //             pageController: widget.pageController,
    //             onPageChanged: onPageChanged,
    //             scrollDirection: widget.scrollDirection!,
    //           ),
    //           // Container(
    //           //   padding: const EdgeInsets.all(20.0),
    //           //   child: Text(
    //           //     widget.galleries![currentIndex].description!,
    //           //     style: const TextStyle(
    //           //       color: Colors.white,
    //           //       fontSize: 17.0,
    //           //     ),
    //           //   ),
    //           // )
    //         ],
    //       )),
    // );
  }

  PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
    final GalleryItemModel item = widget.galleries![index];
    print('les images de la gallery :${item.resource}');

    return PhotoViewGalleryPageOptions(
        imageProvider: NetworkImage(item.resource!.toString()),
        initialScale: PhotoViewComputedScale.contained,
        minScale: PhotoViewComputedScale.contained * (0.5 + index / 10),
        maxScale: PhotoViewComputedScale.contained * 1.1,
        heroAttributes: PhotoViewHeroAttributes(tag: item.id!));
  }
}

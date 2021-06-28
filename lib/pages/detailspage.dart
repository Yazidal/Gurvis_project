import 'package:flutter/material.dart';
import 'package:flutter_application_1/helpers/appcolors.dart';
import 'package:flutter_application_1/models/GalleryItemModel.dart';
import 'package:flutter_application_1/services/categoryselectionservice.dart';
import 'package:flutter_application_1/widgets/GalleryPhotoWrapper.dart';
import 'package:flutter_application_1/widgets/GalleryThumbnail.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/models/pathologies.dart';

class DetailsPage extends StatefulWidget {
  Pathology? pathology;

  @override
  DetailsPageState createState() => DetailsPageState();
}

class DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    List<GalleryItemModel> galleries = [];

    CategorySelectionService catSelection =
        Provider.of<CategorySelectionService>(context, listen: false);
    widget.pathology = catSelection.selectedPathology;

    if (widget.pathology!.imagerie != null &&
        widget.pathology!.imagerie!.length != 0) {
      for (var i = 0; i < widget.pathology!.imagerie!.length; i++) {
        galleries.add(GalleryItemModel(
            id: i,
            resource: widget.pathology!.imagerie![i].toString(),
            isSVG: false));
        // galleries.add(widget.pathology!.imagerie![i].toString());
        print(galleries[i].resource.toString());
      }
    }

    var arguments;
    if (ModalRoute.of(context)!.settings.arguments != null)
      arguments = ModalRoute.of(context)!.settings.arguments as Map;

    var typeinfo;
    bool? img = false;
    if (arguments != null) {
      print(arguments['exampleArgument']);

      switch (arguments['exampleArgument']) {
        case 'biologie':
          typeinfo = widget.pathology!.biologie;
          img = false;

          print('typeinfo: ${typeinfo}');
          break;
        case 'references':
          typeinfo = widget.pathology!.references;
          img = false;

          print('typeinfo: ${typeinfo}');
          break;
        case 'epidemologie':
          typeinfo = widget.pathology!.epidemologie;
          img = false;
          print('typeinfo: ${typeinfo}');
          break;
        case 'imagerie':
          typeinfo = widget.pathology!.imagerie != null ? img = true : null;
          print('typeinfo: ${typeinfo}');
          break;
        case 'descriptionimagerie':
          typeinfo = widget.pathology!.imageriedescription;
          img = false;

          print('typeinfo: ${typeinfo}');
          break;
        case 'signes':
          typeinfo = widget.pathology!.signes;
          img = false;

          print('typeinfo: ${typeinfo}');
          break;
        case 'diagnostique':
          typeinfo = widget.pathology!.diagnostique;
          img = false;

          print('typeinfo: ${typeinfo}');
          break;
        case 'conduite':
          typeinfo = widget.pathology!.conduite;
          img = false;

          print('typeinfo: ${typeinfo}');
          break;
        default:
          typeinfo = widget.pathology!.epidemologie;
          img = false;

          print('typeinfo: ${typeinfo}');
          break;
      }
    } else {
      typeinfo = "veuillez selectionner une section depuis le menu";
    }

    // CartService cartService = Provider.of<CartService>(context, listen: false);
    //${widget.pathology!.name}
    void _open(BuildContext context, final int index) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => GalleryPhotoWrapper(
                    galleries: galleries,
                    backgroundDecoration:
                        const BoxDecoration(color: Colors.black),
                    initalIndex: index,
                    scrollDirection: Axis.horizontal,
                  )));
    }

    gallery() {
      print('nombre d item: ${galleries[1].resource}');

      // CarouselSlider(
      //     items:
      Text('item : ${galleries.map((item) => item.resource)}');

      // Container(
      //         child: GalleryItemThumbnail(
      //       galleryItemModel: item,
      //       onTap: () {
      //         _open(context, 0);
      //       },
      //     ))

      //     .toList(),
      // options: CarouselOptions(
      //     viewportFraction: 1.0,
      //     onPageChanged: (index, reason) {
      //       setState(() {
      //         _current = index;
      //       });
      //     })),
      // Padding(
      //   padding: EdgeInsets.only(right: 30),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.end,
      //     children: galleries.map((url) {
      //       int index = galleries.indexOf(url);
      //       return Padding(
      //         padding: EdgeInsets.only(left: 5),
      //         child: Container(
      //             width: 10.0,
      //             height: 10.0,
      //             margin:
      //                 EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
      //             decoration: BoxDecoration(
      //                 shape: BoxShape.circle,
      //                 color: _current == index
      //                     ? Colors.redAccent
      //                     : Colors.grey)),
      //       );
      //     }).toList(),
      //   ),
      // ),
      // SizedBox(height: 20),
      // Divider(thickness: 3, color: Colors.grey),
      // SizedBox(height: 20),
      // Padding(
      //     padding: EdgeInsets.only(left: 5, right: 5, top: 30),
      //     child: Card(
      //       shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(7.0),
      //       ),
      //       color: Colors.white,
      //       elevation: 1.0,
      //       child: Padding(
      //         padding: EdgeInsets.all(10.0),
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.start,
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Text("Detail Info",
      //                 style: TextStyle(
      //                     fontSize: 25, fontWeight: FontWeight.bold)),
      //             Padding(
      //               padding: EdgeInsets.only(right: 200),
      //               child: Divider(thickness: 3, color: Colors.grey),
      //             ),
      //             SizedBox(
      //               height: 20,
      //             ),
      //             Text("Name",
      //                 style: TextStyle(
      //                     fontSize: 25, fontWeight: FontWeight.bold)),
      //             Padding(
      //               padding: EdgeInsets.all(10),
      //               child: Container(
      //                 child: Text(
      //                     "Name bla lab asldjal asjdalskdjasdjaasudiyasida oasudoiasdasdas sa"),
      //               ),
      //             ),
      //             Divider(thickness: 2, color: Colors.grey),
      //             SizedBox(
      //               height: 10,
      //             ),
      //             Text("Description",
      //                 style: TextStyle(
      //                     fontSize: 25, fontWeight: FontWeight.bold)),
      //             Padding(
      //               padding: EdgeInsets.all(10),
      //               child: Container(
      //                 child: Text(
      //                     "Name bla lab asldjal asjdalskdjasdjaasudiyasida oasudoiasdasdas sa"),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     )),
    }

    check() {
      if (img!) {
        // gallery();
        return Container(
            padding: EdgeInsets.all(12.0),
            child: GridView.builder(
              itemCount: galleries.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    child: GalleryItemThumbnail(
                  galleryItemModel: galleries[index],
                  onTap: () {
                    _open(context, 0);
                  },
                ));
              },
            ));
      } else {
        return

            // Container(
            //   padding: const EdgeInsets.all(8.0),
            //   alignment: Alignment.topLeft,
            //   child: Text(
            //     typeinfo != null ? typeinfo : "Cette section est vide!",
            //     // style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            //     // textAlign: TextAlign.left,
            //   ),
            // );
            SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text(
                typeinfo != null ? typeinfo : "Cette section est vide!",
                // style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                // textAlign: TextAlign.left,
              ),
            ],
          ),
        );
      }
    }

    print('detail de  ${widget.pathology!.name!}');
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.MAIN_COLOR,
          title: Container(
              margin: EdgeInsets.only(top: 4.0),
              child: Column(
                children: <Widget>[
                  Text('Symptoms App',
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .apply(color: Colors.white)),
                  Text('Infos sur ${widget.pathology!.name!}',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .apply(color: Colors.white))
                ],
              )),
          centerTitle: true,
        ),
        body: check(),

        // Center(child: Text(widget.pathology!.epidemologie!)),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: AppColors.MAIN_COLOR,
                ),
                child: Text('Details sur la pathologie'),
              ),
              ListTile(
                title: Text('Epidemologie'),
                onTap: () {
                  var exampleArgument = 'epidemologie';

                  Navigator.pushNamed(
                    context,
                    '/detailspage',
                    arguments: {'exampleArgument': exampleArgument},
                  );
                },
              ),
              ListTile(
                title: Text('Signes cliniques'),
                onTap: () {
                  var exampleArgument = 'signes';

                  Navigator.pushNamed(
                    context,
                    '/detailspage',
                    arguments: {'exampleArgument': exampleArgument},
                  );
                },
              ),
              ListTile(
                title: Text('Diagnostiques differenciels'),
                onTap: () {
                  var exampleArgument = 'diagnostique';

                  Navigator.pushNamed(
                    context,
                    '/detailspage',
                    arguments: {'exampleArgument': exampleArgument},
                  );
                },
              ),
              ListTile(
                title: Text('Biologie'),
                onTap: () {
                  var exampleArgument = 'biologie';

                  Navigator.pushNamed(
                    context,
                    '/detailspage',
                    arguments: {'exampleArgument': exampleArgument},
                  );
                },
              ),
              ListTile(
                title: Text('Iconographie'),
                onTap: () {
                  var exampleArgument = 'imagerie';

                  Navigator.pushNamed(
                    context,
                    '/detailspage',
                    arguments: {'exampleArgument': exampleArgument},
                  );
                },
              ),
              ListTile(
                title: Text('Imagerie'),
                onTap: () {
                  var exampleArgument = 'descriptionimagerie';

                  Navigator.pushNamed(
                    context,
                    '/detailspage',
                    arguments: {'exampleArgument': exampleArgument},
                  );
                },
              ),
              ListTile(
                title: Text('Conduite à tenir'),
                onTap: () {
                  var exampleArgument = 'conduite';

                  Navigator.pushNamed(
                    context,
                    '/detailspage',
                    arguments: {'exampleArgument': exampleArgument},
                  );
                },
              ),
            ],
          ),
        ));
  }
}

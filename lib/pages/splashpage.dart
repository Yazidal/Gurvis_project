import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/helpers/appcolors.dart';
import 'package:flutter_application_1/helpers/iconhelper.dart';
import 'package:flutter_application_1/services/categoryservice.dart';
import 'package:flutter_application_1/widgets/iconfont.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatelessWidget {
  int? duration = 0;
  String? goToPage;

  SplashPage({this.goToPage, this.duration});

  @override
  Widget build(BuildContext context) {
    CategoryService catService =
        Provider.of<CategoryService>(context, listen: false);

    Future.delayed(Duration(seconds: this.duration!), () async {
      // await for the Firebase initialization to occur
      FirebaseApp app = await Firebase.initializeApp();

      catService.getCategoriesCollectionFromFirebase().then((value) {
        var exampleArgument = 'example string';

        Navigator.pushNamed(
          context,
          '/mainpage',
          arguments: {'exampleArgument': exampleArgument},
        );

        // Utils.mainAppNav.currentState!.pushNamed('./mainpage');
      });
    });

    return Material(
        child: Container(
            // decoration: new BoxDecoration(
            //     image: new DecorationImage(
            //         fit: BoxFit.fitWidth,
            //         alignment: FractionalOffset.topCenter,
            //         image: AssetImage(
            //           'assets/icon/logo.jpeg',
            //         ))),
            color: AppColors.MAIN_COLOR,
            alignment: Alignment.center,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    // child: Text("GURVIS",
                    //     style: TextStyle(
                    //       color: Colors.white,
                    //       fontSize: 40,
                    //     )),
                    child: IconFont(
                        color: Colors.white,
                        iconName: IconFontHelper.LOGO,
                        size: 150),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: CircularProgressIndicator(
                      strokeWidth: 10,
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.white.withOpacity(0.5)),
                    ),
                  ),
                )
              ],
            )));
  }
}

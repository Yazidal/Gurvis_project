import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/categoriespage.dart';
import 'package:flutter_application_1/pages/detailspage.dart';

import 'package:flutter_application_1/pages/selectedcategorypage.dart';
import 'package:flutter_application_1/pages/splashpage.dart';
import 'package:flutter_application_1/pages/welcomepage.dart';
import 'package:flutter_application_1/services/cartservice.dart';
import 'package:flutter_application_1/services/categoryservice.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/services/categoryselectionservice.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        // ChangeNotifierProvider(
        //   create: (_) => LoginService()
        // ),
        ChangeNotifierProvider(create: (_) => CategorySelectionService()),
        ChangeNotifierProvider(create: (_) => CartService()),
        Provider(create: (_) => CategoryService())
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Raleway'),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => SplashPage(duration: 2, goToPage: '/mainpage'),
          '/welcomepage': (context) => WelcomePage(),
          '/mainpage': (context) => Categories(),
          '/selectedcategorypage': (context) => SelectedCategoryPage(),
          '/detailspage': (context) => DetailsPage(),
        },
      )));
}

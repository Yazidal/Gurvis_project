import 'package:flutter/material.dart';
import 'package:flutter_application_1/helpers/appcolors.dart';
import 'package:flutter_application_1/models/category.dart';
import 'package:flutter_application_1/models/pathologies.dart';
import 'package:flutter_application_1/pages/detailspage.dart';
import 'package:flutter_application_1/services/cartservice.dart';
import 'package:flutter_application_1/services/categoryselectionservice.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SelectedCategoryPage extends StatelessWidget {
  Category? selectedCategory;

  @override
  Widget build(BuildContext context) {
    CategorySelectionService catSelection =
        Provider.of<CategorySelectionService>(context, listen: false);
    selectedCategory = catSelection.selectedCategory;
    CartService cartService = Provider.of<CartService>(context, listen: false);

    return MaterialApp(
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                  automaticallyImplyLeading: true,
                  backgroundColor: AppColors.MAIN_COLOR,
                  title: Container(
                      margin: EdgeInsets.only(top: 4.0),
                      child: Column(
                        children: <Widget>[
                          Text('GURVIS',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .apply(color: Colors.white)),
                          Text('${this.selectedCategory!.name!}',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .apply(color: Colors.white))
                        ],
                      )),
                  centerTitle: true,
                  bottom: TabBar(
                    indicatorColor: Colors.white,
                    indicatorWeight: 5.0,
                    tabs: [
                      Tab(
                        icon: Icon(Icons.health_and_safety_outlined),
                        text: 'Pathologies',
                      ),
                      Tab(
                        icon: Icon(Icons.supervised_user_circle_outlined),
                        text: 'A propos',
                      ),
                    ],
                  )),
              body: TabBarView(
                children: [
                  SafeArea(
                    child: AnimationLimiter(
                      child: ListView.separated(
                        padding: const EdgeInsets.all(8),
                        itemCount: this.selectedCategory!.pathologies!.length,
                        itemBuilder: (BuildContext ctx, int index) {
                          return GestureDetector(
                            onTap: () {
                              var subCat =
                                  this.selectedCategory!.pathologies![index];
                              catSelection.selectedPathology = cartService
                                  .getCategoryFromCart(subCat as Pathology);

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailsPage()));
                            },
                            child: Card(
                              margin: EdgeInsets.all(4),
                              color: Colors.white,
                              child: InkWell(
                                splashColor: Colors.blue,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Flexible(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Container(
                                            padding: const EdgeInsets.all(8.0),
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              this
                                                  .selectedCategory!
                                                  .pathologies![index]
                                                  .name
                                                  .toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                              textAlign: TextAlign.left,
                                              maxLines: 5,
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(8.0),
                                            alignment: Alignment.bottomLeft,
                                            child: Text(
                                              'cliquez pour en savoir plus',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 13),
                                              textAlign: TextAlign.left,
                                              maxLines: 5,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(),
                      ),
                    ),
                  ),
                  Icon(Icons.directions_transit),
                ],
              ),
            )));
  }
}

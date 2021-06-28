import 'package:flutter/material.dart';
import 'package:flutter_application_1/helpers/appcolors.dart';
import 'package:flutter_application_1/models/category.dart';
import 'package:flutter_application_1/models/pathologies.dart';
import 'package:flutter_application_1/pages/detailspage.dart';
import 'package:flutter_application_1/services/cartservice.dart';
import 'package:flutter_application_1/services/categoryselectionservice.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

class CategorySelectedPapge extends StatefulWidget {
  const CategorySelectedPapge({Key? key}) : super(key: key);

  @override
  _CategorySelectedPapgeState createState() => _CategorySelectedPapgeState();
}

class _CategorySelectedPapgeState extends State<CategorySelectedPapge> {
  Category? selectedCategory;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    CategorySelectionService catSelection =
        Provider.of<CategorySelectionService>(context, listen: false);
    selectedCategory = catSelection.selectedCategory;
    CartService cartService = Provider.of<CartService>(context, listen: false);

    List<Widget> _widgetOptions = <Widget>[
      SafeArea(
        child: AnimationLimiter(
          child: ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: this.selectedCategory!.pathologies!.length,
            itemBuilder: (BuildContext ctx, int index) {
              return GestureDetector(
                onTap: () {
                  var subCat = this.selectedCategory!.pathologies![index];
                  catSelection.selectedPathology =
                      cartService.getCategoryFromCart(subCat as Pathology);

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DetailsPage()));
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
      Center(
        child: Column(
          children: <Widget>[
            Container(
              child: Image.asset("assets/images/qadiayad.jpeg", width: 250),
            ),
            Container(
              height: 100.0,
            ),
            Container(
                height: 20.0,
                child: Text(
                  "Dr. SADAK ZAKARIA",
                  style: TextStyle(fontSize: 20.0),
                )),
            Container(
              height: 100.0,
            ),
            Container(
                height: 20.0,
                child: Text(
                  "Encadré par : Pr. RABBANI KHALID",
                  style: TextStyle(fontSize: 20.0),
                )),
            Container(
                child: Text(
              "et Pr. RAGHAY SAID",
              style: TextStyle(fontSize: 20.0),
            )),
          ],
        ),
      ),
    ];

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return Scaffold(
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
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Pathologies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.recent_actors_outlined),
            label: 'A propos',
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.MAIN_COLOR,
        onTap: _onItemTapped,
      ),
    );
  }
}

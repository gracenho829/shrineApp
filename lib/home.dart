import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'model/products_repository.dart';
import 'model/product.dart';

const handongURL = "https://www.handong.edu";

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  List<Card> _buildGridCards(BuildContext context) {
  List<Product> products = ProductsRepository.loadProducts(Category.all);

  if (products.isEmpty) {
    return const <Card>[];
  }

  final ThemeData theme = Theme.of(context);
  final NumberFormat formatter = NumberFormat.simpleCurrency(
      locale: Localizations.localeOf(context).toString());

  return products.map((product) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 18 / 11,
            child: Image.asset(
              product.assetName,
              package: product.assetPackage,
              fit: BoxFit.fitWidth,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
              child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                 Text(
                    product.name,
                    style: theme.textTheme.headline6,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    formatter.format(product.price),
                    style: theme.textTheme.subtitle2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }).toList();
}

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('SHRINE'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
              semanticLabel: 'search',
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/search');
            },
          ),
          const IconButton(
            icon: Icon(
              Icons.language,
              semanticLabel: 'language',
            ),
            onPressed: _launchURL,
          ),
        ],
      ),
      drawer: Drawer(
        child: 
        ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: 
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text('Pages', style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 25)),
                  ), 
                )
              ),
              
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.home, color: Colors.blue,),
                      title: const Text('Home'),
                      onTap: () {
                        // Update the state of the app
                        // ...
                        // Then close the drawer
                       Navigator.pushNamed(context, '/home');
                      },
                   ),
                    ListTile(
                      leading: const Icon(Icons.search,color: Colors.blue,),
                      title: const Text('Search'),
                      onTap: () {
                        // Update the state of the app
                        // ...
                        // Then close the drawer
                        Navigator.pushNamed(context, '/search');
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.location_city,color: Colors.blue,),
                      title: const Text('Favorite Hotel'),
                      onTap: () {
                        // Update the state of the app
                        // ...
                        // Then close the drawer
                        Navigator.pushNamed(context, '/favorites');
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.person,color: Colors.blue,),
                      title: const Text('My Page'),
                      onTap: () {
                        // Update the state of the app
                        // ...
                        // Then close the drawer
                        Navigator.pushNamed(context, '/myPage');
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.logout,color: Colors.blue,),
                      title: const Text('Log Out'),
                      onTap: () {
                        // Update the state of the app
                        // ...
                        // Then close the drawer
                        Navigator.pushNamed(context, '/login');
                      },
                    ),
                  ],
                ),
              ),
          ],
        ),
        ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        childAspectRatio: 8.0 / 9.0,
        children: _buildGridCards(context),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}

void _launchURL() async =>
    await canLaunch(handongURL) ? await launch(handongURL) : throw 'Could not launch $handongURL';
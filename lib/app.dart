import 'package:flutter/material.dart';
import 'home.dart';
import 'login.dart';
import 'search.dart';
import 'favorites.dart';
import 'profile.dart';

class ShrineApp extends StatelessWidget {
  const ShrineApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      home: const HomePage(),
      initialRoute: '/login',
      routes:{
        '/login': (context)=> const LoginPage(),
        '/home' : (context) => const HomePage(),
        '/search': (context)=> const SearchPage(),
        '/favorites': (context)=> const FavoritesPage(),
        '/myPage':(context)=>const ProfilePage(),
      },
      onGenerateRoute: _getRoute,
    );
  }

  Route<dynamic>? _getRoute(RouteSettings settings) {
    if (settings.name != '/login') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => const LoginPage(),
      fullscreenDialog: true,
    );
  }
}


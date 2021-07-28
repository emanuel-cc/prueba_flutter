import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_flutter/providers/change_page_provider.dart';
import 'package:prueba_flutter/screens/screens.dart';
import 'package:prueba_flutter/services/pokemon_services.dart';
 
void main() => runApp(AppState());

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_)=>PokemonServices(),
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (_)=>ChangePageProvider(),
          lazy: true,
        )
      ],
      child: MyApp(),
    );
  }
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: HomeScreen(),
      routes: {
        'detail': (BuildContext context) => PokemonDetailScreen()
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          color: Colors.white12
        )
      ),
    );
  }
}
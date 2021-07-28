import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_flutter/providers/change_page_provider.dart';
import 'package:prueba_flutter/routes/routes.dart';
import 'package:prueba_flutter/screens/screens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    final changePage = Provider.of<ChangePageProvider>(context);
    return Scaffold(
      key: _scaffoldKey,
      drawer: NavDrawer(),
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.menu_sharp,
            color: Colors.black,
          ),
          onPressed: _openDrawer
        ),
      ),
      body: changePage.currentList //CalendarScreen() //MapaScreen()//PokemonScreen(),
    );
  }
}

class NavDrawer extends StatefulWidget {

  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final changePage = Provider.of<ChangePageProvider>(context);

    void _closeDrawer() {
      Navigator.of(context).pop();
    }
    return Container(
      width: size.width * 0.6,
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: ListView.builder(
        //padding: EdgeInsets.zero,
        itemCount: pageRoutes.length,
        itemBuilder: (context, i){
          return ListTile(
            leading: Icon(
              pageRoutes[i].image,
              color: (changePage.currentColor == pageRoutes[i].color)?Colors.blueAccent:Colors.grey,
            ),
            title: Text(
              pageRoutes[i].titulo,
              style: TextStyle(
                color: (changePage.currentColor == pageRoutes[i].color)?Colors.blueAccent:Colors.black
              ),
            ),
            selectedTileColor: (changePage.currentColor == pageRoutes[i].color)?Colors.grey:Colors.white,
            onTap: (){
              changePage.currentColor = pageRoutes[i].color;
              changePage.currentTitle = pageRoutes[i].titulo;
              changePage.currentList = pageRoutes[i].lista;
              _closeDrawer();
            },
          );
        },
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:prueba_flutter/screens/screens.dart';

class ChangePageProvider extends ChangeNotifier{
  Widget _currentList = PokemonScreen();
  Color _colorItem = Color(0xff90324D); 
  String _currentTitle = 'Pokemon';

  set currentList(Widget lista){
    this._currentList = lista;
    notifyListeners();
  }

  Widget get currentList => this._currentList;

  set currentColor(Color color){
    this._colorItem = color;
    notifyListeners();
  }
  Color get currentColor => this._colorItem;

  set currentTitle(String title){
    this._currentTitle = title;
    notifyListeners();
  }
  String get currentTitle => this._currentTitle;
  Widget changePage(String page){
    if(page == "pokemon"){
      return PokemonScreen();
    }else if(page == "calendar"){
      return CalendarScreen();
    }else{
      return MapaScreen();
    }
  }
}
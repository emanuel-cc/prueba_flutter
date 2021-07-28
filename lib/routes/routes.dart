import 'package:flutter/material.dart';
import 'package:prueba_flutter/screens/screens.dart';

final pageRoutes = <_Route>[
  _Route(
    'Pokemon',
    Icons.image,
    PokemonScreen(),
    Colors.blueAccent
  ),
  _Route(
    'Calendario',
    Icons.calendar_today,
    CalendarScreen(),
    Colors.green
  ),
  _Route(
    'Mapa',
    Icons.map,
    MapaScreen(),
    Colors.orange
  )
];

class _Route{
  final Widget lista;
  final String titulo;
  final IconData image;
  final Color color;

  _Route(
    this.titulo,
    this.image,
    this.lista,
    this.color
  );
}
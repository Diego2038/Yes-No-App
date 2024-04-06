


import 'package:flutter/material.dart';

const Color _color =  Color(0xFF763464);

const List<Color> _colorThemes = [
    _color,
    Colors.red,
    Colors.blueAccent,
    Colors.pinkAccent,
    Colors.purple,
    Colors.yellow
  ];


class AppTheme{

  final int selectedColor;
  AppTheme({
    this.selectedColor = 0
    }):assert(selectedColor>=0 && selectedColor<=_colorThemes.length-1, "Colors muust be between 0 and ${_colorThemes.length-2}" );

     
  ThemeData theme () {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
      // brightness: Brightness.dark
    );
  }

}
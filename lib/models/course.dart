import 'package:flutter/material.dart';

class Course {
  final String title, description, iconSrc;
  final Color bgColor;

  Course({
    required this.title,
    this.description =
        "Construindo este App atraves dos rascunhos liberados pela FlutterWay",
    this.iconSrc = "assets/icons/ios.svg",
    this.bgColor = const Color(0xff7553f6),
  });
}

List<Course> course = [
  Course(title: "Animação com SwiftUI"),
  Course(
    title: "Animação em Flutter",
    iconSrc: "assets/icons/code.svg",
    bgColor: const Color(0xff80a4ff),
  ),
];
List<Course> recentCourse = [
  Course(title: "Estodo de maquina"),
  Course(
    title: "Menu Animado",
    bgColor: const Color(0xff9cc5ff),
    iconSrc: "assets/icons/code.svg",
  ),
  Course(
    title: "Flutter com Rive",
    bgColor: const Color(0xff9cc5ff),
    iconSrc: "assets/icons/code.svg",
  ),
];

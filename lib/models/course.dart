import 'package:flutter/material.dart';

class Course {
  final String title, subtitle, description, iconSrc;
  final Color bgColor;

  Course({
    required this.title,
    this.subtitle = "",
    this.description = "",
    this.iconSrc = "assets/icons/ios.svg",
    this.bgColor = const Color(0xff7553f6),
  });
}

List<Course> course = [
//01
  Course(
    title: "Animação com Rive",
    description:
        "Construindo este App atraves dos rascunhos liberados pela FlutterWay",
    iconSrc: "assets/icons/code.svg",
  ),
//02
  Course(
    title: "Animação em Flutter",
    description: "Foi dificil de MAAAIS e levou um tempão para entender",
    subtitle: "só sofrencia....",
    iconSrc: "assets/icons/code.svg",
    bgColor: const Color(0xff80a4ff),
  ),
];

List<Course> recentCourse = [
//03
  Course(
    title: "Para a B.A. Horizontal",
    subtitle: "Aproximadamente 3horas entre estudo e aplicação",
    iconSrc: "assets/icons/code.svg",
    bgColor: const Color(0xff9cc5ff),
  ),
//04
  Course(
    title: "Para esta C.A. Vertical ",
    subtitle: "Foram aproximadamente 20min",
    bgColor: const Color(0xff7553f6),
    //iconSrc: "assets/icons/code.svg",
  ),
//05
  Course(
    title: "Mas oque demorou mesmo...",
    subtitle: "Foi a BottonNavigatorBar ai de baixo, 8h!",
    bgColor: const Color(0xff80a4ff),
    iconSrc: "assets/icons/code.svg",
  ),
  //06
  Course(
    title: "Ela foi feita a mão e está toda personalizada",
    bgColor: const Color(0xff9cc5ff),
    iconSrc: "assets/icons/code.svg",
  ),
  Course(
    title: "Translucida e não sobreposta a area da coluna",
  ),
  Course(
    title: "Com icones Rive Animados",
    subtitle: "e iluminados quando selecionados.",
    bgColor: const Color(0xff80a4ff),
    iconSrc: "assets/icons/code.svg",
  ),

  Course(
    title: "Deixe seu Like",
    bgColor: const Color(0xff9cc5ff),
  ),
  Course(
    title: "",
    bgColor: Colors.transparent,
  ),
];

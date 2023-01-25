import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              "Cursos",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Colors.black, fontWeight: FontWeight.w600),
            ),
          ),
          Cartoes(),
        ]),
      ),
    );
  }
}

class Cartoes extends StatelessWidget {
  const Cartoes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 26),
      height: 280,
      width: 260,
      decoration: const BoxDecoration(
        color: Color(0xff7553f6),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Animação em SwiftUI",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 8),
                  child: Text(
                    "Construindo este App atraves dos rascunhos liberados pela FlutterWay",
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
                const Text(
                  "XX Seções - 28 Horas de trabalho",
                  style: TextStyle(color: Colors.white38),
                ),
                const Spacer(),
                Row(
                  children: List.generate(
                    3,
                    (index) => Transform.translate(
                      offset: Offset((-10 * index).toDouble(), 0),
                      child: CircleAvatar(
                          radius: 24,
                          backgroundImage: AssetImage(
                              "assets/avaters/Avatar ${index + 1}.jpg")),
                    ),
                  ),
                )
              ],
            ),
          ),
          SvgPicture.asset("assets/icons/ios.svg")
        ],
      ),
    );
  }
}

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

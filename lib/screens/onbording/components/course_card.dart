import 'package:beaultiful_login_and_slidable_drawer/home/home_screen.dart';
import 'package:beaultiful_login_and_slidable_drawer/models/course.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    Key? key,
    required this.course,
  }) : super(key: key);

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 26),
      height: 280,
      width: 260,
      decoration: BoxDecoration(
        color: course.bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.title,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 8),
                  child: Text(
                    course.description,
                    style: const TextStyle(color: Colors.white70),
                  ),
                ),
                Text(
                  course.subtitle,
                  //"XX Seções - 28 Horas de trabalho",
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

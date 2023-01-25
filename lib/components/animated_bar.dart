import 'package:flutter/material.dart';


class AnimatedBar extends StatelessWidget {
  const AnimatedBar({
    Key? key,
    required this.isActivate,
  }) : super(key: key);

  final bool isActivate;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(bottom: 5),
      height: 4,
//---> Define se o traço ficará sobre o botão quando selecionado
      width: isActivate ? 20 : 0,
      decoration: const BoxDecoration(
        color: Color(0xff81b4ff),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}
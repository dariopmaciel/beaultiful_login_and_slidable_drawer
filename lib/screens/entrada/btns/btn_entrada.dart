import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class AnimatedBtn extends StatelessWidget {
  const AnimatedBtn({
    Key? key,
    required RiveAnimationController btnAnimaionController,
    required this.press,
  })  : _btnAnimaionController = btnAnimaionController,
        super(key: key);

  final RiveAnimationController _btnAnimaionController;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        height: 64,
        width: 260,
        child: Center(
            child: Stack(
          children: [
            RiveAnimation.asset(
              "assets/RiveAssets/button.riv",
//controlador da animação
              controllers: [_btnAnimaionController],
            ),
            Positioned.fill(
              top: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.arrow_right_sharp),
                  SizedBox(width: 8),
                  Text(
                    "Pressione para Iniciar",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}

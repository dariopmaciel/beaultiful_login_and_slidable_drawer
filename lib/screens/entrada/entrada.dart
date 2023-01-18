import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rive/rive.dart';

class Entrada extends StatefulWidget {
  const Entrada({super.key});

  @override
  State<Entrada> createState() => _EntradaState();
}

class _EntradaState extends State<Entrada> {

//animação e inicialização da animação
  late RiveAnimationController _btnAnimaionController;
  @override
  void initState() {
    _btnAnimaionController = OneShotAnimation("active");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        //animação criada em Rive
        children: [
//componente parado
          Positioned(
            width: MediaQuery.of(context).size.width * 1.5,
            bottom: 200,
            left: 100,
            child: Image.asset("assets/Backgrounds/Spline.png"),
          ),
          // Positioned.fill(
          //   child: BackdropFilter(
          //     filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
          //     child: SizedBox(),
          //   ),
          // ),
//comnente em movimento
          const RiveAnimation.asset("assets/RiveAssets/shapes.riv"),
//blur
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
              child: SizedBox(),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  SizedBox(
                    width: 340,
                    child: Column(
                      children: const [
                        SizedBox(height: 12),
                        Text(
                          "Área de blur \naprendida",
                          style: TextStyle(
                            fontSize: 56,
                            fontFamily: "Poppins",
                            height: 1.2,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Nunca deixe aprende Caligagrafia, Design, UI e UX, com isto voce criará melhores e mais belos App comerciais, sempre que precisar inovar a cada sazonalidade comercial ",
                          style: TextStyle(fontSize: 16, fontFamily: "Intel"),
                        )
                      ],
                    ),
                  ),
//botão iniciar
                  GestureDetector(
                    onTap: () {
//ativador da animação do botão
                      _btnAnimaionController.isActive = true;
                    },
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
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'dart:ui';

import 'package:beaultiful_login_and_slidable_drawer/screens/entrada/componentes/componente.dart';
import 'package:beaultiful_login_and_slidable_drawer/screens/entrada/componentes/sing_in_form.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:rive/rive.dart';

class Entrada extends StatefulWidget {
  Entrada({super.key});

  @override
  State<Entrada> createState() => _EntradaState();
}

class _EntradaState extends State<Entrada> {
//animação e inicialização da animação
  late RiveAnimationController _btnAnimaionController;
  @override
  void initState() {
    _btnAnimaionController = OneShotAnimation(
      "active",
      autoplay: false,
    );
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
//não é necessário um blur sobre o componente parado
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
              child: const SizedBox(),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(flex: 1),
                  SizedBox(
                    width: 340,
                    child: Column(
                      children: [
                        const SizedBox(height: 12),
                        const Text(
                          "Área de blur \naprendida",
                          style: TextStyle(
                            fontSize: 56,
                            fontFamily: "Poppins",
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Aprendendo Caligagrafia, Design, UI e UX.\nCom isto criarei melhores e mais belos App comerciais, sempre que precisar inovar a cada sazonalidade comercial ",
                          style: TextStyle(fontSize: 16, fontFamily: "Intel"),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(flex: 4),
//botão iniciar que chama o AlertaDialog
                  AnimatedBtn(
                    btnAnimaionController: _btnAnimaionController,
                    press: () {
                      _btnAnimaionController.isActive = true;
                      showGeneralDialog(
                        context: context,
                        pageBuilder: (context, _, __) => Center(
                          child: Container(
                            height: 640,
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            padding: const EdgeInsets.symmetric(
                                vertical: 50, horizontal: 24),
                            decoration: const BoxDecoration(
                              //color: Colors.red,
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(40),
                              ),
                            ),
                            child: Scaffold(
                              backgroundColor: Colors.transparent,
                              body: SingleChildScrollView(
                                reverse: true,
                                child: Column(
                                  children: const [
                                    Text(
                                      "Efetue Login",
                                      style: TextStyle(
                                          fontSize: 34, fontFamily: "Poppins"),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 16),
                                      child: Text(
                                        "Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto Texto ",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                    SingInForm(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    child: Text(
                      "Este aprendizado  levou aproximadamente: \n-2h para aprender a usar o Rive e sua movimentação. \n-40min Para aprender e inserir o blur. \n-15min Para inserir e modifidar o botão. \n-20min Para aprender a usar a animação. ",
                      style: TextStyle(fontSize: 14, fontFamily: "Intel"),
                    ),
                  ),
                  const Spacer(flex: 1),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

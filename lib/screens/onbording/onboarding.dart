import 'dart:ui';

import 'package:beaultiful_login_and_slidable_drawer/screens/onbording/components/animated_btn.dart';
import 'package:beaultiful_login_and_slidable_drawer/screens/onbording/components/custon_sing_in_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:rive/rive.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
//variavel de controle de moviimentação de tela de Onboarding iniciando falsa (garantindo a não movimentação)
  bool isSingInDialodshow = false;

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
      //resizeToAvoidBottomInset: false,
      body: Stack(
        //animação criada em Rive
        children: [
//componente parado
          Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            bottom: 200,
            left: 100,
            child: Image.asset("assets/Backgrounds/Spline.png"),
          ),
//comnente em movimento
          const RiveAnimation.asset("assets/RiveAssets/shapes.riv"),
//blur
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
              child: const SizedBox(),
            ),
          ),
//---------->
          AnimatedPositioned(
            top: isSingInDialodshow ? -50 : 0,
            //top: -50,
            duration: const Duration(milliseconds: 1000),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(flex: 1),
                    SizedBox(
                      width: 620,
                      child: Column(
                        children: const [
                          SizedBox(height: 12),
                          Text(
                            "Blur Aprendido",
                            style: TextStyle(
                              fontSize: 56,
                              fontFamily: "Poppins",
                              height: 1.2,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            "Aprendendo Caligagrafia, Design, UI e UX.\nCom isto criarei melhores e mais belos App comerciais, sempre que precisar inovar a cada sazonalidade comercial ",
                            style: TextStyle(fontSize: 16, fontFamily: "Intel"),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(flex: 3),
                    //botão iniciar que chama o AlertaDialog
                    AnimatedBtn(
                      btnAnimaionController: _btnAnimaionController,
                      press: () {
                        _btnAnimaionController.isActive = true;
                        Future.delayed(const Duration(milliseconds: 1000), () {
                          //slide animation
                          custonSingInDialog(context, onClose: (__) {
                            setState(() {
                              isSingInDialodshow = false;
                            });
                          });
                          setState(() {
                            isSingInDialodshow = true;
                          });
                        });
                      },
                    ),
                    const Spacer(flex: 2),
                    const Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        "Este aprendizado durou aproximadamente: \n-2h para entender o Rive.app \n-15min Inserir e modifidar o botão. \n-10min Pausa do café. \n-20min Para aprender a usar a animação.\n-40min Inserir o blur.  ",
                        style: TextStyle(fontSize: 14, fontFamily: "Intel"),
                      ),
                    ),
                    const Spacer(flex: 1),
                    //                  const Spacer(flex: 1),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

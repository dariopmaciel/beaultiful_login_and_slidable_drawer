import 'dart:ui';

import 'package:beaultiful_login_and_slidable_drawer/screens/entrada/btns/btn_entrada.dart';
import 'package:beaultiful_login_and_slidable_drawer/screens/entrada/btns/btn_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
            width: MediaQuery.of(context).size.width * 1.7,
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

                        custonSingInDialog(context);
                      });
                    },
                  ),
                  const Spacer(flex: 2),
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Este aprendizado durou aproximadamente: \n-2h para Rive. \n-40min Inserir o blur. \n-15min Inserir e modifidar o botão. \n-20min Para aprender a usar a animação. ",
                      style: TextStyle(fontSize: 14, fontFamily: "Intel"),
                    ),
                  ),
                  const Spacer(flex: 1),
//                  const Spacer(flex: 1),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<Object?> custonSingInDialog(BuildContext context) {
    return showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: "Sing In",
      transitionDuration: const Duration(milliseconds: 1000),
      context: context,
//controle do movimento do AlertDialog
      transitionBuilder: (_, animation, __, child) {
        Tween<Offset> tween;
        tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
        return SlideTransition(
          position: tween.animate(
            CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          ),
          child: child,
        );
      },
      pageBuilder: (context, _, __) => Center(
        child: Container(
//----------------->
          height: 550,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
          decoration: const BoxDecoration(
            //color: Colors.red,
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(40),
            ),
          ),
          child: Scaffold(
//----------------->
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            //backgroundColor: Colors.blue,
            body: SingleChildScrollView(
              reverse: true,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Column(
                    children: [
                      const Text(
                        "Efetue Login",
                        style: TextStyle(fontSize: 34, fontFamily: "Poppins"),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          "Efetue seu acesso ",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      const SingInForm(),
                      Row(
                        children: const [
                          Expanded(child: Divider()),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              "Or",
                              style: TextStyle(color: Colors.black26),
                            ),
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          "Efetue seu Login via: \nDigital, Email, Apple e Google",
                          style: TextStyle(color: Colors.black54),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              "assets/icons/finger_print.svg",
                              height: 64,
                              width: 64,
                            ),
                          ),
                          IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              "assets/icons/email_box.svg",
                              height: 64,
                              width: 64,
                            ),
                          ),
                          IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              "assets/icons/apple_box.svg",
                              height: 64,
                              width: 64,
                            ),
                          ),
                          IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              "assets/icons/google_box.svg",
                              height: 64,
                              width: 64,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Positioned(
                    bottom: -35,
                    left: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

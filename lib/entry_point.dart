//https://rive.app/community/1298-2487-animated-icon-set-1-color/

import 'dart:ffi';
import 'dart:math';

import 'package:beaultiful_login_and_slidable_drawer/components/animated_bar.dart';
import 'package:beaultiful_login_and_slidable_drawer/components/side_menu.dart';
import 'package:beaultiful_login_and_slidable_drawer/constants.dart';

import 'package:beaultiful_login_and_slidable_drawer/home/home_screen.dart';
import 'package:beaultiful_login_and_slidable_drawer/models/menu_btn.dart';
import 'package:beaultiful_login_and_slidable_drawer/models/rive_asset.dart';
import 'package:beaultiful_login_and_slidable_drawer/utils/rive_utils.dart';
import 'package:flutter/material.dart';

import 'package:rive/rive.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint>
    with SingleTickerProviderStateMixin {
  RiveAsset selectedBottomNav = bottomNavs.first;

  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scalAnimation;

  late SMIBool isSideBarClose;
  bool isSideMenuClose = true;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300))
          ..addListener(() {
            setState(() {
              //do
            });
          });
    scalAnimation = Tween<double>(begin: 1, end: 0.8).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff17203a),
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Stack(
        children: [
          AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              curve: Curves.fastOutSlowIn,
              width: 288,
              top: 0,
              left: isSideMenuClose ? -288 : 0,
              height: MediaQuery.of(context).size.height,
              child: const SideMenu()),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(animation.value - 30 * animation.value * pi / 180),
            child: Transform.translate(
              offset: Offset(animation.value * 265, 0),
              //offset: Offset(isSideMenuClose ? 0 : 288, 0),
              child: Transform.scale(
                scale: scalAnimation.value,
                //scale: isSideMenuClose ? 1 : 0.8,
                child: const ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                  child: HomeScreen(),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            left: isSideMenuClose ? 0 : 220,
            child: MenuBtn(
              riveOnInit: (artboard) {
                StateMachineController controller = RiveUtils.getRiveController(
                    artboard,
                    StateMachineName: "State Machine");
                isSideBarClose = controller.findSMI("isOpen") as SMIBool;
                isSideBarClose.value = true;
              },
              press: () {
                isSideBarClose.value = !isSideBarClose.value;
                if (isSideMenuClose) {
                  _animationController.forward();
                } else {
                  _animationController.reverse();
                }

                setState(() {
                  isSideMenuClose = isSideBarClose.value;
                });
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Transform.translate(
        offset: Offset(0, 100 * animation.value),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
                color: backgroundColor2.withOpacity(0.8),
                borderRadius: const BorderRadius.all(Radius.circular(24))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(
                  bottomNavs.length,
                  (index) => GestureDetector(
                    onTap: () {
                      bottomNavs[index].input!.change(true);
                      if (bottomNavs[index] != selectedBottomNav) {
                        setState(() {
                          selectedBottomNav = bottomNavs[index];
                        });
                      }
                      Future.delayed(const Duration(seconds: 1), () {
                        bottomNavs[index].input!.change(false);
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedBar(
                            isActivate: bottomNavs[index] == selectedBottomNav),
                        SizedBox(
                          height: 36,
                          width: 36,
                          child: Opacity(
                            opacity: bottomNavs[index] == selectedBottomNav
                                ? 1
                                : 0.5,
                            child: RiveAnimation.asset(
                              bottomNavs.first.src,
                              artboard: bottomNavs[index].artboard,
                              onInit: (artboard) {
                                StateMachineController controller =
                                    RiveUtils.getRiveController(artboard,
                                        StateMachineName:
                                            bottomNavs[index].stateMachineName);
                                bottomNavs[index].input =
                                    controller.findSMI("active") as SMIBool;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

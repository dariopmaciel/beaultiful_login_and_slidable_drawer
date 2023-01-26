//https://rive.app/community/1298-2487-animated-icon-set-1-color/

import 'package:beaultiful_login_and_slidable_drawer/components/animated_bar.dart';
import 'package:beaultiful_login_and_slidable_drawer/constants.dart';
import 'package:beaultiful_login_and_slidable_drawer/home/home_screen.dart';
import 'package:beaultiful_login_and_slidable_drawer/models/rive_asset.dart';
import 'package:beaultiful_login_and_slidable_drawer/utils/rive_utils.dart';
import 'package:flutter/material.dart';

import 'package:rive/rive.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

RiveAsset selectedBottomNav = bottomNavs.first;

class _EntryPointState extends State<EntryPoint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Stack(
        children: [
          const HomeScreen(),
          SafeArea(
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
                boxShadow: BoxShadow(),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
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
                        opacity:
                            bottomNavs[index] == selectedBottomNav ? 1 : 0.5,
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
    );
  }
}

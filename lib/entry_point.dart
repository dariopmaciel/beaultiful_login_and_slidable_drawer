//https://rive.app/community/1298-2487-animated-icon-set-1-color/

import 'package:beaultiful_login_and_slidable_drawer/constants.dart';
import 'package:beaultiful_login_and_slidable_drawer/utils/rive_utils.dart';
import 'package:flutter/material.dart';

import 'package:rive/rive.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  late SMIBool searchTrigger;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
            color: backgroundColor2.withOpacity(0.8),
            borderRadius: const BorderRadius.all(Radius.circular(24))),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                searchTrigger.change(true);
              },
              child: SizedBox(
                height: 38,
                width: 38,
                child: RiveAnimation.asset(
                  "assets/RiveAssets/icons.riv",
                  artboard: "SEARCH",
                  onInit: (artboard) {
                    StateMachineController controller =
                        RiveUtils.getRiveController(artboard,
                            StateMachineName: "SEARCH_Interactivity");
                    searchTrigger = controller.findSMI("active") as SMIBool;
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RiveAsset {
  final String artboard, stateMachineName, title, src;
  late SMIBool? input;

  RiveAsset(this.src,
      {required this.artboard,
      required this.stateMachineName,
      required this.title,
      this.input});

  set setInput(SMIBool status) {
    input = status;
  }
}

List<RiveAsset> bottomNavs = [];

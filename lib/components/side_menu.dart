import 'package:beaultiful_login_and_slidable_drawer/components/info_card.dart';
import 'package:beaultiful_login_and_slidable_drawer/components/side_menu_tile.dart';
import 'package:beaultiful_login_and_slidable_drawer/models/rive_asset.dart';
import 'package:beaultiful_login_and_slidable_drawer/utils/rive_utils.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  RiveAsset selectedMenu = sideMenus.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288,
        height: double.infinity,
        color: const Color(0xff17203a),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const InfoCard(
                name: "Dario de Paula Maciel",
                email: "dariodepaulamaciel@hotmail.com",
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                child: Text(
                  "Menu".toUpperCase(),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
              ...sideMenus.map(
                (menu) => SideMenuTile(
                  menu: menu,
                  riveOnInit: (artboard) {
                    // Do the thing
                    StateMachineController controller =
                        RiveUtils.getRiveController(artboard,
                            StateMachineName: menu.stateMachineName);
                    menu.input = controller.findSMI("active") as SMIBool;
                  },
                  press: () {
                    menu.input!.change(true);
                    Future.delayed(
                      Duration(seconds: 1),
                      () {
                        //falso
                        menu.input!.change(false);
                      },
                    );
                    setState(() {
                      selectedMenu = menu;
                    });
                  },
                  isActive: selectedMenu == menu,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                child: Text(
                  "Avisos".toUpperCase(),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
              ...sideMenu2.map(
                (menu) => SideMenuTile(
                  menu: menu,
                  riveOnInit: (artboard) {
                    // Do the thing
                    StateMachineController controller =
                        RiveUtils.getRiveController(artboard,
                            StateMachineName: menu.stateMachineName);
                    menu.input = controller.findSMI("active") as SMIBool;
                  },
                  press: () {
                    menu.input!.change(true);
                    Future.delayed(
                      Duration(seconds: 1),
                      () {
                        //falso
                        menu.input!.change(false);
                      },
                    );
                    setState(() {
                      selectedMenu = menu;
                    });
                  },
                  isActive: selectedMenu == menu,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


//08:00
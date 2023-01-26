import 'package:beaultiful_login_and_slidable_drawer/components/info_card.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288,
        height: double.infinity,
        color: const Color(0xff17203a),
        child: SafeArea(
          child: Column(
            children: const [
              InfoCard(
                name: "Dario de Paula Maciel",
                email: "dariodepaulamaciel@hotmail.com",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

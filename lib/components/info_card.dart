import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    required this.name,
    required this.email,
  }) : super(key: key);

  final String name, email;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Colors.white24,
        child: Icon(
          Icons.person_outline,
          color: Colors.white,
        ),
      ),
      title: Text(
        name,
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        email,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

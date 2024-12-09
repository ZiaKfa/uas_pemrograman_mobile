import 'package:flutter/material.dart';
import 'package:uas_pemrograman_mobile/controller/login_controller.dart';

class SidebarTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onTap;
  final LoginController? loginController;

  const SidebarTile({required this.title, required this.icon, required this.onTap, this.loginController});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16.0,
          fontFamily: 'Avenir',
          fontWeight: FontWeight.w700,
        ),
      ),
      leading: Icon(
        icon,
        color: Colors.blue,
      ),
      onTap: onTap,
    );
  }
}
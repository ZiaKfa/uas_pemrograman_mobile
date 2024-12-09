import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_pemrograman_mobile/controller/login_controller.dart';
import 'package:uas_pemrograman_mobile/widget/sidebar_tile.dart';

class Sidebar extends StatelessWidget {
  final LoginController loginController;

  Sidebar({required this.loginController});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Text("Selamat Datang, ${loginController.username} !", style: const TextStyle(color: Colors.white, fontSize: 24)),
          ),
          SidebarTile(
            title: "Dashboard", 
            icon: Icons.dashboard, 
            onTap: (){
              Get.toNamed('/dashboard');
            }
          ),
          SidebarTile(
            title: "Kasir", 
            icon: Icons.monetization_on, 
            onTap: (){
              Get.toNamed('/cashier');
            }
          ),
          SidebarTile(
            title: "Logout",
            icon: Icons.logout,
            onTap: (){
              loginController.logout();
            }
          )
        ],
      ),
    );
  }
}
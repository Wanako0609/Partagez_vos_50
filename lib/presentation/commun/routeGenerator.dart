import 'package:flutter/material.dart';
import 'package:partagez_vos_50/presentation/panel_admin/main_panel/screen/panel_admin.dart';
import '../../main.dart';
import '../add_produit/screen/add_vet.dart';
import '../add_produit/test/cropper.dart';
import '../connection/login/screen/login.dart';
import '../connection/register/screen/registerPage.dart';
import '../profil_page/main/screen/profilpage.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) {
            return const MyMainPage();
          },
        );
      case '/login':
        return MaterialPageRoute(
          builder: (context) {
            return const MyLoginPage();
          },
        );
      case '/register':
        return MaterialPageRoute(
          builder: (context) {
            return const RegisterPage();
          },
        );
      case '/userProfil':
        return MaterialPageRoute(
          builder: (context) {
            return const ProfilPage();
          },
        );
      // case '/userProfil/changeName':
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return const UserChangeName();
      //     },
      //   );
      // case '/userProfil/changeAddress':
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return const UserChangeAddress();
      //     },
      //   );
      case '/userProfil/panelAdmin':
        return MaterialPageRoute(
          builder: (context) {
            return const PanelAdmin();
          },
        );
      case '/addVet':
        return MaterialPageRoute(
          builder: (context) {
            return const AddVetPage();
          },
        );

      case '/addVet/test':
        return MaterialPageRoute(
          builder: (context) {
            return const CropperScreen();
          },
        );

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(title: const Text("Error"), centerTitle: true),
            body: const Center(
              child: Text("Page not found"),
            ),
          ),
        );
    }
  }
}

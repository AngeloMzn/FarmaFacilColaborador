import 'package:farmafacil_colaborador/screens/home_screen.dart';
import 'package:farmafacil_colaborador/screens/management_screen.dart';
import 'package:farmafacil_colaborador/screens/profile_screen.dart';
import 'package:farmafacil_colaborador/screens/search_screen.dart';
import 'package:farmafacil_colaborador/theme/application_colors.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MainScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: NavigationBar(
          backgroundColor: ApplicationColors.primaryBackground,
          selectedIndex: currentPageIndex,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              label: "Início",
            ),
            NavigationDestination(
              icon: Icon(Icons.search),
              label: "Pesquisa",
            ),
            NavigationDestination(
              icon: Icon(Icons.work_outline),
              label: "Gerenciamento",
            ),
            NavigationDestination(
              icon: Icon(Icons.account_circle_outlined),
              label: "Perfil",
            ),
          ],
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
        ),
        body: [const HomeScreen(), const SearchScreen(), const ManagementScreen(), const ProfileScreen()][currentPageIndex]);
  }
}

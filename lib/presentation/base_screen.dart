import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:tasteq_bloc/presentation/manage_recipes/manage_recipies.dart';
import '../application/navbar/bloc/navbar_bloc.dart';
import '../core/constants/constants.dart';

String? usname;

// ignore: must_be_immutable
class BaseScreen extends StatelessWidget {
  BaseScreen({super.key, this.username});
  String? username;
  // void _onItemTapped(int index) {
  @override
  Widget build(BuildContext context) {
    usname = username;
    return Scaffold(
      // resizeToAvoidBottomInset: false,

      bottomNavigationBar: BlocBuilder<NavbarBloc, NavbarState>(
        builder: (context, state) {
          return BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_outline),
                label: 'Add',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favourites',
              ),
            ],
            showUnselectedLabels: true,
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.black,
            currentIndex: state.navIndex,
            onTap: (int bottomIndex) {
              BlocProvider.of<NavbarBloc>(context)
                  .add(OnTapped(navIndex: bottomIndex));
            },
          );
        },
      ),
      drawer: SidebarX(
        headerBuilder: (context, extended) {
          return SizedBox(
            child: Column(
              children: [
                Image.asset('assets/images/logo3.png'),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).viewInsets.top),
                  // child: Text(
                  //   '$usname',
                  //   style: const TextStyle(
                  //       fontWeight: FontWeight.bold, fontSize: 16),
                  // ),
                ),
              ],
            ),
          );
        },
        headerDivider: const SizedBox(
          height: 10,
        ),
        extendedTheme: const SidebarXTheme(
          width: 200,
        ),
        controller: SidebarXController(selectedIndex: 0),
        items: [
          SidebarXItem(
            icon: Icons.timelapse_rounded,
            label: '   Recently Viewed',
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => const Recent()));
            },
          ),
          SidebarXItem(
            icon: Icons.settings_outlined,
            label: '   Manage your recipes',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ManageRecipes()));
            },
          ),
          SidebarXItem(
            icon: Icons.info,
            label: '   About',
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => const AboutScreen()));
            },
          ),
          SidebarXItem(
            icon: Icons.title,
            label: '   Terms and Policy',
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => const TermsScreen()));
            },
          )
        ],
      ),
      body: BlocBuilder<NavbarBloc, NavbarState>(
        builder: (context, state) {
          return navItems[state.navIndex];
        },
      ),
    );
  }
}

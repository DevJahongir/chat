import 'package:chat_bot/components/my_drawer_tile.dart';
import 'package:flutter/material.dart';
import '../pages/settings_page.dart';
import '../services/auth/auth_service.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  // logout
  void logout(BuildContext context) {
    final auth = AuthService();
    auth.signOut();

    // then navigate to initial route (Auth Gate / Login Register Page
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //logo
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(40.0),
                    child: Image.asset(
                      "assets/images/message.png",
                    ),
                  ),
                ),
              ),

              ///Divider line
              Divider(
                color: Theme.of(context).colorScheme.secondary,
                indent: 25,
                endIndent: 25,
              ),

              // home list tile
              Padding(
                padding: const EdgeInsets.only(left: 25.0, top: 10),
                child: MyDrawerTile(
                  title: "H O M E",
                  icon: Icons.home,
                  onTap: () => Navigator.pop(context),
                ),
              ),

              // settings list tile
              Padding(
                padding: const EdgeInsets.only(left: 25.0, top: 0),
                child: MyDrawerTile(
                  title: "S E T T I N G S",
                  icon: Icons.settings,
                  onTap: () {
                    // pop drawer
                    Navigator.pop(context);

                    // go to settings page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SettingsPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),

          //logout list tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 25),
            child: MyDrawerTile(
              title: "L O G O U T",
              icon: Icons.logout,
              onTap: () => logout(context),
            ),
          ),
        ],
      ),
    );
  }
}

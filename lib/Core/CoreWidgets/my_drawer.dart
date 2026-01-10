import 'package:anopolly/Core/Constants/app_colors.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.blue,
      child: Column(
        children: [
          DrawerHeader(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: AppColors.grey,
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: AppColors.blue,
                    backgroundImage: AssetImage("assets/anopolly.png"),
                  ),
                ),

                Text(
                  "Anopolly",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          ListTile(
            title: Text(
              "Create poll",
              style: TextStyle(color: AppColors.white),
            ),
            leading: Icon(Icons.add, color: AppColors.white),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/createpollscreen');
            },
          ),
        ],
      ),
    );
  }
}

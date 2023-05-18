import 'package:flutter/material.dart';

class NavDrawerTile extends StatelessWidget {
  final String? navTitle;
  final IconData? navIcon;
  void Function()? onNavPress;
  NavDrawerTile({Key? key, this.navTitle, this.navIcon,this.onNavPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onNavPress,
      leading: Icon(navIcon),
      title: Text(
        navTitle!,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}

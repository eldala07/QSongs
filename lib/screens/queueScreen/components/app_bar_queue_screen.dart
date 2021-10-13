import 'package:flutter/material.dart';

class AppBarQueueScreen extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const AppBarQueueScreen({Key? key, required this.title}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation : 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Row(children: [
            Stack(children: const <Widget>[
              Icon(Icons.notifications),
              Positioned(
                top: 0.0,
                right: 0.0,
                child: Icon(Icons.brightness_1,
                    size: 8.0, color: Colors.redAccent),
              )
            ]),
            const SizedBox(width: 25),
            const Icon(Icons.history),
            const SizedBox(width: 25),
            const Icon(Icons.settings),
          ]),
        ],
      ),
    );
  }
}

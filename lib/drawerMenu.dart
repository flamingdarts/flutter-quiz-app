import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            padding: EdgeInsets.only(top: 120.0),
            child: Text(
              'Quiz App Menu',
              style: TextStyle(
                color: Colors.white,
                shadows: [
                  Shadow(offset: Offset(1, 1)),
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                image: AssetImage('graphics/rick.jpeg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          ListTile(
            title: Text('Item 1'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: null,
          ),
          ListTile(
            title: Text('Item 3'),
            onTap: null,
          ),
          ListTile(
            title: Text('Item 4'),
            onTap: null,
          ),
          ListTile(
            title: Text('Item 5'),
            onTap: null,
          ),
        ],
      ),
    );
  }
}

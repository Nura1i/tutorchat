import 'package:flutter/material.dart';

var _selectedOption;
void showMenuu(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Select an Option'),
        content: DropdownButton<String>(
          value: _selectedOption,
          onChanged: (newValue) {
            _selectedOption = newValue;
            Navigator.of(context).pop();
          },
          items: <String>[
            'Option 1',
            'Option 2',
            'Option 3',
          ].map<DropdownMenuItem<String>>(
            (String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            },
          ).toList(),
        ),
      );
    },
  );
}

class MyDelegate extends SliverPersistentHeaderDelegate {
  MyDelegate(this.tabBar);
  final TabBar tabBar;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      padding: const EdgeInsets.only(bottom: 2),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 0.3,
            color: Color.fromARGB(255, 232, 230, 230),
          ),
        ),
      ),
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class MenuItem {
  const MenuItem({
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;
}

abstract class MenuItems {
  static const List<MenuItem> firstItems = [logout, admin];
  // static const List<MenuItem> secondItems = [logout];

  static const logout = MenuItem(text: 'Log out', icon: Icons.logout);

  static const admin =
      MenuItem(text: 'Adminga yozish', icon: Icons.account_circle_outlined);

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(item.icon, color: Colors.black, size: 17),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            item.text,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  static void onChanged(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.logout:
        //Do something
        break;
      case MenuItems.admin:
        //Do something
        break;
    }
  }
}

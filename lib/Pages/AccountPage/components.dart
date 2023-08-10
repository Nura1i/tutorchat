import 'package:flutter/material.dart';

class GridViewPage extends StatelessWidget {
  final String title;

  const GridViewPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(20, (index) {
          return Container(
            color: Colors.blue,
            child: Center(
              child: Text(
                '$title Tile ${index + 1}',
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          );
        }),
      ),
    );
  }
}

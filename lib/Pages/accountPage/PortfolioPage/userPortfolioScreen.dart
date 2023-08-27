import 'package:flutter/material.dart';

import 'commponents.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => PportfolioScreenState();
}

class PportfolioScreenState extends State<PortfolioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          PopupMenuButton<String>(
            position: PopupMenuPosition.under,
            padding: const EdgeInsets.all(0),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            onSelected: (String value) {},
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<String>(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                value: 'option1',
                child: Row(
                  children: const [
                    Icon(Icons.delete_outline_outlined),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "O'chirish",
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
        centerTitle: true,
        title: const Text(
          'Portfolio',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
        ),
        foregroundColor: Colors.black,
      ),
      body: lsOfPortfolio(),
    );
  }
}

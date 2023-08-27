import 'package:flutter/material.dart';

Widget lsOfPortfolio() {
  return ListView.builder(
    physics: const BouncingScrollPhysics(),
    itemCount: 4,
    itemBuilder: (context, index) => Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              height: 55,
              width: 45,
              child: index % 2 == 0
                  ? Image.asset('assets/png/portfolio pdf.png')
                  : Image.asset('assets/png/portfolio file.png')),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              index % 2 == 0 ? 'About teacher' : 'Yutuqlari',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                width: 20,
                height: 22,
                child: Image.asset('assets/png/donwload icon.png')),
          )
        ],
      ),
    ),
  );
}

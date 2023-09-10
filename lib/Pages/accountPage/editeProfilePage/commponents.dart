import 'package:flutter/material.dart';
import 'package:tutorchat/extentions.dart';

import '../../../const.dart';

alertForLinks(BuildContext context) {
  TextEditingController tgLinkController =
      TextEditingController(text: profileDataConst!.telegram);
  TextEditingController inLinkController =
      TextEditingController(text: profileDataConst!.instagram);
  TextEditingController fkLinkController =
      TextEditingController(text: profileDataConst!.facebook);
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Column(
          children: [
            TextField(
              controller: tgLinkController,
              decoration: InputDecoration(
                prefixIconConstraints:
                    const BoxConstraints(minWidth: 30, maxHeight: 20),
                prefixIcon: SizedBox(
                    width: 30,
                    height: 20,
                    child: Image.asset(
                      'assets/png/telegramLogo.png',
                      fit: BoxFit.contain,
                    )),
                border: InputBorder.none,
                hintText: 'Telegram Link',
                hintStyle: TextStyle(color: '757575'.toColor()),
              ),
            ),
            const Divider(
              height: 2,
              // indent: 20,
              // endIndent: 20,
              thickness: 1,
            ),
            TextField(
              controller: inLinkController,
              decoration: InputDecoration(
                  prefixIconConstraints:
                      const BoxConstraints(maxWidth: 30, maxHeight: 20),
                  prefixIcon: SizedBox(
                      width: 30,
                      height: 20,
                      child: Image.asset(
                        'assets/png/instagramLogo.png',
                        fit: BoxFit.contain,
                      )),
                  border: InputBorder.none,
                  hintText: 'Instagram Link',
                  hintStyle: TextStyle(color: '757575'.toColor()),
                  contentPadding: const EdgeInsets.only(left: 20)),
            ),
            const Divider(
              height: 2,
              // indent: 20,
              // endIndent: 20,
              thickness: 1,
            ),
            TextField(
              controller: fkLinkController,
              decoration: InputDecoration(
                  prefixIconConstraints:
                      const BoxConstraints(maxWidth: 30, maxHeight: 20),
                  prefixIcon: SizedBox(
                      width: 30,
                      height: 20,
                      child: Image.asset(
                        'assets/png/facebookLogo.png',
                        fit: BoxFit.contain,
                      )),
                  border: InputBorder.none,
                  hintText: 'Facebook Link',
                  hintStyle: TextStyle(color: '757575'.toColor()),
                  contentPadding: const EdgeInsets.only(left: 20)),
            ),
            const Divider(
              height: 2,
              // indent: 20,
              // endIndent: 20,
              thickness: 1,
            ),
          ],
        ),
        titlePadding: const EdgeInsets.only(left: 10, right: 10),
        contentPadding: const EdgeInsets.only(left: 10, right: 10),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Perform the desired action
              Navigator.of(context).pop();
            },
            child: const Text('Save'),
          ),
        ],
      );
    },
  );
}

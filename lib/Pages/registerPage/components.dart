import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tutorchat/extentions.dart';
import 'package:image_picker/image_picker.dart';

Widget form(TextEditingController controller, String text) {
  return Stack(
    children: [
      Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.only(left: 10),
          height: 56,
          decoration: BoxDecoration(
            color: 'F5F5F5'.toColor(),
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: text,
                hintStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: '969696'.toColor())),
          )),
      const Positioned(
          top: 0,
          right: 0,
          child: TriangleContainer(
            color: Colors.grey,
          ))
    ],
  );
}

class TriangleContainer extends StatelessWidget {
  final Color? color;
  final double size;
  final Widget? child;

  const TriangleContainer({
    super.key,
    this.child,
    this.color,
    this.size = 50.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15,
      width: 15,
      child: CustomPaint(
        size: Size(size, size),
        painter: TrianglePainter(
          color: color,
        ),
        child: Align(
            alignment: Alignment.topRight,
            child: Icon(
              Icons.check,
              weight: 9,
              size: 9,
              color: 'F5F5F5'.toColor(),
            )),
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  final Color? color;
  final bool? isUp;

  TrianglePainter({this.color, this.isUp});

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();

    path.moveTo(0, 1);
    path.lineTo(size.width, 1);
    path.lineTo(size.width, size.height);

    path.close();

    final paint = Paint()..color = color!;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) => false;
}

Widget optional() {
  return Padding(
    padding: const EdgeInsets.only(left: 3),
    child: Text(
      'Optional',
      style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 13,
          color: '969696'.toColor(),
          fontFamily: 'OpenSans'),
    ),
  );
}

customContainer(String text, TextEditingController controller) {
  return Column(children: [
    const SizedBox(
      height: 20,
    ),
    Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: const EdgeInsets.only(left: 10),
        height: 56,
        decoration: BoxDecoration(
          color: const Color(0xff9B9B9B).withOpacity(0.15),
        ),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: text,
              hintStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: '969696'.toColor())),
        )),
  ]);
}

displayBottomSheet(BuildContext context, Function update) {
  showModalBottomSheet(
    context: context,
    elevation: 10,
    backgroundColor: Colors.grey,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40),
      ),
    ),
    builder: (ctx) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.08,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Icon Camera...!
              IconButton(
                  highlightColor: Colors.white,
                  iconSize: 40,
                  onPressed: () async {
                    await pickImageFromCamer(ctx, update);
                  },
                  icon: const Icon(Icons.camera_alt)),
              //SvgPicture.asset('assets/svg/camera.svg')),
              const SizedBox(
                width: 100,
              ),
              imagge != null
                  ? IconButton(
                      highlightColor: Colors.white,
                      iconSize: 40,
                      onPressed: () async {
                        imagge = null;
                        update();
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ))
                  : const SizedBox(),
              const SizedBox(
                width: 100,
              ),
              // Icon  Galalery...!
              IconButton(
                  iconSize: 40,
                  highlightColor: Colors.white,
                  onPressed: () async {
                    await pickImageFromGalery(ctx, update);
                    update;
                  },
                  icon: const Icon(
                    Icons.photo,
                  )
                  // icon: SvgPicture.asset(
                  //   'assets/svg/gallery.svg',
                  // ),
                  ),
            ],
          ),
        ),
      );
    },
  );
}

File? imagge;
Future pickImageFromGalery(ctx, update) async {
  try {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 60,
    );
    if (image == null) return;
    final imageTemp = File(image.path);
    imagge = imageTemp;
    update();
  } on Exception catch (e) {
    log('Failed to pick image: $e');
  }
  log(imagge.toString());
  Navigator.of(ctx).pop();
  return imagge;
}

Future pickImageFromCamer(ctx, update) async {
  try {
    final image = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 60,
    );
    if (image == null) return;
    final imageTemp = File(image.path);
    imagge = imageTemp;
    update();
  } on Exception catch (e) {
    log('Failed to pick image: $e');
  }
  log(imagge.toString());
  Navigator.of(ctx).pop();
  return imagge;
}

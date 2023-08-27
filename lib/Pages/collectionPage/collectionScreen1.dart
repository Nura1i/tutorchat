import 'package:flutter/material.dart';

class CollectionScreen1 extends StatefulWidget {
  const CollectionScreen1({Key? key}) : super(key: key);

  @override
  State<CollectionScreen1> createState() => _CollectionScreen1State();
}

class _CollectionScreen1State extends State<CollectionScreen1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 4.5, right: 15),
              child: SizedBox(
                width: 24,
                height: 24,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                    size: 24,
                    color: Colors.black,
                  ),
                ),
              ),
            )
          ],
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 4.5),
            child: Column(
              children: const [
                Text(
                  'To`plam',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                Text(
                  'soni ${10}',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      fontFamily: 'NotoSans',
                      color: Color(0xff9A9A9A)),
                ),
              ],
            ),
          ),
          leading: SizedBox(
            width: 44.42,
            height: 44.42,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                size: 24.23,
                color: Color(0xff130F26),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 10,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 9.0, left: 22, right: 22),
                  child: ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.only(bottom: 3.0),
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        )),
                        child: const Image(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/png/math.png'),
                        ),
                      ),
                    ),
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Matematika',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontFamily: 'NotoSans'),
                            ),
                            Text(
                              '${20} Videos ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Color(0xff9A9A9A),
                                  fontFamily: 'NotoSans'),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Image(
                              image: AssetImage('icon/video.png'),
                              width: 10,
                              height: 11.02,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                child: Row(
                              children: const [
                                Image(
                                  image: AssetImage('icon/likeicon.png'),
                                  width: 24,
                                  height: 24,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 4.0),
                                  child: Text(
                                    '${784}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color: Color(0xff468CE7),
                                        fontFamily: 'Open Sans'),
                                  ),
                                )
                              ],
                            )),
                            const Text(
                              '${1}k+',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: Color(0xff9A9A9A),
                                  fontFamily: 'Open Sans'),
                            ),
                            const Text(
                              '${850}+',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: Color(0xff9A9A9A),
                                  fontFamily: 'Open Sans'),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                                onTap: () {},
                                child: const Image(
                                  image: AssetImage('icon/diamondicon.png'),
                                  width: 14,
                                  height: 18.2,
                                )),
                            InkWell(
                                onTap: () {},
                                child: const Image(
                                  image: AssetImage('icon/commenticon.png'),
                                  width: 13,
                                  height: 14.31,
                                )),
                          ],
                        )
                      ],
                    ),
                    trailing: Container(
                        padding: const EdgeInsets.only(top: 30),
                        alignment: Alignment.bottomRight,
                        width: 10,
                        height: 17.34,
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                              size: 10,
                            ))),
                  ),
                );
              }),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              "assets/images/background.png",
              fit: BoxFit.cover,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Sign Ease",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 60,
                            fontStyle: FontStyle.italic,
                            shadows: [
                              Shadow(
                                color: Colors.black,
                                offset: Offset(2.0, 2.0),
                                blurRadius: 100.0,
                              ),
                            ]),
                        textAlign: TextAlign.left,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.settings,
                            size: 35,
                          ))
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    // burayla bi ilglenen
                    height: MediaQuery.of(context).size.height * 0.75,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(25)),
                      color: Colors.white.withOpacity(
                          0.5), // Opaklık değeri buradan ayarlanabilir
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildMenuButton(
                              iconData1: Icons.voice_chat,
                              iconData2: Icons.front_hand,
                              text: "From Voice to Sign Language"),
                          _buildMenuButton(
                              iconData1: Icons.abc,
                              iconData2: Icons.front_hand,
                              text: "From Sign Language to Text"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        elevation: 10,
                                      ),
                                      onPressed: () {},
                                      child: const Icon(
                                        Icons.cast_for_education,
                                        size: 50,
                                      )),
                                  const SizedBox(height: 12),
                                  const Text(
                                    "Education Mode",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        elevation: 10,
                                      ),
                                      onPressed: () {},
                                      child: const Icon(
                                        Icons.help_sharp,
                                        size: 50,
                                      )),
                                  const SizedBox(height: 12),
                                  const Text(
                                    "Help",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton({
    required IconData iconData1,
    required IconData iconData2,
    required String text,
  }) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            // Butona tıklandığında yapılacak işlemler
          },
          style: ElevatedButton.styleFrom(
            elevation: 10,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(iconData1, size: 50),
                const Icon(
                  Icons.change_circle_outlined,
                  size: 30,
                  color: Colors.black,
                ),
                Icon(iconData2, size: 50),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          text,
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        )
      ],
    );
  }

  Future _buildNavigateToPage(BuildContext context, {required Widget page}) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => page,
    ));
  }
}

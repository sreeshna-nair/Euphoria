import 'dart:math';

import 'package:euphoria/face%20_detection_package/views/cemeraface.dart';
import 'package:euphoria/questionPage.dart';
import 'package:flutter/material.dart';

class Selectpst extends StatefulWidget {
  const Selectpst({super.key});

  @override
  State<Selectpst> createState() => _SelectpstState();
}

class _SelectpstState extends State<Selectpst> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bg.jpg"), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const QuestionPage()));
                  },
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * .3,
                        height: MediaQuery.of(context).size.height * .14,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                image: AssetImage(
                                  "assets/images/Question.jpg",
                                ),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      const Text(
                        "Question",
                        style: TextStyle(
                            color: Color.fromRGBO(115, 79, 224, 1),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CameraPage())),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * .3,
                        height: MediaQuery.of(context).size.height * .14,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                image: AssetImage(
                                  "assets/images/camera.jpg",
                                ),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      const Text(
                        "camera",
                        style: TextStyle(
                            color: Color.fromRGBO(115, 79, 224, 1),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

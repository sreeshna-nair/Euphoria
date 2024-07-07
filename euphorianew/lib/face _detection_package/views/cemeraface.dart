import 'dart:io';

import 'package:euphoria/face%20_detection_package/service/faceMLservice.dart';
import 'package:euphoria/resultpage.dart';
import 'package:euphoria/snackbar/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  final ImagePicker _picker = ImagePicker();
  final GlobalKey<ScaffoldState> facekey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // Initialize the camera controller
    _initializeControllerFuture = _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    CameraDescription? frontCamera;

    for (final camera in cameras) {
      if (camera.lensDirection == CameraLensDirection.front) {
        frontCamera = camera;
        break;
      }
    }

    if (frontCamera != null) {
      _controller = CameraController(
        frontCamera,
        ResolutionPreset.medium,
      );

      // Next, initialize the controller. This returns a Future.
      return _controller.initialize();
    } else {
      // Handle the case where there's no front camera
      print('No front camera found');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: facekey,
      body: Column(
        children: [
          FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(_controller);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.11,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(width: 150),
                GestureDetector(
                  onTap: () async {
                    try {
                      final imagepath = await _controller.takePicture();

                      print('Picture saved to $imagepath');
                      // ignore: unnecessary_null_comparison
                      if (imagepath != null) {
                        addData(imagePath: imagepath.path);
                      }

                      // Future.delayed(const Duration(seconds: 1), () {
                      //   addData(imagePath: path.path);
                      // });
                    } catch (e) {
                      print('Error taking picture: $e');
                    }
                  },
                  child: Container(
                    width: 76.0,
                    height: 76.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: const Icon(
                      Icons.camera,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60),
                  child: InkWell(
                    onTap: () async {
                      final pickedFile =
                          await _picker.pickImage(source: ImageSource.gallery);
                      if (pickedFile != null) {
                        addData(imagePath: pickedFile.path);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      child: const Icon(
                        Icons.image,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> addData({
    required String imagePath,
  }) async {
    try {
      final response = await FaceMLservice(
        imageTaken: imagePath,
      );
      if (response.data.first.emotion == "Angry") {
        setState(() {
          snackBarWidget(
            response.data.first.emotion,
            Colors.white,
            Colors.white,
            Colors.green,
            5,
            facekey,
          ).then((value) =>
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const ResultPage(20),
              )));
        });
      } else if (response.data.first.emotion == "Fearful") {
        setState(() {
          snackBarWidget(
            response.data.first.emotion,
            Colors.white,
            Colors.white,
            Colors.green,
            5,
            facekey,
          ).then((value) =>
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const ResultPage(25),
              )));
        });
      } else if (response.data.first.emotion == "Neutral") {
        setState(() {
          snackBarWidget(
            response.data.first.emotion,
            Colors.white,
            Colors.white,
            Colors.green,
            5,
            facekey,
          ).then((value) =>
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const ResultPage(53),
              )));
        });
      } else if (response.data.first.emotion == "Happy") {
        setState(() {
          snackBarWidget(
            response.data.first.emotion,
            Colors.white,
            Colors.white,
            Colors.green,
            5,
            facekey,
          ).then((value) =>
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const ResultPage(69),
              )));
        });
      } else if (response.data.first.emotion == "Disgusted") {
        setState(() {
          snackBarWidget(
            response.data.first.emotion,
            Colors.white,
            Colors.white,
            Colors.green,
            5,
            facekey,
          ).then((value) =>
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const ResultPage(37),
              )));
        });
      } else if (response.data.first.emotion == "Sad") {
        setState(() {
          snackBarWidget(
            response.data.first.emotion,
            Colors.white,
            Colors.white,
            Colors.green,
            5,
            facekey,
          ).then((value) =>
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const ResultPage(40),
              )));
        });
      } else if (response.data.first.emotion == "Surprised") {
        setState(() {
          snackBarWidget(
            response.data.first.emotion,
            Colors.white,
            Colors.white,
            Colors.green,
            5,
            facekey,
          ).then((value) =>
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const ResultPage(85),
              )));
        });
      } else if (response.data.first.emotion == "Sad, Happy") {
        setState(() {
          snackBarWidget(
            response.data.first.emotion,
            Colors.white,
            Colors.white,
            Colors.green,
            5,
            facekey,
          ).then((value) =>
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const ResultPage(53),
              )));
        });
      }
      
       else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Failed to add data")));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}

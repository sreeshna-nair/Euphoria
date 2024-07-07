import 'dart:math';

import 'package:euphoria/JournalPage/view/journalpage.dart';
import 'package:euphoria/doctorspage/views/doctorsmainpage.dart';
import 'package:euphoria/hivemodel/journaldatamodel.dart';
import 'package:euphoria/musicpage1.dart';
import 'package:euphoria/userselectionpage.dart';
import 'package:euphoria/videopage.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.score});
  final int score;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Box? box1;
  @override
  void initState() {
    // TODO: implement initState
    openBox();
    super.initState();
  }

  void openBox() async {
    box1 = await Hive.openBox("logindata");
    setState(() {});
  }

  final List<String> quotes = [
    "The only way to do great work is to love what you do. - Steve Jobs",
    "Life is 10% what happens to us and 90% how we react to it. - Charles R. Swindoll",
    "Start where you are. Use what you have. Do what you can. - Arthur Ashe",
    "Success is not the key to happiness. Happiness is the key to success. - Albert Schweitzer",
    "Believe you can and you're halfway there. - Theodore Roosevelt",
    "The best time to plant a tree was 20 years ago. The second best time is now. - Chinese Proverb",
    "Your limitation—it’s only your imagination.",
    "Push yourself, because no one else is going to do it for you.",
    "Great things never come from comfort zones.",
    "Dream it. Wish it. Do it.",
    "Success doesn’t just find you. You have to go out and get it.",
    "The harder you work for something, the greater you’ll feel when you achieve it.",
    "Dream bigger. Do bigger.",
    "Don’t stop when you’re tired. Stop when you’re done.",
    "Wake up with determination. Go to bed with satisfaction.",
    "Do something today that your future self will thank you for.",
    "Little things make big days.",
    "It’s going to be hard, but hard does not mean impossible.",
    "Don’t wait for opportunity. Create it.",
    "Sometimes we’re tested not to show our weaknesses, but to discover our strengths.",
    "The key to success is to focus on goals, not obstacles.",
    "Dream it. Believe it. Build it.",
    "You are what you do, not what you say you’ll do.",
    "The only limit is your mind.",
    "Push yourself because no one else is going to do it for you.",
    "You don’t have to be great to start, but you have to start to be great.",
    "The only way to achieve the impossible is to believe it is possible.",
    "Don’t wait for opportunity. Create it.",
    "Sometimes we’re tested not to show our weaknesses, but to discover our strengths.",
    "The key to success is to focus on goals, not obstacles.",
    "Dream it. Believe it. Build it.",
    "You are what you do, not what you say you’ll do.",
    "The only limit is your mind.",
    "Push yourself because no one else is going to do it for you.",
    "You don’t have to be great to start, but you have to start to be great.",
    "The only way to achieve the impossible is to believe it is possible.",
    "Don’t wait for opportunity. Create it.",
    "Sometimes we’re tested not to show our weaknesses, but to discover our strengths.",
    "The key to success is to focus on goals, not obstacles.",
    "Dream it. Believe it. Build it.",
    "You are what you do, not what you say you’ll do.",
    "The only limit is your mind.",
    "Push yourself because no one else is going to do it for you.",
    "You don’t have to be great to start, but you have to start to be great.",
    "The only way to achieve the impossible is to believe it is possible."
  ];

  // Function to select a random quote
  String getRandomQuote() {
    final Random random = Random();
    return quotes[random.nextInt(quotes.length)];
  }

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
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () async {
                      final box = await Hive.openBox<AddShopData>('journal');
                      box.clear();
                      box1?.put("isLogged", false);
                      box1?.delete("username");
                      box1?.delete("id");
                      box1?.delete("email");
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const UserSelectionPage()));
                    },
                    child: const Icon(
                      Icons.logout,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    getRandomQuote(),
                    style: const TextStyle(
                      fontSize: 23,
                      color: Color.fromRGBO(115, 79, 224, 1),
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const Text(
              "Find a reason to smile\n             Every day",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(83, 56, 129, 1),
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Musicplayer(
                              score: widget.score,
                            )
                        // MusicApp(
                        //   score: widget.score,
                        // ),
                        ));
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                image: AssetImage(
                                  "assets/images/song.jpg",
                                ),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      const Text(
                        "Songs",
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
                      builder: (context) => Video(
                            score: widget.score,
                          ))),
                  child: Column(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                image: AssetImage(
                                  "assets/images/meditation.jpg",
                                ),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      const Text(
                        "Meditation",
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
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const JournalPage())),
                  child: Column(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                image: AssetImage(
                                  "assets/images/journal.jpg",
                                ),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      const Text(
                        "Journals",
                        style: TextStyle(
                            color: Color.fromRGBO(115, 79, 224, 1),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const DoctorsListPage()));
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                image: AssetImage(
                                  "assets/images/counsel.jpg",
                                ),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      const Text(
                        "Counselors",
                        style: TextStyle(
                            color: Color.fromRGBO(115, 79, 224, 1),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:video_player/video_player.dart';
// import 'package:http/http.dart' as http;

// // void main() => runApp(const VideoApp());

// /// Stateful widget to fetch and then display video content.
// class VideoApp extends StatefulWidget {
//   const VideoApp({super.key});

//   @override
//   _VideoAppState createState() => _VideoAppState();
// }

// class _VideoAppState extends State<VideoApp> {
//   late VideoPlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.networkUrl(Uri.parse(
//         'https://drive.google.com/uc?export=view&id=15QeaiyUQDL-ZGua9ST0phomE1QpQ610f'))
//       ..initialize().then((_) {
//         // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//         setState(() {});
//       });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Video Demo',
//       home: Scaffold(
//         body: Column(
//           children: [
//             const Text("videos"),
//             Center(
//               child: _controller.value.isInitialized
//                   ? AspectRatio(
//                       aspectRatio: 4 / 3,
//                       child: VideoPlayer(_controller),
//                     )
//                   : Container(),
//             ),
//           ],
//         ),
//         floatingActionButton: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             FloatingActionButton(
//               onPressed: () {
//                 setState(() {
//                   _controller.value.isPlaying
//                       ? _controller.pause()
//                       : _controller.play();
//                 });
//               },
//               child: Icon(
//                 _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//               ),
//             ),
//             const SizedBox(height: 20), // Provides space between the buttons
//             FloatingActionButton(
//               onPressed: _downloadVideo,
//               child: const Icon(Icons.download),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> _downloadVideo() async {
//     final status = await Permission.storage.request();
//     if (status.isGranted) {
//       final directory =
//           await getExternalStorageDirectory(); // Use getApplicationDocumentsDirectory() for iOS
//       final filePath = '${directory!.path}/downloaded_video.mp4';
//       final response = await http.get(Uri.parse(
//           'https://drive.google.com/uc?export=view&id=15QeaiyUQDL-ZGua9ST0phomE1QpQ610f'));
//       final file = File(filePath);
//       await file.writeAsBytes(response.bodyBytes);
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Video downloaded to $filePath'),
//         ),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Storage permission denied'),
//         ),
//       );
//     }
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:chewie/chewie.dart';
// import 'package:video_player/video_player.dart';

// class VideoPlayerScreen extends StatefulWidget {
//   //final DataToMediapages dataToMediapages;
//   const VideoPlayerScreen({
//     super.key,
//   });

//   @override
//   _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
// }

// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//   late VideoPlayerController _controller;
//   late ChewieController _chewieController;
//   List<String> links = [
//     "https://drive.google.com/uc?export=view&id=15QeaiyUQDL-ZGua9ST0phomE1QpQ610f",
//     "https://drive.google.com/uc?export=view&id=1QyZ8vh4Igx5uZObWPwa5tu22CVMHzohl",
//   ];
//   int currentVideoIndex = 0;
//   @override
//   void initState() {
//     super.initState();
//     // Replace 'video_url' with the URL of your video file.
//     initializePlayer();
//   }

//   void initializePlayer() {
//     _controller = VideoPlayerController.network(links[currentVideoIndex])
//       ..initialize().then((_) {
//         setState(() {}); // Rebuild the widget after video initialization
//       });
//     _chewieController = ChewieController(
//       videoPlayerController: _controller,
//       autoPlay: true,
//       looping: true,
//       materialProgressColors: ChewieProgressColors(
//         playedColor: Colors.redAccent,
//         handleColor: Colors.blue,
//         backgroundColor: Colors.grey,
//         bufferedColor: Colors.lightGreenAccent,
//       ),
//       placeholder: Container(
//         color: Colors.black,
//       ),
//       autoInitialize: true,
//     );
//   }

//   void changeVideo(int index) {
//     setState(() {
//       currentVideoIndex = index; // Update the current video index
//       _controller.dispose(); // Dispose the old controller
//       _chewieController.dispose();
//       initializePlayer(); // Initialize the new controller
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Video Player'),
//         centerTitle: true,
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       //extendBodyBehindAppBar: true,
//       body: Column(
//         children: [
//           Container(
//               color: Colors.transparent,
//               child: _controller.value.isInitialized
//                   ? AspectRatio(
//                       aspectRatio: 16 / 9,
//                       child: Chewie(
//                         controller: _chewieController,
//                       ),
//                     )
//                   : SizedBox(
//                       width: MediaQuery.sizeOf(context).width,
//                       height: 30,
//                       child: const Center(child: CircularProgressIndicator()))),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: GestureDetector(
//                   onTap: () {
//                     if (currentVideoIndex > 0) {
//                       changeVideo(currentVideoIndex - 1);
//                     }
//                   },
//                   child: Container(
//                       decoration: BoxDecoration(
//                           color: Colors.grey,
//                           borderRadius: BorderRadius.circular(10)),
//                       width: 50,
//                       height: 50,
//                       child: const Icon(
//                         Icons.arrow_left,
//                         color: Colors.black,
//                       )),
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   if (currentVideoIndex < links.length - 1) {
//                     changeVideo(currentVideoIndex + 1);
//                   }
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                       decoration: BoxDecoration(
//                           color: Colors.grey,
//                           borderRadius: BorderRadius.circular(10)),
//                       width: 50,
//                       height: 50,
//                       child: const Icon(
//                         Icons.arrow_right,
//                         color: Colors.black,
//                       )),
//                 ),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//     _chewieController.dispose();
//   }
// }

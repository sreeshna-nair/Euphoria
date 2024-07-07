import 'package:euphoria/model/videomodel.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Video extends StatefulWidget {
  final int score;

  const Video({Key? key, required this.score}) : super(key: key);

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  late VideoPlayerController _controller;
  late YoutubePlayerController controller;
  late int _currentIndex = -1;
  late List<VideoModel> _videosToPlay; // List of videos to play based on score
  bool isPlaying = false;
  double _sliderValue = 0.0;

  @override
  void initState() {
    super.initState();
    _initializeVideosToPlay();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _initializeVideosToPlay() {
    // Determine which list of videos to use based on the score
    // if (widget.score < 15) {
    //   _videosToPlay = [
    //     video1,
    //     video2,
    //     video3
    //   ]; // Use the video instances you defined
    // } else if (widget.score >= 15 && widget.score <= 30) {
    //   _videosToPlay = [
    //     video4,
    //     video5,
    //     video6
    //   ]; // You can change this based on your logic
    // } else {
    //   _videosToPlay = [
    //     video7,
    //     video8,
    //     video9
    //   ]; // You can change this based on your logic
    // }
    if (widget.score >= 85 && widget.score <= 100) {
      //Excited
      _videosToPlay = [
        video1,
        video2,
        video16,
      ];
    } else if (widget.score >= 69 && widget.score <= 84) {
      //Happy
      _videosToPlay = [
        video3,
        video4,
        video13,
      ];
    } else if (widget.score >= 53 && widget.score <= 68) {
      //Netral
      _videosToPlay = [
        video5,
        video6,
        video15,
      ];
    } else if (widget.score >= 37 && widget.score <= 52) {
      //sad
      _videosToPlay = [
        video7,
        video8,
        video12,
      ];
      // message = 'Sad';
      // messageColor = Colors.orange.shade700;
      //messageColor = Colors.green.shade200;
    } else {
      //stressed
      _videosToPlay = [
        video9,
        video10,
        video11,
      ];
      // message = 'Stressed';
      // messageColor = Colors.red.shade900;
    }
  }

  void _playVideo({required int index}) {
    setState(() {
      _currentIndex = index;
      isPlaying = true; // Start playing the video once selected
    });
    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(_videosToPlay[index].url)!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );

    // _controller = VideoPlayerController.network(_videosToPlay[index].url)
    //   ..addListener(() => setState(() {}))
    //   ..setLooping(true)
    //   ..initialize().then((_) {
    //     // Play the video automatically when initialized
    //     _controller.play();
    //   });

    // // Update slider value when the video position changes
    // _controller.addListener(() {
    //   setState(() {
    //     _sliderValue = _controller.value.position.inSeconds.toDouble();
    //   });
    // });
  }

  String _videoDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Video Player"),
          backgroundColor: Colors.blue.shade100,
        ),
        body: _currentIndex == -1 ? _buildVideoList() : _videoplayer()
        // _buildVideoPlayer(),
        );
  }

  Widget _buildVideoList() {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg.jpg"), fit: BoxFit.cover)),
      child: ListView.builder(
        itemCount: _videosToPlay.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => _playVideo(index: index),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.network(
                      _videosToPlay[index].thumbnail,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 200,
                    child: Column(
                      children: [
                        Text(
                          _videosToPlay[index].name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _videoplayer() {
    return YoutubePlayer(
      controller: controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.blueAccent,
    );
  }

  Widget _buildVideoPlayer() {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: Colors.blue.shade100,
            height: 300,
            child: _controller.value.isInitialized
                ? Column(
                    children: <Widget>[
                      SizedBox(
                        height: 200,
                        width: 500,
                        child: VideoPlayer(_controller),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ValueListenableBuilder<VideoPlayerValue>(
                            valueListenable: _controller,
                            builder: (context, value, child) {
                              return Text(
                                _videoDuration(value.position),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              );
                            },
                          ),
                          Flexible(
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  isPlaying
                                      ? _controller.pause()
                                      : _controller.play();
                                  isPlaying = !isPlaying;
                                });
                              },
                              icon: Icon(
                                isPlaying ? Icons.pause : Icons.play_arrow,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Slider(
                              value: _sliderValue,
                              min: 0.0,
                              max: _controller.value.duration.inSeconds
                                  .toDouble(),
                              onChanged: (value) {
                                _controller
                                    .seekTo(Duration(seconds: value.toInt()));
                                setState(() {
                                  _sliderValue = value;
                                });
                              },
                            ),
                          ),
                          Text(
                            _videoDuration(_controller.value.duration),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _videosToPlay.length,
            itemBuilder: (context, index) {
              if (index != _currentIndex) {
                return InkWell(
                  onTap: () => _playVideo(index: index),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.network(
                            _videosToPlay[index].thumbnail,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          _videosToPlay[index].name,
                          style: const TextStyle(fontSize: 25),
                        )
                      ],
                    ),
                  ),
                );
              } else {
                return Container(); // Hide the selected video from the list
              }
            },
          ),
        ),
      ],
    );
  }
}

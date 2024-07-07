import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Musicplayer extends StatefulWidget {
  const Musicplayer({Key? key, required this.score}) : super(key: key);
  final int score;
  @override
  State<Musicplayer> createState() => _MusicplayerState();
}

class _MusicplayerState extends State<Musicplayer> {
  late final AudioPlayer _player;
  bool isPlaying = false;
  int currentIndex = 0;

  late List<String> assetSongs = [];

  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();
    initializeSongsList();
    _player = AudioPlayer();
    _musicInit();
    _player.positionStream
        .listen((position) => setState(() => this.position = position));
    _player.durationStream
        .listen((duration) => setState(() => this.duration = duration!));
  }

  initializeSongsList() {
    if (widget.score >= 85 && widget.score <= 100) {
      assetSongs = [
        "assets/audios/Justin Bieber - Peaches ft. Daniel Caesar, Giveon.mp3",
        "assets/audios/The Weeknd - Save Your Tears (Official Music Video).mp3",
        "assets/audios/Glass Animals - Heat Waves.mp3",
        "assets/audios/Mark Ronson - Uptown Funk (Official Video) ft. Bruno Mars.mp3",
        "assets/audios/Olivia Rodrigo - good 4 u (Official Video).mp3",
      ];
    } else if (widget.score >= 69 && widget.score <= 84) {
      assetSongs = [
        "assets/audios/CAN'T STOP THE FEELING! (from DreamWorks Animation's _TROLLS_) (Official Video).mp3",
        "assets/audios/Lizzo - Good As Hell (Video).mp3",
        "assets/audios/Mark Ronson - Uptown Funk (Official Video) ft. Bruno Mars.mp3",
        "assets/audios/Pharrell Williams - Happy (Video).mp3",
        "assets/audios/WALK THE MOON - Shut Up and Dance (Official Video).mp3"
      ];
    } else if (widget.score >= 53 && widget.score <= 68) {
      assetSongs = [
        "assets/audios/Nicky Youre, dazy - Sunroof (Official Music Video).mp3",
        "assets/audios/Rema, Selena Gomez - Calm Down (Official Music Video).mp3",
        "assets/audios/The Kid LAROI, Justin Bieber - STAY (Official Video).mp3",
        "assets/audios/Harry Styles - As It Was (Official Video).mp3",
        "assets/audios/Glass Animals - Heat Waves (Official Video).mp3"
      ];
    } else if (widget.score >= 37 && widget.score <= 52) {
      assetSongs = [
        "assets/audios/Whitney Houston - I Wanna Dance with Somebody (Who Loves Me) (Official Lyric Video).mp3",
        "assets/audios/SZA - Good Days (Official Video).mp3",
        "assets/audios/Katrina And The Waves - Walking On Sunshine (Lyrics).mp3",
        "assets/audios/Dua Lipa - Don't Start Now (Official Music Video).mp3",
        "assets/audios/Dua Lipa - Levitating Featuring DaBaby (Official Music Video).mp3"
      ];
    } else {
      assetSongs = [
        "assets/audios/All alone.mp3",
        "assets/audios/find,me.mp3",
        "assets/audios/For you.mp3",
        "assets/audios/let it be.mp3",
      ];
    }
  }

  _musicInit() async {
    await _player.setAsset(assetSongs[currentIndex]);
    _player.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        _playNext();
      }
    });
  }

  _playerAction() {
    if (isPlaying) {
      _player.pause();
    } else {
      _player.play();
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  _playNext() async {
    if (currentIndex < assetSongs.length - 1) {
      currentIndex++;
      await _player.setAsset(assetSongs[currentIndex]);
      _player.play();
    } else {
      // If the last song is completed, stop playback
      _player.stop();
      setState(() {
        isPlaying = false;
        currentIndex = 0;
      });
    }
  }

  String _formatDuration(Duration duration) {
    String minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    String seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '${duration.inHours}:$minutes:$seconds';
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //title: const Text('Music Player'),
          ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bg.jpg"), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Card(
              //     child: Column(
              //       children: List.generate(
              //         assetSongs.length,
              //         (index) => ListTile(
              //           title: Text(assetSongs[index].split('/').last),
              //           onTap: () {
              //             currentIndex = index;
              //             _musicInit();
              //             _playerAction();
              //           },
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(11.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Center(
                          child: Card(
                            color: Colors.amber,
                            child: Icon(Icons.music_note, size: 250),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 25,
                            bottom: 10,
                            top: 10,
                          ),
                          child: Text(
                            assetSongs[currentIndex].split('/').last,
                            style: const TextStyle(fontSize: 15),
                          ),
                        ),
                        Slider(
                          value: position.inSeconds.toDouble(),
                          min: 0,
                          max: duration.inSeconds.toDouble(),
                          onChanged: (double value) {
                            _player.seek(Duration(seconds: value.toInt()));
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 25,
                            right: 25,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Display current time
                              Text(
                                _formatDuration(position),
                                style: const TextStyle(fontSize: 12),
                              ),
                              Text(
                                _formatDuration(duration),
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(width: 60),
                            IconButton(
                              onPressed: () {
                                // Back button logic
                                if (currentIndex > 0) {
                                  currentIndex--;
                                  _musicInit();
                                  _playerAction();
                                }
                              },
                              iconSize: 44,
                              icon: const Icon(Icons.skip_previous),
                            ),
                            Card(
                              shape: const CircleBorder(),
                              color: Colors.amber,
                              child: IconButton(
                                onPressed: () {
                                  _playerAction();
                                },
                                iconSize: 44,
                                icon: isPlaying
                                    ? const Icon(Icons.pause_circle)
                                    : const Icon(Icons.play_arrow),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                if (currentIndex < assetSongs.length - 1) {
                                  currentIndex++;
                                  _musicInit();
                                  _playerAction();
                                }
                              },
                              iconSize: 44,
                              icon: const Icon(Icons.skip_next),
                            ),
                            IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SlideUpPage(
                                      assetSongs: assetSongs,
                                      currentIndex: currentIndex,
                                      musicInit: _musicInit,
                                      playerAction: _playerAction,
                                    );
                                  },
                                );
                              },
                              iconSize: 40,
                              icon: const Icon(Icons.three_mp_outlined),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SlideUpPage extends StatelessWidget {
  final List<String> assetSongs;
  int currentIndex;
  final Function musicInit;
  final Function playerAction;

  SlideUpPage({
    super.key,
    required this.assetSongs,
    required this.currentIndex,
    required this.musicInit,
    required this.playerAction,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 300,
        child: Column(
          children: List.generate(
            assetSongs.length,
            (index) => ListTile(
              title: Text(assetSongs[index].split('/').last),
              onTap: () {
                // Perform actions using passed methods
                currentIndex = index;
                musicInit();
                playerAction();
              },
            ),
          ),
        ),
      ),
    );
  }
}

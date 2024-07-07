import 'dart:async';
import 'package:euphoria/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

class ResultPage extends StatefulWidget {
  final int score;

  const ResultPage(this.score, {super.key});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final ConfettiController _controller = ConfettiController();

  @override
  void initState() {
    super.initState();
    // Start confetti animation when the widget is initialized
    _controller.play();
    // Delay navigation to another page after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => MainPage(
                  score: widget.score,
                )),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    String message;
    Color messageColor;

    if (widget.score >= 85 && widget.score <= 100) {
      message = 'Excited';
      messageColor = Colors.green.shade900;
    } else if (widget.score >= 69 && widget.score <= 84) {  
      message = 'Happy';
      //messageColor = Colors.orange.shade700;
      messageColor = Colors.green.shade500;
    } else if (widget.score >= 53 && widget.score <= 68) {
      message = 'Neutral';
      //messageColor = Colors.orange.shade700;
      messageColor = Colors.green.shade200;
    } else if (widget.score >= 37 && widget.score <= 52) {
      message = 'Sad';
      messageColor = Colors.orange.shade700;
      //messageColor = Colors.green.shade200;
    } else {
      message = 'Stressed';
      messageColor = Colors.red.shade900;
    }

    return Scaffold(
      backgroundColor: Colors.blue.shade500,
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bg.jpg"), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Your Emotion is',
              style: TextStyle(fontSize: 20, color: messageColor),
            ),
            Text(
              message,
              style: TextStyle(fontSize: 20, color: messageColor),
            ),
            // ConfettiWidget(
            //   confettiController: _controller,
            //   blastDirection: -pi / 2,
            //   particleDrag: 0.05,
            //   emissionFrequency: 0.02,
            //   numberOfParticles: 20,
            //   gravity: 0.05,
            // )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose the confetti controller when the widget is disposed
    _controller.dispose();
    super.dispose();
  }
}

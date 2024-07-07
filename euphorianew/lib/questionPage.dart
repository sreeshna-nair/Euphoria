import 'package:euphoria/resultpage.dart';
import 'package:flutter/material.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class Question {
  final String questionText;
  final List<Map<String, dynamic>> answers;
  final int questionnumber;

  Question({
    required this.questionnumber,
    required this.questionText,
    required this.answers,
  });
}

final List<Question> _questions = [
  Question(
    questionText: "How interested did you feel over the past week?",
    answers: [
      {"answer": "Very slightly or not at all", "marks": 1},
      {"answer": "A little", "marks": 2},
      {"answer": "Moderately", "marks": 3},
      {"answer": "Quite a bit", "marks": 4},
      {"answer": "Extremely", "marks": 5}
    ],
    questionnumber: 1,
  ),
  Question(
    questionText: "How much distress did you experience over the past week?",
    answers: [
      {"answer": "Very slightly or not at all", "marks": 5},
      {"answer": "A little", "marks": 4},
      {"answer": "Moderately", "marks": 3},
      {"answer": "Quite a bit", "marks": 2},
      {"answer": "Extremely", "marks": 1}
    ],
    questionnumber: 2,
  ),
  Question(
    questionText:
        " . What level of excitement did you feel over the past week?   ",
    answers: [
      {"answer": "Very slightly or not at all", "marks": 1},
      {"answer": "A little", "marks": 2},
      {"answer": "Moderately", "marks": 3},
      {"answer": "Quite a bit", "marks": 4},
      {"answer": "Extremely", "marks": 5}
    ],
    questionnumber: 3,
  ),
  Question(
    questionText: ". How upset were you over the past week?",
    answers: [
      {"answer": "Very slightly or not at all", "marks": 5},
      {"answer": "A little", "marks": 4},
      {"answer": "Moderately", "marks": 3},
      {"answer": "Quite a bit", "marks": 2},
      {"answer": "Extremely", "marks": 1}
    ],
    questionnumber: 4,
  ),
  Question(
    questionText: "Over the past week, how strong did you feel?",
    answers: [
      {"answer": "Very slightly or not at all", "marks": 1},
      {"answer": "A little", "marks": 2},
      {"answer": "Moderately", "marks": 3},
      {"answer": "Quite a bit", "marks": 4},
      {"answer": "Extremely", "marks": 5}
    ],
    questionnumber: 5,
  ),
  Question(
    questionText: "How much guilt did you feel over the past week?",
    answers: [
      {"answer": "Very slightly or not at all", "marks": 5},
      {"answer": "A little", "marks": 4},
      {"answer": "Moderately", "marks": 3},
      {"answer": "Quite a bit", "marks": 2},
      {"answer": "Extremely", "marks": 1}
    ],
    questionnumber: 6,
  ),
  Question(
    questionText: "What level of fear did you experience over the past week?",
    answers: [
      {"answer": "Very slightly or not at all", "marks": 5},
      {"answer": "A little", "marks": 4},
      {"answer": "Moderately", "marks": 3},
      {"answer": "Quite a bit", "marks": 2},
      {"answer": "Extremely", "marks": 1}
    ],
    questionnumber: 7,
  ),
  Question(
    questionText: "How hostile did you feel over the past week?",
    answers: [
      {"answer": "Very slightly or not at all", "marks": 5},
      {"answer": "A little", "marks": 4},
      {"answer": "Moderately", "marks": 3},
      {"answer": "Quite a bit", "marks": 2},
      {"answer": "Extremely", "marks": 1}
    ],
    questionnumber: 8,
  ),
  Question(
    questionText: "How enthusiastic did you feel over the past week?",
    answers: [
      {"answer": "Very slightly or not at all", "marks": 1},
      {"answer": "A little", "marks": 2},
      {"answer": "Moderately", "marks": 3},
      {"answer": "Quite a bit", "marks": 4},
      {"answer": "Extremely", "marks": 5}
    ],
    questionnumber: 9,
  ),
  Question(
    questionText: "How much pride did you feel over the past week?",
    answers: [
      {"answer": "Very slightly or not at all", "marks": 1},
      {"answer": "A little", "marks": 2},
      {"answer": "Moderately", "marks": 3},
      {"answer": "Quite a bit", "marks": 4},
      {"answer": "Extremely", "marks": 5}
    ],
    questionnumber: 10,
  ),
  Question(
    questionText: "How irritable did you feel over the past week?",
    answers: [
      {"answer": "Very slightly or not at all", "marks": 5},
      {"answer": "A little", "marks": 4},
      {"answer": "Moderately", "marks": 3},
      {"answer": "Quite a bit", "marks": 2},
      {"answer": "Extremely", "marks": 1}
    ],
    questionnumber: 11,
  ),
  Question(
    questionText: "How alert were you over the past week?",
    answers: [
      {"answer": "Very slightly or not at all", "marks": 1},
      {"answer": "A little", "marks": 2},
      {"answer": "Moderately", "marks": 3},
      {"answer": "Quite a bit", "marks": 4},
      {"answer": "Extremely", "marks": 5}
    ],
    questionnumber: 12,
  ),
  Question(
    questionText: "How much shame did you feel over the past week?",
    answers: [
      {"answer": "Very slightly or not at all", "marks": 5},
      {"answer": "A little", "marks": 4},
      {"answer": "Moderately", "marks": 3},
      {"answer": "Quite a bit", "marks": 2},
      {"answer": "Extremely", "marks": 1}
    ],
    questionnumber: 13,
  ),
  Question(
    questionText: "How inspired did you feel over the past week?",
    answers: [
      {"answer": "Very slightly or not at all", "marks": 1},
      {"answer": "A little", "marks": 2},
      {"answer": "Moderately", "marks": 3},
      {"answer": "Quite a bit", "marks": 4},
      {"answer": "Extremely", "marks": 5}
    ],
    questionnumber: 14,
  ),
  Question(
    questionText: "How nervous were you over the past week?",
    answers: [
      {"answer": "Very slightly or not at all", "marks": 5},
      {"answer": "A little", "marks": 4},
      {"answer": "Moderately", "marks": 3},
      {"answer": "Quite a bit", "marks": 2},
      {"answer": "Extremely", "marks": 1}
    ],
    questionnumber: 15,
  ),
  Question(
    questionText: "How determined did you feel over the past week?",
    answers: [
      {"answer": "Very slightly or not at all", "marks": 1},
      {"answer": "A little", "marks": 2},
      {"answer": "Moderately", "marks": 3},
      {"answer": "Quite a bit", "marks": 4},
      {"answer": "Extremely", "marks": 5}
    ],
    questionnumber: 16,
  ),
  Question(
    questionText: "How attentive were you over the past week?",
    answers: [
      {"answer": "Very slightly or not at all", "marks": 1},
      {"answer": "A little", "marks": 2},
      {"answer": "Moderately", "marks": 3},
      {"answer": "Quite a bit", "marks": 4},
      {"answer": "Extremely", "marks": 5}
    ],
    questionnumber: 17,
  ),
  Question(
    questionText: "How restless did you feel over the past week?",
    answers: [
      {"answer": "Very slightly or not at all", "marks": 5},
      {"answer": "A little", "marks": 4},
      {"answer": "Moderately", "marks": 3},
      {"answer": "Quite a bit", "marks": 2},
      {"answer": "Extremely", "marks": 1}
    ],
    questionnumber: 18,
  ),
  Question(
    questionText: "What was your activity level over the past week?",
    answers: [
      {"answer": "Very slightly or not at all", "marks": 1},
      {"answer": "A little", "marks": 2},
      {"answer": "Moderately", "marks": 3},
      {"answer": "Quite a bit", "marks": 4},
      {"answer": "Extremely", "marks": 5}
    ],
    questionnumber: 19,
  ),
  Question(
    questionText: "How afraid were you over the past week?",
    answers: [
      {"answer": "Very slightly or not at all", "marks": 5},
      {"answer": "A little", "marks": 4},
      {"answer": "Moderately", "marks": 3},
      {"answer": "Quite a bit", "marks": 2},
      {"answer": "Extremely", "marks": 1}
    ],
    questionnumber: 20,
  ),
];

class _QuestionPageState extends State<QuestionPage> {
  final PageController _controller = PageController(initialPage: 0);
  final int _questionIndex = 0;
  int _score = 0;
  @override
  void initState() {}
  @override
  void dispose() {
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics:
            const NeverScrollableScrollPhysics(),
        controller: _controller,

        itemCount: _questions.length,
        itemBuilder: (context, index) {
          return Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/bg.jpg"),
                    fit: BoxFit.cover)),
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      "(${_questions[index].questionnumber.toString()})${_questions[index].questionText}",
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ..._questions[index].answers.map((answer) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * .8,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.lightBlue[200]),
                          onPressed: () {
                            // if (answer == _questions[index].correctAnswer) {
                            //   // Handle correct answer
                            // } else {
                            //   // Handle incorrect answer
                            // }
                            // final marks = int.parse(answer["marks"]);
                            // print("The marks=$marks");
                            _score = _score + (answer["marks"] as int);
                            print(_score);
                            if (index + 1 < _questions.length) {
                              _controller.nextPage(
                                duration: const Duration(milliseconds: 250),
                                curve: Curves.easeIn,
                              );
                            } else {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (context) =>  ResultPage(_score)
                              ));

                           
                            }
                          },
                          child: Text(
                            answer["answer"],
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          );
        },
      ),
    );
  }
}

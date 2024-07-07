import 'package:euphoria/blocs/getjournaldatabloc/bloc/getjournaldata_bloc.dart';
import 'package:euphoria/emotionaddmodule/views/emotionaddview.dart';

import 'package:euphoria/hivemodel/journaldatamodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
// Import your Hive model here

class JournalPage extends StatefulWidget {
  const JournalPage({super.key});

  @override
  State<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  late Box box;
  @override
  void initState() {
    // TODO: implement initState
    // createBox();
    final homescreenbloc = BlocProvider.of<GetjournaldataBloc>(context);
    homescreenbloc.add(const GetjournaldataEvent.getjournaldata());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
        title: const Text("Journal Page"),
      ),
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bg.jpg"), fit: BoxFit.cover)),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const EmotionPage()));
              },
              child: Container(
                width: 250,
                height: 60,
                decoration: BoxDecoration(
                  // Apply a linear gradient
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 131, 196, 249), // Start color
                      Color.fromARGB(255, 175, 211, 241), // End color
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(
                      30), // Optional: if you need rounded corners
                ),
                child: const Center(
                  child: Text(
                    'Click to enter your emotions',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            BlocBuilder<GetjournaldataBloc, GetjournaldataState>(
              builder: (context, state) {
                return state.whenOrNull(initial: () {
                      return const SizedBox();
                    }, sucess: (box) {
                      return Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: box.data.length,
                          itemBuilder: (context, index) {
                            // Get the data at the current index
                            return

                                // ListTile(
                                //   title: Text(shopData!.data),
                                //   subtitle: Text('Rating: ${shopData.rating.toString()}'),
                                //   // Display images or other information as needed
                                // );
                                Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width,
                                //height: MediaQuery.sizeOf(context).height * .1,
                                color: Colors.grey[100],
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          RatingIconWidget(
                                            rating: double.parse(
                                                box.data[index].rating),
                                          ),
                                          Text((box.data[index].date))
                                        ],
                                      ),
                                      const Text("Reason"),
                                      Text(box.data[index].desc),
                                      //shopData.reasons.map((e) => Text(e)).tolist()
                                    ]),
                              ),
                            );
                          },
                        ),
                      );
                    }, error: () {
                      return const Center(
                        child: Text("error"),
                      );
                    }) ??
                    const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> createBox() async {
    box = Hive.box<AddShopData>('shopData');
  }
}

class RatingIconWidget extends StatelessWidget {
  final double rating;

  const RatingIconWidget({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconData iconData;
    Color iconColor;

    // Determine the icon and color based on the rating value
    switch (rating.round()) {
      case 0:
        iconData = Icons.sentiment_very_dissatisfied;
        iconColor = Colors.red;
        break;
      case 1:
        iconData = Icons.sentiment_dissatisfied;
        iconColor = Colors.redAccent;
        break;
      case 2:
        iconData = Icons.sentiment_neutral;
        iconColor = Colors.amber;
        break;
      case 3:
        iconData = Icons.sentiment_satisfied;
        iconColor = Colors.lightGreen;
        break;
      case 4:
        iconData = Icons.sentiment_very_satisfied;
        iconColor = Colors.green;
        break;
      case 5:
        iconData = Icons.star;
        iconColor = Colors.blue;
        break;
      default:
        iconData = Icons.sentiment_very_dissatisfied;
        iconColor = Colors.grey;
    }

    return Icon(
      iconData,
      color: iconColor,
      size: 48.0,
    );
  }
}

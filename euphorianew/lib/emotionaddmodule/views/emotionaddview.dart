import 'package:euphoria/emotionaddmodule/service/emotionadd.dart';
import 'package:euphoria/hivemodel/journaldatamodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';

enum EmotionalSituations {
  StressfulWork,
  LosingSomethingImportant,
  WatchingASunset,
  ListeningToMusic,
  SpendingTimeWithLovedOnes,
  Exercising
}

class EmotionPage extends StatefulWidget {
  const EmotionPage({super.key});

  @override
  State<EmotionPage> createState() => _EmotionPageState();
}

class _EmotionPageState extends State<EmotionPage> {
  final List<String> _situations = [
    "StressfulWork",
    "LosingSomethingImportant",
    " WatchingASunset",
    " ListeningToMusic",
    " SpendingTimeWithLovedOnes",
    " Exercising"
  ];
  final List<String> _selectedlist = [];
  TextEditingController datacontroller = TextEditingController();
  double ratevalue = 0;
  String selectedDate = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/bg.jpg"),
                  fit: BoxFit.cover)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              TextButton(
                onPressed: () {},
                child: const Text("Mood journal"),
              ),
              const Text("How are you feeling?"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RatingBar.builder(
                  initialRating: 3,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    switch (index) {
                      case 0:
                        return const Icon(
                          Icons.sentiment_very_dissatisfied,
                          color: Colors.red,
                        );
                      case 1:
                        return const Icon(
                          Icons.sentiment_dissatisfied,
                          color: Colors.redAccent,
                        );
                      case 2:
                        return const Icon(
                          Icons.sentiment_neutral,
                          color: Colors.amber,
                        );
                      case 3:
                        return const Icon(
                          Icons.sentiment_satisfied,
                          color: Colors.lightGreen,
                        );
                      case 4:
                        return const Icon(
                          Icons.sentiment_very_satisfied,
                          color: Colors.green,
                        );
                      default:
                        return const SizedBox();
                    }
                  },
                  onRatingUpdate: (rating) {
                    print(rating);
                    setState(() {
                      ratevalue = rating;
                    });
                  },
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text("Select your Date"),
                IconButton(
                    onPressed: () {
                      _selectDate(context);
                    },
                    icon: const Icon(Icons.calendar_today))
              ]),
              // const Text("Select the reasons for your mood"),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: MultiSelectDialogField(
              //     decoration: BoxDecoration(color: Colors.pink[100]),
              //     items: _situations
              //         .map((e) => MultiSelectItem(
              //             e, e.toString().split('.').last.replaceAll('_', ' ')))
              //         .toList(),
              //     listType: MultiSelectListType.CHIP,
              //     onConfirm: (values) {
              //       _selectedlist = values;
              //     },
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: datacontroller,
                  maxLines: 10,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Write about your emotions"),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    try {
                      final response = Emotionadd(
                          description: datacontroller.text,
                          rating: ratevalue.toString(),
                          date: selectedDate);
                      if (response == "User rating added successfully") {
                        setState(() {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Sucessfull")));
                        });
                        Navigator.of(context).pop();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Error")));
                      }
                      final box = Hive.box<AddShopData>('shopData');
                      final newShopData = AddShopData(
                        data: datacontroller.text,
                        reasons: _selectedlist,
                        rating: ratevalue,
                        datevalue: selectedDate,
                      );
                      box.add(newShopData).then((value) {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      });
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: const Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime
          .now(), // Use the current date as the initial date if `selectedDate` is null
      firstDate: DateTime(2000), // Set the earliest possible date
      lastDate: DateTime(2025), // Set the latest possible date
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
      print(formattedDate);
      setState(() {
        selectedDate = formattedDate;
      });
    }
  }
}

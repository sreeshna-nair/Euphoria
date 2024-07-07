import 'package:euphoria/doctorspage/service/booking_service.dart';
import 'package:euphoria/doctorspage/service/doc_list_service.dart';
import 'package:euphoria/doctorspage/views/doctorsskotlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DoctorsListPage extends StatefulWidget {
  const DoctorsListPage({super.key});

  @override
  State<DoctorsListPage> createState() => _DoctorsListPageState();
}

class _DoctorsListPageState extends State<DoctorsListPage> {
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/bg.jpg"),
                  fit: BoxFit.cover)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .04,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const DoctorsslotListPage()));
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
                      'Click to view slot booking list',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .04,
              ),
              const Text(
                "Doctors List",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              Expanded(
                child: FutureBuilder(
                  future: doclistservice(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasError) {
                        return const Center(
                          child: Icon(
                            Icons.error,
                            color: Colors.red,
                            size: 25,
                          ),
                        );
                      } else if (snapshot.data!.data.isNotEmpty) {
                        return ListView.builder(
                          itemCount: snapshot.data?.data.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width,
                                height: MediaQuery.sizeOf(context).height * .29,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 165, 203, 233)),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[100],
                                ),
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            snapshot.data!.data[index].name
                                                .toString(),
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                          Text(
                                            snapshot.data!.data[index].place
                                                .toString(),
                                            style: const TextStyle(
                                              color: Colors.black,
                                              //fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            ),
                                          ),
                                          Text(
                                            snapshot.data!.data[index]
                                                .specialization
                                                .toString(),
                                            style: const TextStyle(
                                              color: Colors.black,
                                              //fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            ),
                                          ),
                                          Text(
                                            "Starttime=${snapshot.data!.data[index].startTime.toString()}",
                                            style: const TextStyle(
                                              color: Colors.black,
                                              // fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            ),
                                          ),
                                          Text(
                                            "EndTime=${snapshot.data!.data[index].endTime.toString()}",
                                            style: const TextStyle(
                                              color: Colors.black,
                                              // fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            ),
                                          ),
                                          Text(
                                            snapshot.data!.data[index].phn
                                                .toString(),
                                            style: const TextStyle(
                                              color: Colors.black,
                                              //fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  _showDateTimePicker();
                                                },
                                                child: const Icon(
                                                    Icons.calendar_today),
                                              ), // Calendar Icon
                                              const SizedBox(width: 8),
                                              TextButton(
                                                onPressed: () {
                                                  _showDateTimePicker();
                                                },
                                                child: const Text(
                                                    'Select Date and Time'),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        .5,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  bookdoc(
                                                    doctorid: snapshot
                                                        .data!.data[index].id
                                                        .toString(),
                                                    time: timeController.text,
                                                    date: dateController.text,
                                                  );
                                                },
                                                child: Container(
                                                  width: 100,
                                                  height: 26,
                                                  decoration: BoxDecoration(
                                                    // Apply a linear gradient
                                                    gradient:
                                                        const LinearGradient(
                                                      colors: [
                                                        Color.fromARGB(
                                                            255,
                                                            131,
                                                            196,
                                                            249), // Start color
                                                        Color.fromARGB(
                                                            255,
                                                            175,
                                                            211,
                                                            241), // End color
                                                      ],
                                                      begin:
                                                          Alignment.centerLeft,
                                                      end:
                                                          Alignment.centerRight,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30), // Optional: if you need rounded corners
                                                  ),
                                                  child: const Center(
                                                    child: Text(
                                                      'book slot',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: SpinKitRotatingCircle(
                          color: Colors.red,
                          size: 50.0,
                        ),
                      );
                    }
                    return const Center(
                      child: Text(
                        "There is no bookings",
                        style: TextStyle(fontSize: 15),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showDateTimePicker() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        setState(() {
          dateController.text = pickedDate.toString();
          timeController.text = pickedTime.format(context);
        });
      }
    }
  }

  dialogbox({required String image, required String name, required String id}) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Connect with Doctor'),
          content: const Text('Do you want to connect with this doctor?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                // Add your logic here to connect with the doctor

                // Navigator.of(context).pop();
                // Navigator.of(context).pop();
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  Future<void> bookdoc({
    required String doctorid,
    required String time,
    required String date,
  }) async {
    try {
      final response = await doc_bk_service(
        doctorid: doctorid,
        time: time,
        date: date,
      );
      if (response.status == "Doctor booked successfully") {
        setState(() {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Sucessfully booked ")));
        });
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Failed to add data")));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}

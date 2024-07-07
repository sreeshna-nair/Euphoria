import 'package:euphoria/doctorspage/service/user_bklist_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DoctorsslotListPage extends StatefulWidget {
  const DoctorsslotListPage({super.key});

  @override
  State<DoctorsslotListPage> createState() => _DoctorsslotListPageState();
}

class _DoctorsslotListPageState extends State<DoctorsslotListPage> {
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
              const Text(
                "Slot Book List",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              Expanded(
                child: FutureBuilder(
                  future: doc_bklist_service(),
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
                            return InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width,
                                  height:
                                      MediaQuery.sizeOf(context).height * .19,
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
                                              snapshot
                                                  .data!.data[index].doctorName
                                                  .toString(),
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                            Text(
                                              "Date:${snapshot.data!.data[index].date.toString()}",
                                              style: const TextStyle(
                                                color: Colors.black,
                                                //fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),
                                            ),
                                            Text(
                                              "Time:${snapshot.data!.data[index].time.toString()}",
                                              style: const TextStyle(
                                                color: Colors.black,
                                                //fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          .25,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    _makePhoneCall(
                                                        snapshot
                                                            .data!
                                                            .data[index]
                                                            .doctorPhn,
                                                        context);
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
                                                        begin: Alignment
                                                            .centerLeft,
                                                        end: Alignment
                                                            .centerRight,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30), // Optional: if you need rounded corners
                                                    ),
                                                    child: const Center(
                                                      child: Text(
                                                        'Call',
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _makePhoneCall(String phoneNumber, BuildContext context) async {
    try {
      await FlutterPhoneDirectCaller.callNumber(phoneNumber);
    } catch (e) {
      // Handle any errors that occur during the call process
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error: Unable to initiate the call.'),
        ),
      );
      print('Error: $e');
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
}

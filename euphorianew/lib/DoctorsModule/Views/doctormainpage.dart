import 'package:euphoria/DoctorsModule/service/accept_service.dart';
import 'package:euphoria/DoctorsModule/service/doctor_view_bookings_service.dart';
import 'package:euphoria/DoctorsModule/service/reject_service.dart';
import 'package:euphoria/DoctorsModule/service/search_service.dart';
import 'package:euphoria/PatientSearchModule/Views/patientdetailsPage.dart';
import 'package:euphoria/patientdetailentermodule/views/patienterdetailpage.dart';
import 'package:euphoria/userselectionpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive/hive.dart';

class DoctorsMainPage extends StatefulWidget {
  const DoctorsMainPage({
    super.key,
  });

  @override
  State<DoctorsMainPage> createState() => _DoctorsMainPageState();
}

class _DoctorsMainPageState extends State<DoctorsMainPage> {
  final TextEditingController searchController = TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .04,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
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
              //  PatientsearchPage

              Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .057,
                  width: MediaQuery.of(context).size.width * .9,
                  child: Center(
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: 'Search to view Patient Previous data',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {
                            searchcomplete(
                              id: searchController.text.trim(),
                            );
                          },
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.height * .01),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * .04,
              ),
              const Text(
                "Patients List",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              Expanded(
                child: FutureBuilder(
                  future: doctor_view_bookings_service(),
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
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * .26,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 165, 203, 233),
                                  ),
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
                                            "ID NO=${snapshot.data!.data[index].id}",
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                          Text(
                                            snapshot.data!.data[index].userName
                                                .toString(),
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                          Text(
                                            "patient : ${snapshot.data!.data[index].userId.toString()}",
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                            ),
                                          ),
                                          Text(
                                            snapshot.data!.data[index].userPhn
                                                .toString(),
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                            ),
                                          ),
                                          Text(
                                            snapshot.data!.data[index].userEmail
                                                .toString(),
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                            ),
                                          ),
                                          Text(
                                            "Time : ${snapshot.data!.data[index].time.toString()}",
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .01,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .30,
                                              ),
                                              snapshot.data!.data[index].status
                                                          .toString() ==
                                                      "pending"
                                                  ? Row(
                                                      children: [
                                                        SizedBox(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              .03,
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              .23,
                                                          child: ElevatedButton(
                                                            onPressed: () {
                                                              accept(
                                                                id: snapshot
                                                                    .data!
                                                                    .data[index]
                                                                    .id
                                                                    .toString(),
                                                              );
                                                            },
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              foregroundColor:
                                                                  Colors.white,
                                                              backgroundColor:
                                                                  Colors
                                                                      .blue, // Change text color here

                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20), // Adjust the value as needed
                                                              ),
                                                            ),
                                                            child: const Center(
                                                              child: Text(
                                                                'Accept',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10),
                                                              ),
                                                            ),
                                                          ),
                                                        ),

                                                        SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              .01,
                                                        ),
                                                        // reject button
                                                        SizedBox(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              .03,
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              .23,
                                                          child: ElevatedButton(
                                                            onPressed: () {
                                                              reject(
                                                                bookingid: snapshot
                                                                    .data!
                                                                    .data[index]
                                                                    .id
                                                                    .toString(),
                                                              );
                                                            },
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              foregroundColor:
                                                                  Colors.white,
                                                              backgroundColor:
                                                                  Colors
                                                                      .blue, // Change text color here
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          15,
                                                                      vertical:
                                                                          5),
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20), // Adjust the value as needed
                                                              ),
                                                            ),
                                                            child: const Text(
                                                              'Reject',
                                                              style: TextStyle(
                                                                  fontSize: 12),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  : const SizedBox(),
                                              // button flag change checking
                                              snapshot.data!.data[index].status
                                                          .toString() ==
                                                      "confirmed"
                                                  ? GestureDetector(
                                                      onTap: () {
                                                        Navigator.of(context)
                                                            .push(
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                Doctorsdetailsaddpage(
                                                              id: snapshot
                                                                  .data!
                                                                  .data[index]
                                                                  .id
                                                                  .toString(),
                                                              name: snapshot
                                                                  .data!
                                                                  .data[index]
                                                                  .userName
                                                                  .toString(),
                                                              location: snapshot
                                                                  .data!
                                                                  .data[index]
                                                                  .userPlace
                                                                  .toString(),
                                                              phoneno: snapshot
                                                                  .data!
                                                                  .data[index]
                                                                  .userPhn
                                                                  .toString(),
                                                              userid: snapshot
                                                                  .data!
                                                                  .data[index]
                                                                  .userId
                                                                  .toString(),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: Container(
                                                        width: 100,
                                                        height: 26,
                                                        decoration:
                                                            BoxDecoration(
                                                          gradient:
                                                              const LinearGradient(
                                                            colors: [
                                                              Color.fromARGB(
                                                                  255,
                                                                  131,
                                                                  196,
                                                                  249),
                                                              Color.fromARGB(
                                                                  255,
                                                                  175,
                                                                  211,
                                                                  241),
                                                            ],
                                                            begin: Alignment
                                                                .centerLeft,
                                                            end: Alignment
                                                                .centerRight,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                        ),
                                                        child: const Center(
                                                          child: Text(
                                                            'Enter Details',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  : const SizedBox()
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

  Future<void> searchcomplete({
    required String id,
  }) async {
    try {
      final response = await search_user_service(
        userid: id,
      );
      print("response is=$response");
      if (response == response) {
        setState(() {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Sucessfull ")));
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PatientsearchPage(
              user: response.data.first.userName,
              note: response.data.first.note,
              phone: response.data.first.userPhn,
              email: response.data.first.userEmail, data: response, 
            ),
          ));
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to add data")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  Future<void> accept({
    required String id,
  }) async {
    try {
      final response = await accept_service(
        bookingid: id,
      );
      print("response is=$response");
      if (response.status == "Booking confirmed successfully") {
        setState(() {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Sucessfull ")));
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to add data")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  Future<void> reject({
    required String bookingid,
  }) async {
    try {
      final response = await reject_service(
        bookingid: bookingid,
      );
      print("response is=$response");
      if (response.status == "Booking deleted successfully") {
        setState(() {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Sucessfull ")));
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to add data")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }
}

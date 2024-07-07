import 'package:euphoria/counselorRegister/Service/counselreg.dart';
import 'package:euphoria/mainpage.dart';
import 'package:euphoria/questionPage.dart';
import 'package:flutter/material.dart';

class CounselorRegPage extends StatefulWidget {
  const CounselorRegPage({super.key});

  @override
  State<CounselorRegPage> createState() => _CounselorRegPageState();
}

class _CounselorRegPageState extends State<CounselorRegPage> {
  TimeOfDay selectedTime = TimeOfDay.now();

  TextEditingController starttimecontroller = TextEditingController();
  TextEditingController stopTimecontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonenocontroller = TextEditingController();
  TextEditingController placecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController qualificationcontroller = TextEditingController();
  TextEditingController experiencecontroller = TextEditingController();
  TextEditingController specificationcontroller = TextEditingController();
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null) {
      setState(() {
        starttimecontroller.text = picked.format(context);
      });
    }
  }

  Future<void> _selectTime2(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null) {
      setState(() {
        stopTimecontroller.text = picked.format(context);
      });
    }
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * .8,
                height: MediaQuery.sizeOf(context).height * .06,
                child: TextField(
                  controller: usernamecontroller,
                  decoration: InputDecoration(
                      hintText: "Username",
                      hintStyle: const TextStyle(
                        color: Colors.white,
                      ),
                      fillColor: const Color.fromRGBO(179, 138, 204, 1),
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * .8,
                height: MediaQuery.sizeOf(context).height * .06,
                child: TextField(
                  controller: emailcontroller,
                  decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: const TextStyle(
                        color: Colors.white,
                      ),
                      fillColor: const Color.fromRGBO(179, 138, 204, 1),
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * .8,
                height: MediaQuery.sizeOf(context).height * .06,
                child: TextField(
                  controller: phonenocontroller,
                  decoration: InputDecoration(
                      hintText: "PhoneNumber",
                      hintStyle: const TextStyle(
                        color: Colors.white,
                      ),
                      fillColor: const Color.fromRGBO(179, 138, 204, 1),
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * .8,
                height: MediaQuery.sizeOf(context).height * .06,
                child: TextField(
                  controller: placecontroller,
                  decoration: InputDecoration(
                      hintText: "Place",
                      hintStyle: const TextStyle(
                        color: Colors.white,
                      ),
                      fillColor: const Color.fromRGBO(179, 138, 204, 1),
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * .8,
                height: MediaQuery.sizeOf(context).height * .06,
                child: TextField(
                  controller: passwordcontroller,
                  decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: const TextStyle(
                        color: Colors.white,
                      ),
                      fillColor: const Color.fromRGBO(179, 138, 204, 1),
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * .8,
                height: MediaQuery.sizeOf(context).height * .06,
                child: TextField(
                  controller: qualificationcontroller,
                  decoration: InputDecoration(
                      hintText: "Qualification",
                      hintStyle: const TextStyle(
                        color: Colors.white,
                      ),
                      fillColor: const Color.fromRGBO(179, 138, 204, 1),
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * .8,
                height: MediaQuery.sizeOf(context).height * .06,
                child: TextField(
                  controller: experiencecontroller,
                  decoration: InputDecoration(
                      hintText: "Experience",
                      hintStyle: const TextStyle(
                        color: Colors.white,
                      ),
                      fillColor: const Color.fromRGBO(179, 138, 204, 1),
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * .8,
                height: MediaQuery.sizeOf(context).height * .06,
                child: TextField(
                  controller: specificationcontroller,
                  decoration: InputDecoration(
                      hintText: "Specialisation",
                      hintStyle: const TextStyle(
                        color: Colors.white,
                      ),
                      fillColor: const Color.fromRGBO(179, 138, 204, 1),
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * .8,
                height: MediaQuery.sizeOf(context).height * .06,
                child: TextField(
                  controller: starttimecontroller,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      prefixIcon: IconButton(
                        icon: const Icon(
                          Icons.access_time,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          _selectTime(context);
                        },
                      ),
                      hintText: "Start Time",
                      //labelText: "Starttime",
                      hintStyle: const TextStyle(
                        color: Colors.white,
                      ),
                      fillColor: const Color.fromRGBO(179, 138, 204, 1),
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20))),
                  readOnly: true,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * .8,
                height: MediaQuery.sizeOf(context).height * .06,
                child: TextField(
                  controller: stopTimecontroller,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      prefixIcon: IconButton(
                        icon: const Icon(
                          Icons.access_time,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          _selectTime2(context);
                        },
                      ),
                      hintText: "Stop Time",
                      //labelText: "Starttime",
                      hintStyle: const TextStyle(
                        color: Colors.white,
                      ),
                      fillColor: const Color.fromRGBO(179, 138, 204, 1),
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20))),
                  readOnly: true,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: const Color.fromRGBO(179, 138, 204, 1),
                      ),
                      onPressed: () {
                        adddata(
                            email: emailcontroller.text,
                            name: usernamecontroller.text,
                            number: phonenocontroller.text,
                            place: placecontroller.text,
                            password: passwordcontroller.text,
                            qualification: qualificationcontroller.text,
                            experience: experiencecontroller.text,
                            specialisation: specificationcontroller.text,
                            starttime: starttimecontroller.text,
                            endtime: stopTimecontroller.text);
                      },
                      child: const Text(
                        "sign up",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> adddata(
      {required String name,
      required String email,
      required String number,
      required String place,
      required String password,
      required String qualification,
      required String experience,
      required String specialisation,
      required String starttime,
      required String endtime}) async {
    try {
      final response = await DoctorReg(
          email: email,
          password: password,
          place: place,
          username: name,
          phoneno: number,
          qualification: qualification,
          experience: experience,
          specification: specialisation,
          Starttime: starttime,
          Endtime: endtime);
      if (response.status == "Doctor registered successfully") {
        setState(() {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Sucessfully Reg")));
        });
        Navigator.of(context).pop();
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

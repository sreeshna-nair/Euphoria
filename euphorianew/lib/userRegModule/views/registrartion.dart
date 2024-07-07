import 'package:euphoria/mainpage.dart';
import 'package:euphoria/questionPage.dart';
import 'package:euphoria/userRegModule/service/userregservice.dart';


import 'package:flutter/material.dart';

class UserRegistrationPage extends StatefulWidget {
  const UserRegistrationPage({super.key});

  @override
  State<UserRegistrationPage> createState() => _UserRegistrationPageState();
}

class _UserRegistrationPageState extends State<UserRegistrationPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController phonenoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bg.jpg"), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width * .8,
              height: MediaQuery.sizeOf(context).height * .06,
              child: TextField(
                controller: usernameController,
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
                controller: emailController,
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
                controller: phonenoController,
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
                controller: placeController,
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
                controller: passwordController,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: const Color.fromRGBO(179, 138, 204, 1),
                    ),
                    onPressed: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) => const QuestionPage(),
                      // ));
                      adddata(
                        email: emailController.text,
                        name: usernameController.text,
                        number: phonenoController.text,
                        password: passwordController.text,
                        place: placeController.text,
                      );
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
    );
  }

  Future<void> adddata(
      {required String name,
      required String email,
      required String number,
      required String password,
      required String place}) async {
    try {
      final response = await UserReg(
          name: name,
          phonenumber: number,
          email: email,
          password: password,
          place: place);
      if (response.status == "User registered successfully") {
        setState(() {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Sucessfully Registered")));
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

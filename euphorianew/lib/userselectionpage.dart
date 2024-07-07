import 'package:euphoria/counselorlogin/views/counselorlogin.dart';
import 'package:euphoria/UserLogin/Views/loginpage.dart';
import 'package:flutter/material.dart';

class UserSelectionPage extends StatelessWidget {
  const UserSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/calm.jpg"), fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width * .7,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  backgroundColor: const Color.fromRGBO(110, 56, 79, 1),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ));
                },
                child: const Text(
                  "User",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * .7,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  backgroundColor: const Color.fromRGBO(110, 56, 79, 1),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const CounselorLoginPage(),
                  ));
                },
                child: const Text(
                  "Counselor",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
          ),
        ],
      ),
    );
  }
}

import 'package:euphoria/counselorRegister/Views/counselReg.dart';
import 'package:euphoria/DoctorsModule/Views/doctormainpage.dart';
import 'package:euphoria/counselorlogin/service/conselorservice.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CounselorLoginPage extends StatefulWidget {
  const CounselorLoginPage({super.key});

  @override
  State<CounselorLoginPage> createState() => _CounselorLoginPageState();
}

class _CounselorLoginPageState extends State<CounselorLoginPage> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  late Box box2;
  @override
  void initState() {
    // TODO: implement initState
    createbox();
    super.initState();
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width * .8,
              height: MediaQuery.sizeOf(context).height * .06,
              child: TextField(
                controller: namecontroller,
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
                obscureText: true,
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
                      //   builder: (context) => const DoctorsMainPage(),
                      // ));
                      adddata(
                          name: namecontroller.text,
                          password: passwordcontroller.text);
                    },
                    child: const Text(
                      "sign in",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
              ],
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CounselorRegPage(),
                ));
              },
              child: const Text("New Counselor ? Sign up"),
            )
          ],
        ),
      ),
    );
  }

  Future<void> createbox() async {
    box2 = await Hive.openBox("logindata");
  }

  Future<void> adddata({
    required String name,
    required String password,
  }) async {
    try {
      final response = await DoctorLogin(
        name: name,
        password: password,
      );
      if (response.data.first.status == "success") {
        box2.put("isLogged", true);
        box2.put("userlogin", true);
        box2.put("username", response.data.first.name);
        box2.put("id", response.data.first.id.toString());
        box2.put("email", response.data.first.email);
        print(response.data.first.email);
        print(response.data.first.name);
        print(response.data.first.id);
        setState(() {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Sucessfull Login")));
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const DoctorsMainPage(),
          ));
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

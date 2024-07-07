import 'package:euphoria/DoctorsModule/module/search_model.dart';
import 'package:euphoria/doctorspage/views/doctorsskotlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientsearchPage extends StatefulWidget {
  final String user;
  final String note;
  final String phone;
  final String email;
  final SearchListModel data;

  const PatientsearchPage({
    super.key,
    required this.user,
    required this.note,
    required this.phone,
    required this.email,
    required this.data,
  });

  @override
  State<PatientsearchPage> createState() => _PatientsearchPageState();
}

class _PatientsearchPageState extends State<PatientsearchPage> {
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
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .04,
              ),
              const Text(
                "Patients Details",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height * .15,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 165, 203, 233)),
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
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.user,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              widget.email,
                              style: const TextStyle(
                                color: Colors.black,
                                //fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  widget.phone,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    //fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(
                                  width: 100,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: widget.data.data.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.all(8.0),
                    child: Container(
                      // constraints: const BoxConstraints(
                      //   minWidth: 400.0, // Adjust width as needed
                      //   minHeight: 200.0, // Adjust height as needed
                      // ),
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.data.data[index].note,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
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

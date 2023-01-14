import 'dart:convert';
import './model/jsonhandling.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserClass(),
    );
  }
}

class UserClass extends StatefulWidget {
  const UserClass({super.key});

  @override
  State<UserClass> createState() => _UserClassState();
}

class _UserClassState extends State<UserClass> {
  bool isloading = false;
  late User data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readLocalJson();
  }

  readLocalJson() async {
    isloading = true;
    var response = await rootBundle.loadString('assets/json.json');
    data = userfromJson(response.toString());
    setState(() {
      isloading = false;
    });
    print(data.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Local JSON Data Handling"),
      ),
      body: isloading
          ? Center(child: CircularProgressIndicator())
          : Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Container(
                        height: 70,
                        width: double.infinity,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                data.name.toString(),
                                style: const TextStyle(fontSize: 20),
                              ),
                              Text(data.age.toString()),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Container(
                        height: 70,
                        width: double.infinity,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                data.hobbies![0],
                                style: const TextStyle(fontSize: 20),
                              ),
                              Text(data.age.toString()),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(data.hobbies!.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: Container(
                              height: 170,
                              width: 170,
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      data.hobbies![index],
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}

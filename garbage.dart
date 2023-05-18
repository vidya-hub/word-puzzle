import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> randomList = [];
  @override
  void initState() {
    super.initState();
    randomList.clear();
    opacityList.clear();
    List<String> stringValues = textValues.split(" ");
    for (int i = 0; i < stringValues.length; i++) {
      opacityList.add(0.0);
    }
    stringValues.shuffle();
    setState(() {
      randomList.addAll(stringValues);
    });
  }

  String textValues =
      "Drag and drop has been around since most of us started using computers";
  List<String> getlistvalues() => textValues.split(" ");
  List<double> opacityList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Word Puzzle"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              // color: Colors.amber,
              child: const Text(
                "Drag the words to the correct order",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              child: DragTarget<String>(
                builder: (
                  BuildContext context,
                  List<dynamic> accepted,
                  List<dynamic> rejected,
                ) {
                  return ListView(
                    shrinkWrap: true,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.green,
                          child: Wrap(
                            children: List.generate(
                              getlistvalues().length,
                              (index) {
                                return getTextCard(
                                  context,
                                  textValues.split(" ")[index],
                                  opacityList[index],
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.green,
                          child: Wrap(
                            children: List.generate(
                              randomList.length,
                              (index) {
                                return Draggable(
                                  data: randomList[index] +
                                      " " +
                                      index.toString(),
                                  feedback: getTextCard(
                                    context,
                                    randomList[index],
                                    1,
                                  ),
                                  child: getTextCard(
                                    context,
                                    randomList[index],
                                    1,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
                onAccept: (data) {
                  if (kDebugMode) {
                    String dragDataVal = data.split(" ")[0];
                    int indexval = int.parse(data.split(" ")[1]);
                    String originalVal = getlistvalues()[indexval].toString();
                    print(
                      "dataVal: $dragDataVal indexval: $indexval originalVal: $originalVal",
                    );
                    if (dragDataVal == originalVal) {
                      setState(() {
                        opacityList[indexval] = 1.0;
                      });
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  getRandomNumber(int maxRange) {
    return Random().nextInt(maxRange);
  }

  Card getTextCard(
    BuildContext context,
    String text,
    double opacity,
  ) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
          vertical: MediaQuery.of(context).size.height * 0.02,
        ),
        child: Opacity(
          opacity: opacity.toDouble(),
          child: Text(
            text,
          ),
        ),
      ),
    );
  }
}

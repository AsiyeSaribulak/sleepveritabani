import 'package:flutter/material.dart';
import 'package:sklite/SVM/SVM.dart';
import 'package:sklite/ensemble/forest.dart';
import 'package:sklite/utils/io.dart';
import 'dart:convert';
import 'package:sklite/neural_network/neural_network.dart';

class UykuPage extends StatefulWidget {
  const UykuPage({super.key});

  @override
  State<UykuPage> createState() => _UykuPageState();
}

class _UykuPageState extends State<UykuPage> {
  //RandomForestClassifier? rfc;
  MLPClassifier? mlp;
  // SVC? svc;
  _UykuPageState() {
    List<double> X = [82669, 27013, 30744.0, 0];
    print("SVCClassifier");

    loadModel("assets/mlsleep.json").then((a) {
      this.mlp = MLPClassifier.fromMap(json.decode(a));
      print(mlp!.predict(X));
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text("Uyku"),
    ));
  }
}

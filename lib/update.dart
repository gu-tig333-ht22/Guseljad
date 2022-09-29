import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nyttprojektlen/data_fetcher.dart';
import 'package:nyttprojektlen/task.dart';
import 'package:nyttprojektlen/taskpage.dart';

import 'home.dart';

class update extends StatefulWidget {
  String? id;
  final String title;
  final bool isDone;

  update({this.id, required this.title, required this.isDone});

  @override
  State<update> createState() => _updateState();
}

class _updateState extends State<update> {
  final TextEditingController textkontroll = new TextEditingController();
  DataFetcher _dbHelper = DataFetcher();

  String value = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Hemma()),
          ).then((value) {
            setState(() {});
          }),
        ),
        title: const Text('TIG333 Att Göra'),
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 25, fontWeight: FontWeight.w500),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 10.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, //ksk ta bort
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 25.0, horizontal: 5.0),
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: textkontroll,
                    onTap: (() {
                      if (widget.title == '"UNAMED TASK"') {
                        textkontroll.text = "";
                      } else {
                        textkontroll.text = widget.title;
                        textkontroll.selection = TextSelection.fromPosition(
                            TextPosition(offset: textkontroll.text.length));
                      }
                    }),
                    onChanged: (value) =>
                        setState(() => this.value = textkontroll.text),
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'update current task ...',
                        suffixIcon: IconButton(
                            onPressed: () {
                              textkontroll.clear();
                            },
                            icon: const Icon(Icons.clear))),
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            buildButton(this.value),
          ],
        ),
      )),
    );
  }

  Widget buildButton(value) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                if (value != "") {
                  minuppgift uppfit = minuppgift(
                      title: value, done: widget.isDone, id: widget.id);
                  print(uppfit.title);
                  DataFetcher.updateNote(uppfit, widget.id!, uppfit.done);
                  print(uppfit.id);
                  setState(() {});
                  print('Uppdaterat uppgift');
                  textkontroll.clear();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Hemma()));
                } else {
                  minuppgift uppfit = minuppgift(
                      title: '"UNAMED TASK"',
                      done: widget.isDone,
                      id: widget.id);
                  print(uppfit.title);
                  DataFetcher.updateNote(uppfit, widget.id!, uppfit.done);
                  print(uppfit.id);
                  setState(() {});
                  print('UPDATERAT UPPGIFT');
                  textkontroll.clear();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Hemma()));
                }
              },
              child: Text("UPDATE"),
              style: ElevatedButton.styleFrom(foregroundColor: Colors.black),
            ),
          ],
        ));
  }
}

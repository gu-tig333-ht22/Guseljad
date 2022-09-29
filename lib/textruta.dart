import 'package:flutter/material.dart';
import 'package:nyttprojektlen/update.dart';
import 'data_fetcher.dart';
import 'home.dart';
import 'task.dart';

class taskk extends StatefulWidget {
  final String title;
  final bool isDone;
  String? id;
  taskk({required this.title, required this.isDone, this.id});

  @override
  State<taskk> createState() => _taskkState();
}

final textkontroll = new TextEditingController();

class _taskkState extends State<taskk> {
  DataFetcher _dbHelper = DataFetcher();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 15,
        ),
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 3.5, color: Colors.black),
            borderRadius: BorderRadius.circular(20)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          IconButton(
            icon: widget.isDone
                ? Icon(Icons.check_box)
                : Icon(Icons.check_box_outline_blank),
            iconSize: 40,
            onPressed: () {
              minuppgift uppfit =
                  minuppgift(title: widget.title, done: true, id: widget.id);
              DataFetcher.updateNote(uppfit, widget.id!, !widget.isDone);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Hemma()));
              if (uppfit.done != false) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text('Good Job, this task is done!'),
                      backgroundColor: Colors.pinkAccent),
                );
              }
            },
          ),
          Padding(padding: EdgeInsets.only(right: 10)),
          Expanded(
            child: TextButton(
                onPressed: () => {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => update(
                              id: widget.id,
                              title: widget.title,
                              isDone: widget.isDone)))
                    },
                child: Text(
                  widget.title,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: widget.isDone ? Colors.red : Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    decoration:
                        widget.isDone ? TextDecoration.lineThrough : null,
                  ),
                )),
          ),
          GestureDetector(
            child: IconButton(
              icon: Icon(Icons.clear),
              padding: EdgeInsets.only(left: 10),
              iconSize: 40,
              onPressed: () {
                showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          title: const Text('Do you want to delete this task?'),
                          actions: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                    child: const Text('No'),
                                    onPressed: (() {
                                      Navigator.pop(context);
                                    })),
                                GestureDetector(
                                  child: TextButton(
                                    child: const Text('Yes'),
                                    onPressed: () async {
                                      print("radera task");
                                      await _dbHelper.deleteNote(widget.id!);
                                      print(
                                          "raderat uppgift med id: '${widget.id}'");
                                      //    Navigator.pop(context);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Hemma()));
                                    },
                                  ),
                                ),
                              ],
                            )
                          ]);
                    });
              },
            ),
          )
        ]));
  }
}

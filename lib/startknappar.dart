import 'package:flutter/material.dart';
import 'home.dart';
import 'taskpage.dart';
import 'data_fetcher.dart';

class knapp extends StatefulWidget {
  @override
  State<knapp> createState() => _knappState();
}

class _knappState extends State<knapp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 30.0,
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0.0,
              right: 10.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => uppgift(),
                      ));
                },
                child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(width: 3, color: Colors.black),
                        shape: BoxShape.rectangle,
                        color: Colors.pinkAccent,
                        borderRadius: BorderRadius.circular(20)),
                    child: Icon(Icons.add, color: Colors.black)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
class help extends StatefulWidget {
  @override
  State<help> createState() => _helpState();
}

class _helpState extends State<help> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
     padding: EdgeInsets.symmetric(
      //    horizontal: 0.0,
        //  vertical: 0.0,
        ),
        child: Stack(
          children: [
          Positioned(
          //    bottom: 0.0,
            //  left: 0.0,
              child: GestureDetector(
                onTap: () {
                  showDialog<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                            title: const Text(
                                'To add a new task tap on the add button on the bottom right'),
                            actions: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    child: const Text('Next'),
                                    onPressed: () async {
                                      Navigator.pop(context);
                                      showDialog<void>(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                                title: const Text(
                                                    'To update existing task tap on the taskname'),
                                                actions: <Widget>[
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      TextButton(
                                                        child:
                                                            const Text('Next'),
                                                        onPressed: () async {
                                                          Navigator.pop(
                                                              context);
                                                          showDialog<void>(
                                                              context: context,
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                return AlertDialog(
                                                                    title: const Text(
                                                                        'Tap on the box to mark task as done or undone'),
                                                                    actions: <
                                                                        Widget>[
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        children: [
                                                                          TextButton(
                                                                            child:
                                                                                const Text('Next'),
                                                                            onPressed:
                                                                                () async {
                                                                              Navigator.pop(context);
                                                                              showDialog<void>(
                                                                                  context: context,
                                                                                  builder: (BuildContext context) {
                                                                                    return AlertDialog(title: const Text('Tap on X to delete task'), actions: <Widget>[
                                                                                      Row(
                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                        children: [
                                                                                          TextButton(
                                                                                            child: const Text('Next'),
                                                                                            onPressed: () async {
                                                                                              Navigator.pop(context);
                                                                                              showDialog<void>(
                                                                                                  context: context,
                                                                                                  builder: (BuildContext context) {
                                                                                                    return AlertDialog(title: const Text('Use the menu on the top left to filter done and undone tasks'), actions: <Widget>[
                                                                                                      Row(
                                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                                        children: [
                                                                                                          TextButton(
                                                                                                            child: const Text('OK'),
                                                                                                            onPressed: () async {
                                                                                                              Navigator.pop(context);
                                                                                                            },
                                                                                                          ),
                                                                                                        ],
                                                                                                      )
                                                                                                    ]);
                                                                                                  });
                                                                                            },
                                                                                          ),
                                                                                        ],
                                                                                      )
                                                                                    ]);
                                                                                  });
                                                                            },
                                                                          ),
                                                                        ],
                                                                      )
                                                                    ]);
                                                              });
                                                        },
                                                      ),
                                                    ],
                                                  )
                                                ]);
                                          });
                                    },
                                  ),
                                ],
                              )
                            ]);
                      });
                },
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      border: Border.all(width: 3, color: Colors.black),
                      shape: BoxShape.rectangle,
                      color: Colors.pinkAccent,
                      borderRadius: BorderRadius.circular(20)),
                  child: Icon(Icons.delete_forever, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
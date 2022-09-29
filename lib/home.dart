import 'package:flutter/material.dart';
import 'data_fetcher.dart';
import '../meny.dart';
import '../textruta.dart';
import 'startknappar.dart';

class Hemma extends StatefulWidget {
  @override
  State<Hemma> createState() => _HemmaState();
}

class _HemmaState extends State<Hemma> {
  DataFetcher _dbHelper = DataFetcher();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: meny(),
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
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
                icon: Icon(Icons.question_mark, color: Colors.black))
          ],
          title: const Text('TIG333 To DO'),
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.w500),
        ),
        body: SafeArea(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Stack(
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: FutureBuilder(
                                initialData: [],
                                future: DataFetcher.getNotes(),
                                builder: (context, AsyncSnapshot snapshot) {
                                  return ListView.builder(
                                    itemCount: snapshot.data.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () async {
                                          if (snapshot.data[index].done == 0) {
                                            await DataFetcher.updateNote(
                                                snapshot.data[index].title,
                                                snapshot.data[index].id,
                                                true);
                                            print('klar');
                                          } else {
                                            await DataFetcher.updateNote(
                                                snapshot.data[index].title,
                                                snapshot.data[index].id,
                                                false);
                                            print('ej klar');
                                          }
                                          setState(() {});
                                        },
                                        child: taskk(
                                            title: snapshot.data[index].title,
                                            id: snapshot.data[index].id,
                                            isDone: snapshot.data[index].done),
                                      );
                                    },
                                  );
                                }))
                      ]),
                  Positioned(
                    child: knapp(),
                  ),
                ],
              )),
        ));
  }
}

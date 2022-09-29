import 'package:flutter/material.dart';
import 'package:nyttprojektlen/startknappar.dart';
import '../home.dart';
import '../textruta.dart';
import 'data_fetcher.dart';

class meny extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Text(
                'Meny',
                style: TextStyle(
                    color: Colors.pink,
                    fontSize: 27,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ListTile(
            title: Text(
              'All',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Hemma(), //(context) => NySida()
                ),
              )
            },
          ),
          ListTile(
            title: Text(
              'Done',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () => {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => gjorda(),
              ))
            },
          ),
          ListTile(
              title: Text(
                'Undone',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ogjorda()),
                    ),
                  })
        ],
      ),
    );
  }
}

class gjorda extends StatefulWidget {
  @override
  State<gjorda> createState() => _gjordaState();
}

class _gjordaState extends State<gjorda> {
  DataFetcher _dbHelper = DataFetcher();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: meny(),
      appBar: AppBar(
        title: const Text('TIG333 Att Göra'),
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 25, fontWeight: FontWeight.w500),
      ),
      body: SafeArea(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Stack(children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Expanded(
                      child: FutureBuilder(
                          initialData: [],
                          future: DataFetcher.getDoneNotes(),
                          builder: (context, AsyncSnapshot snapshot) {
                            return ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () async {
                                    id:
                                    snapshot.data[index].id; //ev ta bort
                                    if (snapshot.data[index].done) {
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
              ]))),
    );
  }
}

class ogjorda extends StatefulWidget {
  const ogjorda({Key? key}) : super(key: key);

  @override
  State<ogjorda> createState() => _ogjordaState();
}

DataFetcher _dbHelper = DataFetcher();

class _ogjordaState extends State<ogjorda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: meny(),
      appBar: AppBar(
        title: const Text('TIG333 Att Göra'),
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 25, fontWeight: FontWeight.w500),
      ),
      body: SafeArea(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Stack(children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Expanded(
                      child: FutureBuilder(
                          initialData: [],
                          future: DataFetcher.getNotDoneNotes(),
                          builder: (context, AsyncSnapshot snapshot) {
                            return ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () async {
                                    id:
                                    snapshot.data[index].id; //ev ta bort
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
              ]))),
    );
  }
}

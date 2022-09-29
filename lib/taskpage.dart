import 'data_fetcher.dart';
import '../task.dart';
import 'home.dart';
import 'package:flutter/material.dart';

class uppgift extends StatefulWidget {
  final int? id;

  uppgift({this.id});

  @override
  State<uppgift> createState() => _uppgiftState();
}

class _uppgiftState extends State<uppgift> {
  @override
  void initState() {
    print("ID: ${widget.id}");
    super.initState();
  }

  final textkontroll = new TextEditingController();
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
                        onChanged: (value) =>
                            setState(() => this.value = textkontroll.text),
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: 'add new task ...',
                            suffixIcon: IconButton(
                                onPressed: () {
                                  textkontroll.clear();
                                },
                                icon: const Icon(Icons.clear))),
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  ],
                ),
                buildButton(this.value),
              ],
            )),
      ),
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
                  minuppgift _nyuppgifyt =
                      minuppgift(title: value, done: false /* id: widget.id*/
                          );
                  await _dbHelper.addNewNote(_nyuppgifyt);
                  setState(() {});
                  print('lagt till ny uppgift');
                  textkontroll.clear();
                }
              },
              child: Text("+ ADD"),
              style: ElevatedButton.styleFrom(foregroundColor: Colors.black),
            ),
          ],
        ));
  }
}

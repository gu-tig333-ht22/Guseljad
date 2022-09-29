import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'internet.dart';

class MyState extends ChangeNotifier {
  String _ip = '';
  bool _loading = false;

  String get ip => _ip;
  bool get loading => _loading;

  MyState() {
    fetchIp();
  }

  void fetchIp() async {
    _loading = true;
    notifyListeners();
    var ip = await internetfetcher.fetchIp();
    _loading = false;

    _ip = ip;
    notifyListeners();
  }
}

void main() {
  runApp(
      ChangeNotifierProvider(create: (context) => MyState(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(),
        body: Center(child: _content(context)),
      ),
    );
  }

  Widget _content(context) {
    return Column(
      children: [
        Consumer<MyState>(
          builder: (context, state, child) => Text(state.ip),
        ),
        Consumer<MyState>(
          builder: (context, state, child) =>
              state.loading ? Text('loading') : Text(''),
        ),
        Container(
            child: TextButton(
          child: Text('TRYCK HÄR'),
          onPressed: () {
            _doStuff(context);
          },
        )),
      ],
    );
  }

  void _doStuff(context) async {
    var state = Provider.of<MyState>(context, listen: false);
    state.fetchIp();
    // print('nutid');
    //var result = await internetfetcher.fetchIp();
    //  print('framtiden!');
    //print(result);
  }
}

/*
class Ipwidget extends StatefulWidget {
  @override
  State<Ipwidget> createState() => _IpwidgetState();
}

class _IpwidgetState extends State<Ipwidget> {
  String ip = 'ip';

  void initState() {
    super.initState();
    _fetchIP();
  }

  Widget build(BuildContext context) {
    return Text(ip);
  }

  void _fetchIP() async {
    var newIp = await internetfetcher.fetchIp();
    setState(() {
      ip = newIp;
    });
    print('got nw ip');
  }
}
*/

/*
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

String ip = 'ip';

class _MyAppState extends State<MyApp> {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(),
        body: Center(child: _content()),
      ),
    );
  }

  Widget _content() {
    return Column(
      children: [
        Text(ip),
        Container(
            child: TextButton(
          child: Text('TRYCK HÄR'),
          onPressed: () {
            _doStuff();
          },
        )),
        Ipwidget()
      ],
    );
  }

  void _doStuff() async {
    // print('nutid');
    var result = await internetfetcher.fetchIp();
    //  print('framtiden!');
    print(result);
    setState(() {
      ip = result;
    });
  }
}

*/

/* retunrnerar hela bodyn
  Future<String> _fetchstuffominternet() async {
    http.Response response = await http.get('https://api.myip.com/');
    return response.body;
  }
returnerar bara ip
  Future<String> _fetchstufffrominternet() async {
    http.Response response = await http.get('https://api.myip.com/');
    var jsonData = response.body;
    var obj = jsonDecode(jsonData);
    return obj['ip'];
  }
}
// "array": [1,2,3,4, "text", true] // arrayer, objekt, strängar och 
//nummer kan hanteras i den datta man kan spara i JSON.
*/



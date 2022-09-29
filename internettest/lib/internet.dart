import 'package:http/http.dart' as http;
import 'dart:convert';

class internetfetcher {
  static Future<String> fetchIp() async {
    http.Response response = await http.get('https://api.myip.com/');
    var jsonData = response.body;
    var obj = jsonDecode(jsonData);
    return obj['ip'];
  }
}

//Hämta todos fixar vi här.  
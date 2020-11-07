import 'package:http/http.dart' as http;

class BetApi{
  static Future getBets(){
    return http.get('http://192.168.2.5/tahmin_adam/crud.php');
  }
}
import 'dart:convert';
import 'package:http/http.dart' as http;

class CreateJson{
  

  String URL = 'https://abs.chilufyamedia.com/abs_api.php';
  
  
  void postToServer(list, uid) async{
    Map<String,String> headers = {'Content-Type':'application/json','IDD':uid};
    await http.post(
        URL,
        headers: headers, 
        body: jsonEncode(list) 
      ).then((response) {
        print(response.statusCode);
    }).catchError((error) {
       print(error);
    });
  }

}
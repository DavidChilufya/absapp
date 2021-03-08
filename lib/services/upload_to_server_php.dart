import 'dart:io';
import 'dart:convert';
import 'package:absapp/helpers/data_upload/interfaces/i_upload_to_server.dart';
import 'package:http/http.dart' as http;


class UploadToServerPhp implements IUploadToServer {
  
  bool _internet_connection_status;
  final URL = 'https://abs.chilufyamedia.com/abs_api.php';

  @override
  Future<void> confirmConnectionStatus() async {
    try {
      final result = await InternetAddress.lookup('abs.chilufyamedia.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        this._internet_connection_status = true;
      }else{
        this._internet_connection_status = false;
      }
    } on SocketException catch (_) {
        this._internet_connection_status = false;
    }
  }

  @override
  Future<void> upload(data) async{
    if (_internet_connection_status) {
        await this._postToServer(data, "");
      }
  }

  @override
  bool getConnectionStatus() {
    return this._internet_connection_status;
  }

  void _postToServer(list, uid) async{
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

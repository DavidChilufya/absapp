import 'dart:io';
import 'dart:convert';
import 'package:absapp/helpers/data_upload/interfaces/i_upload_to_server.dart';
import 'package:absapp/services/interview_dao.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

class UploadToServerFirebase implements IUploadToServer {
  bool _internet_connection_status;
  final URL = 'https://abs.chilufyamedia.com/abs_api.php';
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final InterviewDao _interviewDao = InterviewDao();
  CollectionReference interviews =
      FirebaseFirestore.instance.collection('interviews');

  @override
  Future<void> confirmConnectionStatus() async {
    try {
      final result = await InternetAddress.lookup('abs.chilufyamedia.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        this._internet_connection_status = true;
      } else {
        this._internet_connection_status = false;
      }
    } on SocketException catch (_) {
      this._internet_connection_status = false;
    }
  }

  @override
  Stream<int> upload(data) async* {
    // print("Data Added @@@---- ${data}");
    if (_internet_connection_status) {
      for (int i = 0; i < data.length; i++) {
        print("Data Added ---- ${data[i]['item']}");
        await interviews.add({'interviews': data[i]['item'] }).then((value) {
          data[i]['item']['uploaded'] = true;
          _interviewDao.updateHiveInterviewUploaded(
              data[i]['key'], data[i]['item']);
        }).catchError((error) => print("Failed to add data: $error"));

        yield i;
      }
    }
  }

  @override
  bool getConnectionStatus() {
    return this._internet_connection_status;
  }

  void _postToServer(list, uid) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'IDD': uid
    };
    await http
        .post(URL, headers: headers, body: jsonEncode(list))
        .then((response) {
      print(response.statusCode);
    }).catchError((error) {
      print(error);
    });
  }
}

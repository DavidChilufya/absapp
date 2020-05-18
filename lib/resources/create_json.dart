import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class CreateJson{
  
  File jsonFile;
  Directory dir;
  String fileName = "_dataForUpload.json";
  bool fileExists = false;
  Map<String, String> fileContent; 

  CreateJson(){
    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonFile = File(dir.path + "/" + fileName);
      fileExists = jsonFile.existsSync();
      //if (fileExists) this.setState(() => fileContent = JSON.decode(jsonFile.readAsStringSync()));
    });
  }

  void createFile(List content, Directory dir, String fileName) {
    print("Creating file!");
    File file = File(dir.path + "/" + fileName);
    file.createSync();
    fileExists = true;
    file.writeAsStringSync(json.encode(content));
  }

  void writeToFile(List _list) {
    final foo = List<dynamic>.from(
      _list.map<dynamic>(
        (dynamic item) => item,
      ),
    );
    print("Writing to file!");
    //Map<String, String> content = {key: value};
    if (fileExists) {
      print("File exists");
      Map<String, String> jsonFileContent = json.decode(jsonFile.readAsStringSync());
      //jsonFileContent.addAll(content);
      jsonFile.writeAsStringSync(json.encode(jsonFileContent));
    } else {
      print("File does not exist!${foo }");
      //print(jsonEncode(_list.map<String,dynamic>((e) => e.toJson()).toList()));
      createFile(_list, dir, fileName);
    }
    
  }
}
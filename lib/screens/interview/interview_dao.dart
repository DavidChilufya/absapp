import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class InterviewDao {
  static const String INTERVIEW_TABLE = 'interviews';
  
  Future writeToHive(Map interview, String interview_id) async {
    final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    //Hive.registerAdapter(ContactAdapter(), 0);
    var interviewsBox = await Hive.openBox(INTERVIEW_TABLE);
    await interviewsBox.put(interview_id, interview);
    
  } 

  Future readHive(String interview_id) async {
    final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    var interviewsBox = await Hive.openBox(INTERVIEW_TABLE);
    return await interviewsBox.get(interview_id);
  } 

  Future updateHive(Map interview,String interview_id) async {
    final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    var interviewsBox = await Hive.openBox(INTERVIEW_TABLE);
    await interviewsBox.put(interview_id, interview);
  } 

  Future getAllInterviews() async {
    final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    var interviewsBox = await Hive.openBox(INTERVIEW_TABLE);
    return await interviewsBox.values.toList();
  } 

  void closeHive(){
    Hive.close();
    print(Hive.close());
  }
}
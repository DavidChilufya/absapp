import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class InterviewDao {
  static const String INTERVIEW_TABLE = 'interviews';

  Future<void> writeToHive(Map interview, String interview_id) async {
    final appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    //Hive.registerAdapter(ContactAdapter(), 0);
    var interviewsBox = await Hive.openBox(INTERVIEW_TABLE);
    return interviewsBox.put(interview_id, interview);
  }

  Future readHive(String interview_id) async {
    final appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    var interviewsBox = await Hive.openBox(INTERVIEW_TABLE);
    return interviewsBox.get(interview_id);
  }

  Future<void> updateHive(Map interview, String interview_id) async {
    final appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    var interviewsBox = await Hive.openBox(INTERVIEW_TABLE);
    return interviewsBox.put(interview_id, interview);
  }

  void updateHiveInterviewUploaded(int key, data) async {
    final appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    var interviewsBox = await Hive.openBox(INTERVIEW_TABLE);
    return interviewsBox.putAt(key, data);
  }
  
  Future getAllInterviews() async {
    final appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    var interviewsBox = await Hive.openBox(INTERVIEW_TABLE);
    print('ALL RAW INTERVIEWS : ${interviewsBox.values}');
    return interviewsBox.values.toList();
  }

  Future<void> deleteInterview({int key}) async {
    final appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    var interviewsBox = await Hive.openBox(INTERVIEW_TABLE);
    await interviewsBox.deleteAt(key);
  }

  void closeHive() {
    Hive.close();
  }
}

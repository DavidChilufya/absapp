import 'package:absapp/database/databaseSetup.dart';
import 'package:absapp/models/questionnaire/create.dart';
import 'package:sembast/sembast.dart';

class CreateInterview_DAO {
  static const String folderName = "ABSDATABASE";

  final _absFolder = intMapStoreFactory.store(folderName);

  Future<Database> get  _db  async => await AppDatabase.instance.database;

  Future insertInterview(CreateInterviewModel interview) async{

    await  _absFolder.add(await _db, interview.toJson() );
    print('Interview Inserted successfully !!');

  }

  Future updateInterview(CreateInterviewModel interview) async{

    final finder = Finder(filter: Filter.byKey(interview.interview_id));

    await _absFolder.update(await _db, interview.toJson(),finder: finder);

  }

  Future delete(CreateInterviewModel interview) async{

    final finder = Finder(filter: Filter.byKey(interview.interview_id));

    await _absFolder.delete(await _db, finder: finder);

  }

  Future<List<CreateInterviewModel>> getAllInterviews()async{

    final recordSnapshot = await _absFolder.find(await _db);

    return recordSnapshot.map((snapshot){

      final interview = CreateInterviewModel.fromJson(snapshot.value);

      return interview;

    }).toList();

  }
}
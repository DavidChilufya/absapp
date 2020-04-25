import 'package:absapp/database/databaseSetup.dart';
import 'package:absapp/screens/interview/bloc/interview_bloc.dart';
import 'package:absapp/screens/interview/model/interview_model.dart';
import 'package:sembast/sembast.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class InterviewDao {
  static const String INTERVIEW_STORE_NAME = 'interviews';
  // A Store with int keys and Map<String, dynamic> values.
  // This Store acts like a persistent map, values of which are Fruit objects converted to Map
  final _interviewsStore = intMapStoreFactory.store(INTERVIEW_STORE_NAME);

  // Private getter to shorten the amount of code needed to get the
  // singleton instance of an opened database.
  Future<Database> get _db async => await AppDatabase.instance.database;

  //var interviewsBox;
  
  Future writeToHive() async {
    final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    var interviewsBox = await Hive.openBox('interviews');
    await interviewsBox.put('interview', ['1',{'2':'d'}]);
  } 

  Future<List> readHive() async {
    final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    var interviewsBox = await Hive.openBox('interviews');
    return await interviewsBox.get('interview');
  } 


  Future insert(InterviewModel interview) async {
    //print(interview);
    await _interviewsStore.add(await _db, interview.toMap());
  }

  Future<List<InterviewModel>> getInterviewById(interview_id) async {
    
    InterviewModel interview;
     //sort the _todo item in order of their timestamp
    //that is entry time
    final finder = Finder(filter: Filter.equals('interview_id',interview_id));
    
    //get the data
    final snapshot = await _interviewsStore.find(
      await _db,
      finder: finder,
    );

    
    print('wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww${snapshot.runtimeType}rrrrrrrrrrrrrrrrrrrr');
    //call the map operator on the data
    //this is so we can assign the correct value to the id from the store
    //After we return it as a list
    return snapshot.map((snapshot) {
      final interview = InterviewModel.fromMap(snapshot.value);
      
      print('wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww${snapshot.runtimeType}rrrrrrrrrrrrrrrrrrrr');

      return interview;
    }).toList();
    
    //print('wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww${interview}');

  }

  Future<List<InterviewModel>> getAllSortedByTImeStamp() async {
  
     //sort the _todo item in order of their timestamp
    //that is entry time
    final finder = Finder(sortOrders: [SortOrder('id')]);
    
    //get the data
    final snapshot = await _interviewsStore.find(
      await _db,
      finder: finder,
    );

    //call the map operator on the data
    //this is so we can assign the correct value to the id from the store
    //After we return it as a list
    return snapshot.map((snapshot) {
      final todo = InterviewModel.fromMap(snapshot.value);

      todo.id = snapshot.key;
      return todo;
    }).toList();
  }

  Future update(String interview_id, Map section) async {
    // For filtering by key (ID), RegEx, greater than, and many other criteria,
    // we use a Finder.
    final finder = Finder(filter: Filter.equals('interview_id',interview_id));
    await _interviewsStore.update(
      await _db,
      section,
      finder: finder,
    );
  }

  Future delete(InterviewModel interview) async {
    final finder = Finder(filter: Filter.byKey(interview.id));
    await _interviewsStore.delete(
      await _db,
      finder: finder,
    );
  }

  Future<List<InterviewModel>> getAllSortedByName() async {
    // Finder object can also sort data.
    final finder = Finder(sortOrders: [
      SortOrder('household_id'),
    ]);

    final recordSnapshots = await _interviewsStore.find(
      await _db,
      finder: finder,
    );

    // Making a List<Interviews> out of List<RecordSnapshot>
    return recordSnapshots.map((snapshot) {
      final interview = InterviewModel.fromMap(snapshot.value);
      // An ID is a key of a record from the database.
      interview.id = snapshot.key;
      return interview;
    }).toList();
  }
}
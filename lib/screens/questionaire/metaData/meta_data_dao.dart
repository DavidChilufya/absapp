import 'package:absapp/database/databaseSetup.dart';
import 'package:absapp/screens/questionaire/metaData/model/meta_data.dart';
import 'package:sembast/sembast.dart';

class MetaDataDao {
  static const String INTERVIEW_STORE_NAME = 'interviews';
  // A Store with int keys and Map<String, dynamic> values.
  // This Store acts like a persistent map, values of which are Fruit objects converted to Map
  final _interviewsStore = intMapStoreFactory.store(INTERVIEW_STORE_NAME);

  // Private getter to shorten the amount of code needed to get the
  // singleton instance of an opened database.
  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insert(InterviewMetaDataModel interview) async {
    await _interviewsStore.add(await _db, interview.toMap());
  }

  Future update(InterviewMetaDataModel interview) async {
    // For filtering by key (ID), RegEx, greater than, and many other criteria,
    // we use a Finder.
    final finder = Finder(filter: Filter.byKey(interview.id));
    await _interviewsStore.update(
      await _db,
      interview.toMap(),
      finder: finder,
    );
  }

  Future delete(InterviewMetaDataModel interview) async {
    final finder = Finder(filter: Filter.byKey(interview.id));
    await _interviewsStore.delete(
      await _db,
      finder: finder,
    );
  }

  Future<List<InterviewMetaDataModel>> getAllSortedByName() async {
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
      final interview = InterviewMetaDataModel.fromMap(snapshot.value);
      // An ID is a key of a record from the database.
      interview.id = snapshot.key;
      return interview;
    }).toList();
  }
}
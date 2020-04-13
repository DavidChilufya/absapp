import 'dart:async';
import 'dart:math';
import 'package:absapp/screens/questionaire/metaData/bloc/meta_data_event.dart';
import 'package:absapp/screens/questionaire/metaData/bloc/meta_data_state.dart';
import 'package:absapp/screens/questionaire/metaData/meta_data_dao.dart';
import 'package:absapp/screens/questionaire/metaData/model/meta_data.dart';
import 'package:bloc/bloc.dart';

class MetaDataBloc extends Bloc<MetaDataEvent, MetaDataState> {
  MetaDataDao _metaDataDao = MetaDataDao();

  // Display a loading indicator right from the start of the app
  @override
  MetaDataState get initialState => InterviewsLoading();


  // This is where we place the logic.
  @override
  Stream<MetaDataState> mapEventToState(
    MetaDataEvent event,
  ) async* {
    if (event is LoadInterviews) {
      // Indicating that fruits are being loaded - display progress indicator.
      yield InterviewsLoading();
      yield* _reloadInterviews();
    } else if (event is AddRandomInterview) {
      // Loading indicator shouldn't be displayed while adding/updating/deleting
      // a single Interview from the database - we aren't yielding InterviewsLoading().
      await _metaDataDao.insert(RandomInterviewGenerator.getRandomInterview());
      yield* _reloadInterviews();
    } else if (event is UpdateWithRandomInterview) {
      final newInterview = RandomInterviewGenerator.getRandomInterview();
      // Keeping the ID of the Fruit the same
      newInterview.id = event.updatedInterview.id;
      await _metaDataDao.update(newInterview);
      yield* _reloadInterviews();
    } else if (event is DeleteInterview) {
      await _metaDataDao.delete(event.interview);
      yield* _reloadInterviews();
    }
  }

  Stream<MetaDataState> _reloadInterviews() async* {
    final interviews = await _metaDataDao.getAllSortedByName();
    // Yielding a state bundled with the Fruits from the database.
    yield InterviewsLoaded(interviews);
  }
}

class RandomInterviewGenerator {
  static final _interviews = [
    InterviewMetaDataModel(interview_id: '122313', houshold_id: 'werrtert')
  ];

  static InterviewMetaDataModel getRandomInterview() {
    return _interviews[Random().nextInt(_interviews.length)];
  }
}
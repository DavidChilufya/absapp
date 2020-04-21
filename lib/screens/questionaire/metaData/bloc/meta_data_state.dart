import 'package:meta/meta.dart';

@immutable
class MetaDataState {
  final bool isSubmitting;
  final bool isSuccess;

  MetaDataState({
    @required this.isSubmitting,
    @required this.isSuccess,
  });

  factory MetaDataState.empty() {
    return MetaDataState(
      isSubmitting: false,
      isSuccess: false,
    );
  }

  factory MetaDataState.loading() {
    return MetaDataState(
      isSubmitting: true,
      isSuccess: false,
    );
  }

  factory MetaDataState.success() {
    return MetaDataState(
      isSubmitting: false,
      isSuccess: true,
    );
  }

  @override
  String toString() {
    return '''MetaDataState {
      isSubmitting: $isSubmitting,
      isSuccess: $isSuccess,
    }''';
  }
}

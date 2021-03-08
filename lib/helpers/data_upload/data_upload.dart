import 'package:absapp/helpers/data_upload/interfaces/i_upload_to_server.dart';

abstract class DataUpload {
  IUploadToServer uploadToServer;

  Future<void> confirmConnectionStatus() {
    return this.uploadToServer.confirmConnectionStatus();
  }

  Stream<int> upload(data) {
    return this.uploadToServer.upload(data);
  }

  bool getConnectionStatus() {
    return this.uploadToServer.getConnectionStatus();
  }
}

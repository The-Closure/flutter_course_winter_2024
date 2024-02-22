import 'package:firebase_test/service/firestore_service.dart';
import 'package:get_it/get_it.dart';

class ServiceLocator {
  GetIt getI = GetIt.instance;
  setup() {
    getI.registerSingleton<FireStoreService>(FireStoreService());
  }
}

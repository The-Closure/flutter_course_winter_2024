import 'package:get_it/get_it.dart';

GetIt core =  GetIt.instance;

setup(){

  // ? Create Instance EveyTime I Access The Class  
  core.registerFactory(() => DateTime.now());
  

  // ?  Create One Instance of Class 
  // core.registerSingleton(DateTime.now());
}
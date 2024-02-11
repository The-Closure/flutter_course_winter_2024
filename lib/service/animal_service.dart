import 'package:dio/dio.dart';
import 'package:service_layer_clean/model/animal_model.dart';
import 'package:service_layer_clean/model/error_model.dart';
import 'package:service_layer_clean/model/list_animal_model.dart';
import 'package:service_layer_clean/model/result_model.dart';

class ServiceLayerConfig {
  Dio dio = Dio();
  String baseurl = "https://65b917c8b71048505a8a2a12.mockapi.io/api/v1/Animal";
  late Response response;
}

abstract class AnimalService extends ServiceLayerConfig {
  Future<ResultModel> getAnimals();
  createAnimal(AnimalModel animal);
}

class AnimalServiceImp extends AnimalService {
  @override
  createAnimal(AnimalModel animal) async {
    response = await dio.post(baseurl, data: animal.toMap());

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<ResultModel> getAnimals() async {
    response = await dio.get(baseurl);

    if (response.statusCode == 200) {
      List<AnimalModel> animal = List.generate(response.data.length,
          (index) => AnimalModel.fromMap(response.data[index]));

          ListAnimalModel animals= ListAnimalModel(animals: animal);
      return animals;
    } else {
      return ErrorModel(message: 'There is an Error');
    }
  }
}

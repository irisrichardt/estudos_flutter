import 'package:estudos_flutter/models/time.dart';
import 'package:estudos_flutter/models/titulo.dart';
import 'package:estudos_flutter/repositories/times_repository.dart';

class HomeController {
  late TimesRepository timesRepository;

  List<Time> get tabela => timesRepository.times;

  HomeController() {
    timesRepository = TimesRepository();
  }
}

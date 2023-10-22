import 'package:dio_viacep_flutter/src/models/cep.dart';

abstract class ApiRepository {
  Future<Cep> getCep(String cep);
}

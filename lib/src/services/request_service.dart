import 'package:dio_viacep_flutter/src/repositories/api/api_repository.dart';
import 'package:dio_viacep_flutter/src/repositories/local/local_repository.dart';

import '../models/cep.dart';

class RequestService {
  const RequestService(
    this._repository,
    this._storage,
  );

  final ApiRepository _repository;
  final LocalRepository _storage;

  Future<Cep> getCep(String cep) async {
    final cepFromStorage = await _storage.getCep(cep);
    if (cepFromStorage != null) {
      return Cep.fromMap(cepFromStorage);
    }

    Cep cepFromApi = await _repository.getCep(cep);
    if (!cepFromApi.erro) {
      await _storage.insertCep(cep, cepFromApi.toMap());      
    }
    return cepFromApi;
  }
}

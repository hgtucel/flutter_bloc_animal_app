import 'dart:convert';
import 'package:animals_app/core/i_request.dart';
import 'package:animals_app/core/results/request_result.dart';
import 'package:animals_app/models/i_model.dart';
import 'package:http/http.dart';

class HttpCoreRequest<T extends IModel> implements IRequest<T> {
  final Client _client;

  HttpCoreRequest(this._client);

  @override
  Future<RequestResult<List<T>>> getList<T extends IModel>(
      T model, Uri uri) async {
    final response = await _client.get(uri);
    final jsonModel = jsonDecode(response.body);
    if (response.statusCode != 200) {
      return RequestResult(jsonModel, Status.failure);
    }
    if (jsonModel is Map) {
      List<T> list = [];
      jsonModel.forEach((key, value) {
        list.add(model.fromJson(value));
      });
      return RequestResult(list, Status.success);
    } else {
      return RequestResult(jsonModel, Status.failure);
    }
  }

  @override
  Future<RequestResult> post<T extends IModel>(T model, Uri uri) async {
    final jsonModel = jsonEncode(model.toJson());
    final response = await _client.post(uri, body: jsonModel);
    if (response.statusCode != 200) {
      final errorJson = jsonEncode(response.body);
      return RequestResult(errorJson, Status.failure);
    }
    return RequestResult(true, Status.success);
  }
}

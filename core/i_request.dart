import 'package:animals_app/core/results/request_result.dart';
import 'package:animals_app/models/i_model.dart';

abstract class IRequest<T> {
  Future<RequestResult<List<T>>> getList<T extends IModel>(T model, Uri uri);
  Future<RequestResult> post<T extends IModel>(T model, Uri uri);
}

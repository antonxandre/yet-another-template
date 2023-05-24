import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;
import '../models/model_model.dart';
import '../utils/http_error_util.dart';
import '../utils/http_success_util.dart';
import 'response.dart';
import 'http_failures.dart';

abstract class HttpService<T> {
  Future<Response> findOne(String id);
  Future<Response> findAll();
  Future<Response> create(T istance);
  Future<Response> update(String id, T istance);
  Future<Response> delete(String id);
}

abstract class HttpServiceImpl<T> implements HttpService<T>, Model<T> {
  //TODO: criar um httpClient e buscar com uma injeção.
  HttpServiceImpl(this.baseUrl);
  final String baseUrl;

  @override
  T fromJson(Map<String, dynamic> json);

  @override
  Map<String, dynamic> toJson(T model);

  //TODO: dynamic id?
  //TODO: FAZER O TRY CATCH NESSES MÉTODOS
  @override
  Future<Response> findOne(String id) async {
    final url = '$baseUrl/$id';
    final response = await http.get(Uri.parse(url));
    final body = jsonDecode(response.body);
    if (hasSuccess(response.statusCode)) {
      final data = fromJson(body);
      return Success(data);
    }
    return HttpErrorUtil.handleFailure(
      response.statusCode,
      body: body,
    );
  }

  @override
  Future<Response> findAll() async {
    try {
      final url = baseUrl;
      final response = await http.get(Uri.parse(url));
      if (!hasSuccess(response.statusCode)) {
        return HttpErrorUtil.handleFailure(
          response.statusCode,
        );
      }
      final body = jsonDecode(response.body);
      final List<T> data = body.map<T>((j) => fromJson(j)).toList();
      return Success(data);
    } on Failure catch (e, s) {
      developer.log(e.message, error: e, stackTrace: s);
      return e;
    } catch (e, s) {
      developer.log('Error', error: e, stackTrace: s);
      return UnknownFailure("Unknown error");
    }
  }

  @override
  Future<Response> create(T instance) async {
    try {
      final url = baseUrl;
      final jsonEncoded = jsonEncode(toJson(instance));
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-type": "application/json"},
        body: jsonEncoded,
      );
      final body = jsonDecode(response.body);
      if (!hasSuccess(response.statusCode)) {
        return HttpErrorUtil.handleFailure(
          response.statusCode,
          body: body,
        );
      }
      return Success(instance);
    } on Failure catch (e, s) {
      developer.log(e.message, error: e, stackTrace: s);
      return e;
    } catch (e, s) {
      developer.log('Error', error: e, stackTrace: s);
      return UnknownFailure("Unknown error");
    }
  }

  @override
  Future<Response> update(String id, T instance) async {
    try {
      final url = '$baseUrl/$id';
      final jsonEncoded = jsonEncode(toJson(instance));
      final response = await http.put(
        Uri.parse(url),
        headers: {"Content-type": "application/json"},
        body: jsonEncoded,
      );

      if (!hasSuccess(response.statusCode)) {
        return HttpErrorUtil.handleFailure(
          response.statusCode,
        );
      }
      return Success(instance);
    } on Failure catch (e, s) {
      developer.log(e.message, error: e, stackTrace: s);
      return e;
    } catch (e, s) {
      developer.log('Error', error: e, stackTrace: s);
      return UnknownFailure("Unknown error");
    }
  }

  @override
  Future<Response> delete(
    String id,
  ) async {
    try {
      final url = '$baseUrl/$id';
      final response = await http.delete(
        Uri.parse(url),
      );
      if (!hasSuccess(response.statusCode)) {
        return HttpErrorUtil.handleFailure(
          response.statusCode,
        );
      }
      return Success(id);
    } on Failure catch (e, s) {
      developer.log(e.message, error: e, stackTrace: s);
      return e;
    } catch (e, s) {
      developer.log('Error', error: e, stackTrace: s);
      return UnknownFailure("Unknown error");
    }
  }
}

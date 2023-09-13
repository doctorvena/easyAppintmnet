import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../models/login_response.dart';
import '../models/search_result.dart';
import '../utils/user_singleton.dart';
import 'navigation.dart';

class BaseProvider<T> with ChangeNotifier {
  static String? _baseUrl;
  String _endpoint = "";

  BaseProvider(String endpint) {
    _endpoint = endpint;
    _baseUrl = const String.fromEnvironment("baseUrl",
        defaultValue: "http://10.0.2.2:4000");
  }

  Future<searchResult<T>> get({dynamic filter}) async {
    var url = "$_baseUrl$_endpoint";

    if (filter != null) {
      var queryString = getQueryString(filter);
      url = "$url?$queryString";
    }

    var uri = Uri.parse(url);
    var headers = createHeaders();

    var response = await http.get(uri, headers: headers);

    if (isValidResponse(response)) {
      var data = jsonDecode(response.body);

      var result = searchResult<T>();

      for (var item in data) {
        // TimeSlot t = TimeSlot(timeSlotId, startTime, endTime, businessId, duration)
        result.result.add(fromJson(item));
      }

      return result;
    } else {
      throw Exception("Unknown error");
    }
  }

  Future<T> getById(dynamic id) async {
    var url = "$_baseUrl$_endpoint/$id";

    var uri = Uri.parse(url);
    var headers = createHeaders();

    var response = await http.get(uri, headers: headers);

    if (isValidResponse(response)) {
      var data = jsonDecode(response.body);

      return fromJson(data);
    } else {
      throw Exception("Unknown error");
    }
  }

  Future<T> insert(dynamic request) async {
    var url = "$_baseUrl$_endpoint";
    var uri = Uri.parse(url);
    var headers = createHeaders();

    var jsonRequest = jsonEncode(request);

    var response = await http.post(uri, headers: headers, body: jsonRequest);

    if (isValidResponse(response)) {
      var data = jsonDecode(response.body);

      return fromJson(data);
    } else {
      throw Exception("Unknown error");
    }
  }

  Future<T> update(int id, [dynamic request]) async {
    var url = "$_baseUrl$_endpoint/$id";
    var uri = Uri.parse(url);
    var headers = createHeaders();

    var jsonRequest = jsonEncode(request);

    var response = await http.put(uri, headers: headers, body: jsonRequest);

    if (isValidResponse(response)) {
      var data = jsonDecode(response.body);
      return fromJson(data);
    } else {
      throw Exception("Unknown error");
    }
  }

  Future<T> delete(int id) async {
    var url = '$_baseUrl$_endpoint/$id';
    var uri = Uri.parse(url);
    var headers = createHeaders();

    var response = await http.delete(uri, headers: headers);

    if (isValidResponse(response)) {
      var data = jsonDecode(response.body);
      return fromJson(data);
    } else {
      throw Exception('Unknown error');
    }
  }

  T fromJson(data) {
    throw Exception("Metod not implemented");
  }

  bool isValidResponse(Response response) {
    if (response.statusCode < 299) {
      return true;
    } else if (response.statusCode == 401) {
      navigateToLoginPage();
      return false;
    } else {
      throw Exception("Something bad happened please try again");
    }
  }

  void navigateToLoginPage() {
    navigatorKey.currentState!.pushReplacementNamed('/login');
  }

  Map<String, String> createHeaders() {
    var token = UserSingleton().jwtToken ?? "";
    return {
      "Content-Type": "application/json",
      "Authorization": 'Bearer ' + (UserSingleton().jwtToken ?? 'default_token')
    };
  }

  String getQueryString(Map params,
      {String prefix = '&', bool inRecursion = false}) {
    String query = '';
    params.forEach((key, value) {
      if (inRecursion) {
        if (key is int) {
          key = '[$key]';
        } else if (value is List || value is Map) {
          key = '.$key';
        } else {
          key = '.$key';
        }
      }
      if (value is String || value is int || value is double || value is bool) {
        var encoded = value;
        if (value is String) {
          encoded = Uri.encodeComponent(value);
        }
        query += '$prefix$key=$encoded';
      } else if (value is DateTime) {
        query += '$prefix$key=${(value).toIso8601String()}';
      } else if (value is List || value is Map) {
        if (value is List) value = value.asMap();
        value.forEach((k, v) {
          query +=
              getQueryString({k: v}, prefix: '$prefix$key', inRecursion: true);
        });
      }
    });
    return query;
  }

  Future<LoginResponse> loginUser(String username, String password) async {
    var url = "$_baseUrl/Login?username=$username&password=$password";
    final uri = Uri.parse(url);

    final response =
        await http.post(uri, headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      LoginResponse loginResponse =
          LoginResponse.fromJson(data['loginResponse']);

      UserSingleton().jwtToken = loginResponse.token;

      return loginResponse;
    } else {
      throw Exception('Error during login: ${response.body}');
    }
  }

  Future createUser(Map<String, dynamic> requestBody) async {
    var url1 = "$_baseUrl$_endpoint/Register";
    final url = Uri.parse(url1);

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return fromJson(data);
    }
  }
}

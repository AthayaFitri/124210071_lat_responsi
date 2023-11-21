// ignore_for_file: constant_identifier_names, avoid_print

import '../utils/space_flight_blog.dart';
import '../utils/space_flight_news.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../utils/space_flight_report.dart';

class ApiSource {
  static const _News =
      'https://api.spaceflightnewsapi.net/v4/articles/?format=json';

  static const _Blogs =
      'https://api.spaceflightnewsapi.net/v4/blogs/?format=json';

  static const _Reports =
      'https://api.spaceflightnewsapi.net/v4/flightReports/?format=json';

  Future<List<FlightNew>> getNews() async {
    final response = await http.get(Uri.parse(_News));

    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      print(decodeData);
      return decodeData.map((data) => FlightNew.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load datas :(');
    }
  }

  Future<List<FlightBlog>> getBlogs() async {
    final response = await http.get(Uri.parse(_Blogs));

    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      print(decodeData);
      return decodeData.map((data) => FlightBlog.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load datas :(');
    }
  }

  Future<List<FlightReport>> getReports() async {
    final response = await http.get(Uri.parse(_Reports));

    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      print(decodeData);
      return decodeData.map((data) => FlightReport.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load datas :(');
    }
  }
}

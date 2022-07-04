import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

import '../models/museum_model.dart';

class APIService {
  Logger logger = Logger();

  Future<List<MuseumModel>> getMuseums() async {
    try {
      String _path = "http://192.168.0.23:8000/API/museums/";
      Uri _uri = Uri.parse(_path);
      http.Response response = await http.get(_uri);
      //print(response.statusCode);
      if (response.statusCode == 200) {
        String source = const Utf8Decoder().convert(response.bodyBytes);
        List museums = json.decode(source);
        List<MuseumModel> museumsModelList =
            museums.map((e) => MuseumModel.fromJson(e)).toList();
        // print(museumsModelList);
        return museumsModelList;
      }
      return [];
    } on TimeoutException catch (error) {
      logger.w(error);
      return Future.error("Error: TimeoutException");
      logger.w(error);
    } on SocketException catch (error) {
      logger.w(error);
      return Future.error("Error: SocketException");
    } on FormatException catch (error) {
      logger.w(error);
      return Future.error("Error: FormatException");
    } on Error catch (error) {
      logger.i(error);
      return Future.error("Error");
    }
  }
}

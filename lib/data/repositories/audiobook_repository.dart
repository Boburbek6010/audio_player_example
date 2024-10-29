import 'dart:developer';

import 'package:dio/dio.dart';

import '../../utils/constants.dart';
import '../models/audiobook_model.dart';

class AudiobookRepository {
  final Dio dio;

  AudiobookRepository(this.dio);

  Future<List<AudiobookModel>> fetchAudiobooks() async {
    final response = await dio.get('${Constants.baseUrl}${Constants.audiobookListEndpoint}');
    log(response.toString());
    final List<AudiobookModel> audiobooks = (response.data['books'] as List).map((json) => AudiobookModel.fromJson(json)).toList();
    return audiobooks;
  }
}

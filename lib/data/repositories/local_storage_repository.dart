import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageRepository {
  Future<void> saveLastPlayed(String audioUrl, int position) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('last_played_audio', audioUrl);
    await prefs.setInt('last_played_position', position);
  }

  Future<String?> getLastPlayedAudio() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('last_played_audio');
  }

  Future<int> getLastPlayedPosition() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('last_played_position') ?? 0;
  }
}

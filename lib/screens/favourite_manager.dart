import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class FavoriteJobsManager {
  static const _favoriteJobsKey = 'favoriteJobs';

  static List<Map<String, dynamic>> favoriteJobs = [];

  static Future<void> init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favoriteJobsJson = prefs.getStringList(_favoriteJobsKey);
    if (favoriteJobsJson != null) {
      favoriteJobs = favoriteJobsJson.map((jobJson) {
        return Map<String, dynamic>.from(json.decode(jobJson));
      }).toList();
    }
  }

  static Future<void> saveFavoriteJobs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteJobsJson = favoriteJobs.map((job) {
      return json.encode(job);
    }).toList();
    await prefs.setStringList(_favoriteJobsKey, favoriteJobsJson);
  }

  static void addFavoriteJob(Map<String, dynamic> job) {
    if (!favoriteJobs.contains(job)) {
      favoriteJobs.add(job);
      saveFavoriteJobs();
    }
  }

  static void removeFavoriteJob(Map<String, dynamic> job) {
    favoriteJobs.remove(job);
    saveFavoriteJobs();
  }

  static bool isJobFavorite(Map<String, dynamic> job) {
    return favoriteJobs.contains(job);
  }
}

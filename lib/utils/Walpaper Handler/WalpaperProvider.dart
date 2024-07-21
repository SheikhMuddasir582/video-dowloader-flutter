import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class PhotosProvider extends ChangeNotifier {
  List<dynamic> _photos = [];

  List<dynamic> get photos => _photos;

  Future<void> fetchPhotos(String searchTerm) async {
    final uri = Uri.parse('https://api.pexels.com/v1/search');
    final response = await http.get(
      uri.replace(queryParameters: {'per_page': '100', 'query': searchTerm}),
      headers: {
        'Authorization':
            '0d63zYTkmg817xHEPgDbKBjtebDCbSHvTSUWDVCIlNCgUL50sqe4g0lo', // Replace with your actual API key
      },
    );

    if (response.statusCode == 200) {
      try {
        final data = json.decode(response.body);
        _photos = data['photos'] as List<dynamic>;
        notifyListeners(); // Notify listeners (widgets) of data change
      } on FormatException catch (e) {
        print("Error parsing JSON: $e");
        _photos = []; // Set empty list on error
        notifyListeners();
      }
    } else {
      throw Exception(
          'Failed to load photos (Status Code: ${response.statusCode})');
    }
  }
}

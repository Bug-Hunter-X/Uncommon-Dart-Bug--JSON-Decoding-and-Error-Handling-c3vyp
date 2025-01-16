```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Map<String, dynamic>>?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      if (jsonData is List) {
        return jsonData.cast<Map<String, dynamic>>();
      } else {
        print('Warning: Unexpected JSON structure. Expected a List.');
        return null; // Or throw a custom exception
      }
    } else {
      throw Exception('Failed to load data: Status code ${response.statusCode}');
    }
  } catch (e) {
    print('Error fetching data: $e');
    // Consider adding retry logic here
    return null; 
  }
}
```
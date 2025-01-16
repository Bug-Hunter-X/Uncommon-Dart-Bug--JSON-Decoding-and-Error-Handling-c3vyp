```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Incorrect JSON decoding, assuming it's always a list
      final data = jsonDecode(response.body) as List<dynamic>; 
      // ... process data ...
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    print('Error: $e');
    // No proper error handling or retry mechanism
  }
}
```
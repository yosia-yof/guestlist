

import 'dart:convert';
import 'package:http/http.dart' as http;

String link = "https://raw.githubusercontent.com/yosia-yof/guestlist/refs/heads/main/guestList.json";



//fetching data
Future<Map<String, dynamic>> fetchJsonData() async {
  final url = Uri.parse(link);
  final response = await http.get(url);

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception("Failed to load JSON");
  }
}



//retrieving data
Future<void> modifyJson() async {
  Map<String, dynamic> jsonData = await fetchJsonData();

  // Modify JSON
  jsonData["newKey"] = "newValue";

  print(json.encode(jsonData));
}




//modifying data
Future<void> updateJsonOnGitHub(String updatedJson) async {
  final token = "your_github_personal_access_token";
  final url = Uri.parse(link);

  // Get SHA (required for updating)
  final response = await http.get(url, headers: {
    "Authorization": "token $token",
    "Accept": "application/vnd.github.v3+json"
  });

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    final sha = data['sha'];

    // Commit new content
    final updateResponse = await http.put(
      url,
      headers: {
        "Authorization": "token $token",
        "Accept": "application/vnd.github.v3+json",
      },
      body: json.encode({
        "message": "Update JSON via Flutter",
        "content": base64Encode(utf8.encode(updatedJson)),
        "sha": sha
      }),
    );

    if (updateResponse.statusCode == 200 || updateResponse.statusCode == 201) {
      print("JSON updated successfully!");
    } else {
      print("Failed to update JSON: ${updateResponse.body}");
    }
  } else {
    print("Failed to fetch file details: ${response.body}");
  }
}

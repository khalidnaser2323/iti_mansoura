import 'package:http/http.dart' as http;

class HttpHandler {
  Future<String> getMethod(String endpoint,
      {Map<String, String>? headers}) async {
    try {
      print("endpoint: $endpoint");
      Uri url = Uri.parse(endpoint);
      http.Response response = await http.get(url, headers: headers);
      print(
          "Get response: statusCode: ${response.statusCode}, body ${response.body}");
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Error.safeToString('Something wrong happend');
      }
    } catch (error) {
      print("Http get error ${error.toString()}");
      throw Error.safeToString('Something wrong happend');
    }
  }

  Future<dynamic> postMethod() async {}
}

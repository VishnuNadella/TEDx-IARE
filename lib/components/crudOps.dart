import "package:http/http.dart" as http;

const String baseUrl = "https://certgen.deta.dev/";

class CrudOps {
  var client = http.Client();

  Future<dynamic> get(String api) async {
    var url = Uri.parse(baseUrl + api);
    var _headers = {
      ""
    };
    var response = await client.get(url);
    if (response.statusCode == 200){
      return response.body;
    } else {

    }

  }
  Future<dynamic> post() async {}
  Future<dynamic> put() async {}
  Future<dynamic> delete() async {}
}
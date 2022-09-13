import 'package:http/http.dart' as http;
import 'package:mobile_app/app/data/api_config.dart';

class ApiClassificationServices {
  Future<http.Response> getMainClassification(String symptomsValue) async {
    Uri uri = Uri.parse("${ApiConfig.mainClassification}?symptoms=$symptomsValue");
    try {
      return await http.get(
        uri,
        headers: {"content-type": "application/json"},
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<http.Response> getVariantClassification(String symptomsValue) async {
    Uri uri = Uri.parse("${ApiConfig.variantClassification}?symptoms=$symptomsValue");
    try {
      return await http.get(
        uri,
        headers: {"content-type": "application/json"},
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}

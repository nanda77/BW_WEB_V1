import 'package:buildworks/worksmodule/models/work_titles_model.dart';
import 'package:http/http.dart' as http;

//http://api.buildworks.in/v1/get-work-list?project_id=c439a236b5c6ddb3fcd8130c00d5f890&member_id=f91c8f6f5c2f276de00e250fa4f31966&category_id=4c20b1cfa01e7aaa689658400b50154b

class WorkTitlesApiService {
  static var client = http.Client();

  static Future<List<WorkTitlesModel>> fetchWorkTitles() async {
    var response = await client
        .get(Uri.parse('http://api.buildworks.in/v1/get-work-list')); //
    if (response.statusCode == 1) {
      var jsonString = response.body;
      return workTitlesFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }
}

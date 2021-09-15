import 'package:buildworks/apimodule/work_api_service.dart';
import 'package:buildworks/worksmodule/models/work_titles_model.dart';
import 'package:buildworks/worksmodule/views/work_titles_view.dart';
import 'package:get/get.dart';

class WorkTitlesController extends GetxController {
  var isLoading = true.obs;
  var workTitlesList = <WorkTitlesModel>[].obs;

  @override
  void onInit() {
    fetchWorkTitles();
    super.onInit();
  }

  void fetchWorkTitles() async {
    try {
      isLoading(true);
      var worksTitles = await WorkTitlesApiService.fetchWorkTitles();
      if (worksTitles != null) {
        workTitlesList.assignAll(worksTitles);
      }
    } finally {
      isLoading(false);
    }
  }
}

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/base_controller.dart';
import '../../../../../functions/helper_classes.dart';

class NonRcuTemplateReviewRequestController extends BaseController {
  var uploadFilesList = <UploadFile>[UploadFile()].obs;
  TextEditingController projectNameController = TextEditingController();
  TextEditingController projectDescriptionController = TextEditingController();
  var commentsList = <Comment>[Comment()].obs;

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      withData: true,
      allowedExtensions: ['gif', 'jpg', 'png', 'jpeg'],
    );
    if (result == null || result.files.isEmpty) return;
    result = FilePickerResult(result.files);
    if (result.files.first.size > 800000) {
      throw Exception("File size should not exceed 800KB");
    }

    if (result.files.first.bytes != null && result.files.first.path != null) {
      uploadFilesList.add(
        UploadFile(
          name: result.files.first.name,
          size: result.files.first.size.toString(),
          path: result.files.first.path!,
          fileExtension: result.files.first.extension!,
        ),
      );
      print("file added ${result.files.first.name}");
    }
  }
  void addUploadFile() {
    try {
      pickFile();
    } catch (e) {
      print(e);
    }
  }



  void addComment() {
    commentsList.add(Comment());
  }
}
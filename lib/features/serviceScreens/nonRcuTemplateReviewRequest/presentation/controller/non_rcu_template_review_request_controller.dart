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
  final isSubmitEnabled = false.obs;

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
          size: convertFileSize(result.files.first.size),
          path: result.files.first.path!,
          fileExtension: result.files.first.extension!,
        ),
      );
      print("file added ${result.files.first.name}");
    }
    update();
  }
  void addUploadFile() {
    try {
      pickFile();
    } catch (e) {
      print(e);
    }
  }

  void _initializeValidation() {
    // List of controllers
    final controllers = [
      projectDescriptionController,
      projectNameController,
    ];

    for (var controller in controllers) {
      controller.addListener(_validateForm);
    }

  }

  // Form validation logic
  void _validateForm() {
    final areTextFieldsValid = [

      projectNameController.text.trim(),
      projectDescriptionController.text.trim(),
    ].every((field) => field.isNotEmpty);


    isSubmitEnabled.value = areTextFieldsValid ;
  }

  @override
  void onClose() {
    projectNameController.dispose();
    projectDescriptionController.dispose();
    super.onClose();
  }

  @override
  void onInit() async {
    super.onInit();
    uploadFilesList.removeAt(0);
    getDetailsScreenData();
    _initializeValidation();
  }

  void addComment() {
    commentsList.add(Comment());
  }
  late Request request;
  getDetailsScreenData(){
    request = Request(role: 'HR Manager',
      description : "This service allows business domains to",
      requestFor : 'Ali Al Ghafli',
      pendingOn: 'Ali Al Ghafli',
      status: 'Pending',
      requestId: 'REQ 122812',
      managementApproval: "text",
      approvalAuthority: "text",
      authorizedPersonal: "text",
      comments: [
        Comment(attachment: "",
            date: "Date",
            fileSize: "1.2 MB",
            message: "Hi mohamed, i can't approve your request."
                "i need an attachment to further approve your request.",
            name: "Ahmed Ammar",
            role: "HR Manager" )
      ],
      etaWorkingDays: "4 business days",
      expectedClosingDate: "11/12/2026",
      externalApproval: "text",
      parties: [
        Party(
          name: "Party1",
          category: "Tenant",
          type: "Person",
        )
      ],
      projectImplementationYear: "2025",
      projectName: "Project name",
      similarProjects: "text",
      value: "text",
    );
  }


  String convertFileSize(int sizeInBytes) {
    if (sizeInBytes < 1024) {
      return '$sizeInBytes Bytes';
    } else if (sizeInBytes < 1024 * 1024) {
      return '${(sizeInBytes / 1024).toStringAsFixed(2)} KB';
    } else if (sizeInBytes < 1024 * 1024 * 1024) {
      return '${(sizeInBytes / (1024 * 1024)).toStringAsFixed(2)} MB';
    } else {
      return '${(sizeInBytes / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB';
    }
  }
}
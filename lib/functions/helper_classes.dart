class Party {
  String type;
  String name;
  String category;

  Party({this.type = "person", this.name = "", this.category = ""});
}

class UploadFile {

  String name;
  String size;
  String path;
  String fileExtension;

  UploadFile({this.name = "", this.size = "", this.path = "", this.fileExtension = ""});
}

class Comment {

  final String name;
  final String role;
  final String date;
  final String message;
  final String? attachment;
  final String? fileSize;

  Comment({this.name = "", this.role="",
    this.attachment="", this.date="", this.fileSize="", this.message=""});
}

class Request {
  String role;
  String status;
  String requestId;
  String etaWorkingDays;
  String projectName;
  String projectImplementationYear;
  String value;
  String managementApproval;
  String externalApproval;
  String approvalAuthority;
  String expectedClosingDate;
  String authorizedPersonal;
  String similarProjects;
  String requestFor ;
  String pendingOn;
  String? description;
  String? projectDuration;
  String? projectOwner;
  String? paymentStructure;
  List<Party> parties;
  List<Comment> comments;

  Request({
    required this.pendingOn,
    required this.requestFor,
    required this.role,
    required this.status,
    required this.requestId,
    required this.etaWorkingDays,
    required this.projectName,
    required this.projectImplementationYear,
    required this.value,
    required this.managementApproval,
    required this.externalApproval,
    required this.approvalAuthority,
    required this.expectedClosingDate,
    required this.authorizedPersonal,
    required this.similarProjects,
    required this.parties,
    required this.comments,
    this.description,
    this.projectDuration,
    this.projectOwner,
    this.paymentStructure,
  });
}
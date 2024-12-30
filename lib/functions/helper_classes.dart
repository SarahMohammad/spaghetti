class Party {
  String type;
  String name;
  String category;

  Party({this.type = "person", this.name = "", this.category = ""});
}

class UploadFile {

  String name;
  String size;

  UploadFile({this.name = "", this.size = ""});
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

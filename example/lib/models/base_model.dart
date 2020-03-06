class BaseModel {
  bool status;
  String message;

//  BaseResponse();

  BaseModel(
    this.status,
    this.message,
  );

  BaseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] as bool;
    message = json['message'] as String;
  }

  Map<String, dynamic> toMap() => {
        'status': status,
        'message': message,
      };
}

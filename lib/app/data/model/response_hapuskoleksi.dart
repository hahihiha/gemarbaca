/// status : 200
/// message : "success"
/// data : {"id":10,"user_id":14,"book_id":7,"created_at":"2024-04-21T18:49:26.000000Z","updated_at":"2024-04-21T18:49:26.000000Z"}

class ResponseHapuskoleksi {
  ResponseHapuskoleksi({
      this.status, 
      this.message, 
      this.data,});

  ResponseHapuskoleksi.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? HapusKoleksi.fromJson(json['data']) : null;
  }
  int? status;
  String? message;
  HapusKoleksi? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// id : 10
/// user_id : 14
/// book_id : 7
/// created_at : "2024-04-21T18:49:26.000000Z"
/// updated_at : "2024-04-21T18:49:26.000000Z"

class HapusKoleksi {
  HapusKoleksi({
      this.id, 
      this.userId, 
      this.bookId, 
      this.createdAt, 
      this.updatedAt,});

  HapusKoleksi.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    bookId = json['book_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  int? userId;
  int? bookId;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['book_id'] = bookId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}
/// status : 201
/// message : "success"
/// data : {"nama":"Fav","username":"fav","telp":"08129391845","alamat":"Surakarta","role":"PEMINJAM","updated_at":"2024-02-19T07:28:24.000000Z","created_at":"2024-02-19T07:28:24.000000Z","id":5}

class ResponseRegister {
  ResponseRegister({
      this.status, 
      this.message, 
      this.data,});

  ResponseRegister.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? DataRegister.fromJson(json['data']) : null;
  }
  int? status;
  String? message;
  DataRegister? data;

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

/// nama : "Fav"
/// username : "fav"
/// telp : "08129391845"
/// alamat : "Surakarta"
/// role : "PEMINJAM"
/// updated_at : "2024-02-19T07:28:24.000000Z"
/// created_at : "2024-02-19T07:28:24.000000Z"
/// id : 5

class DataRegister {
  DataRegister({
      this.nama, 
      this.username, 
      this.telp, 
      this.alamat, 
      this.role, 
      this.updatedAt, 
      this.createdAt, 
      this.id,});

  DataRegister.fromJson(dynamic json) {
    nama = json['nama'];
    username = json['username'];
    telp = json['telp'];
    alamat = json['alamat'];
    role = json['role'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }
  String? nama;
  String? username;
  String? telp;
  String? alamat;
  String? role;
  String? updatedAt;
  String? createdAt;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['nama'] = nama;
    map['username'] = username;
    map['telp'] = telp;
    map['alamat'] = alamat;
    map['role'] = role;
    map['updated_at'] = updatedAt;
    map['created_at'] = createdAt;
    map['id'] = id;
    return map;
  }

}
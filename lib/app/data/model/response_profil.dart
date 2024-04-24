class ResponseProfil {
  ResponseProfil({
    this.status,
    this.message,
    this.data,
  });

  ResponseProfil.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? DataProfil.fromJson(json['data']) : null;
  }
  num? status;
  String? message;
  DataProfil? data;

  ResponseProfil copyWith({
    num? status,
    String? message,
    DataProfil? data,
  }) =>
      ResponseProfil(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DataProfil {
  DataProfil({
    this.id,
    this.username,
    this.nama,
    this.telp,
    this.alamat,
    this.role,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  DataProfil.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    nama = json['nama'];
    telp = json['telp'];
    alamat = json['alamat'];
    role = json['role'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? username;
  String? nama;
  String? telp;
  String? alamat;
  String? role;
  String? image;
  String? createdAt;
  String? updatedAt;

  DataProfil copyWith({
    num? id,
    String? username,
    String? nama,
    String? telp,
    String? alamat,
    String? role,
    String? image,
    String? createdAt,
    String? updatedAt,
  }) =>
      DataProfil(
        id: id ?? this.id,
        username: username ?? this.username,
        nama: nama ?? this.nama,
        telp: telp ?? this.telp,
        alamat: alamat ?? this.alamat,
        role: role ?? this.role,
        image: image ?? this.image,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['nama'] = this.nama;
    data['telp'] = this.telp;
    data['alamat'] = this.alamat;
    data['role'] = this.role;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
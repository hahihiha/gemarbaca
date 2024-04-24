/// status : 200
/// message : "success"
/// data : [{"id":10,"kategori_id":1,"judul":"Mudah Menguasai PHP & MySQL dalam 24 Jam","image":"http://192.168.6.212:8000/images/belajarphp.png","penulis":"Risawandi","penerbit":"Unimal Press","tahun_terbit":2019,"deskripsi":"Buku ini berisi tentang pemrograman PHP dan MySQL","created_at":"2024-03-25T04:30:08.000000Z","updated_at":"2024-03-25T04:30:08.000000Z","kategori":{"id":1,"nama":"Pendidikan"}},{"id":9,"kategori_id":1,"judul":"Web Programming","image":"http://192.168.6.212:8000/images/web-programming.png","penulis":"Ani Oktarini Sari, Ari Abdilah, Sunarti","penerbit":"Graha Ilmu","tahun_terbit":2019,"deskripsi":"Buku ini berisi tentang materi pemrograman website","created_at":"2024-03-25T04:28:06.000000Z","updated_at":"2024-03-25T04:28:06.000000Z","kategori":{"id":1,"nama":"Pendidikan"}}]

class ResponseBuku {
  ResponseBuku({
      this.status, 
      this.message, 
      this.data,});

  ResponseBuku.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataBuku.fromJson(v));
      });
    }
  }
  int? status;
  String? message;
  List<DataBuku>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 10
/// kategori_id : 1
/// judul : "Mudah Menguasai PHP & MySQL dalam 24 Jam"
/// image : "http://192.168.6.212:8000/images/belajarphp.png"
/// penulis : "Risawandi"
/// penerbit : "Unimal Press"
/// tahun_terbit : 2019
/// deskripsi : "Buku ini berisi tentang pemrograman PHP dan MySQL"
/// created_at : "2024-03-25T04:30:08.000000Z"
/// updated_at : "2024-03-25T04:30:08.000000Z"
/// kategori : {"id":1,"nama":"Pendidikan"}

class DataBuku {
  DataBuku({
      this.id, 
      this.kategoriId, 
      this.judul, 
      this.image, 
      this.penulis, 
      this.penerbit, 
      this.tahunTerbit, 
      this.deskripsi, 
      this.createdAt, 
      this.updatedAt, 
      this.kategori,});

  DataBuku.fromJson(dynamic json) {
    id = json['id'];
    kategoriId = json['kategori_id'];
    judul = json['judul'];
    image = json['image'];
    penulis = json['penulis'];
    penerbit = json['penerbit'];
    tahunTerbit = json['tahun_terbit'];
    deskripsi = json['deskripsi'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    kategori = json['kategori'] != null ? Kategori.fromJson(json['kategori']) : null;
  }
  int? id;
  int? kategoriId;
  String? judul;
  String? image;
  String? penulis;
  String? penerbit;
  int? tahunTerbit;
  String? deskripsi;
  String? createdAt;
  String? updatedAt;
  Kategori? kategori;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['kategori_id'] = kategoriId;
    map['judul'] = judul;
    map['image'] = image;
    map['penulis'] = penulis;
    map['penerbit'] = penerbit;
    map['tahun_terbit'] = tahunTerbit;
    map['deskripsi'] = deskripsi;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (kategori != null) {
      map['kategori'] = kategori?.toJson();
    }
    return map;
  }

}

/// id : 1
/// nama : "Pendidikan"

class Kategori {
  Kategori({
      this.id, 
      this.nama,});

  Kategori.fromJson(dynamic json) {
    id = json['id'];
    nama = json['nama'];
  }
  int? id;
  String? nama;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['nama'] = nama;
    return map;
  }

}
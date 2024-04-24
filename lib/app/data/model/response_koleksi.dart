class ResponseKoleksi {
  ResponseKoleksi({
    required num? status,
    required String? message,
    required List<DataKoleksi>? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  ResponseKoleksi.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data!.add(DataKoleksi.fromJson(v));
      });
    }
  }

  num? _status;
  String? _message;
  List<DataKoleksi>? _data;

  ResponseKoleksi copyWith({
    num? status,
    String? message,
    List<DataKoleksi>? data,
  }) =>
      ResponseKoleksi(
        status: status ?? _status,
        message: message ?? _message,
        data: data ?? _data,
      );

  num? get status => _status;
  String? get message => _message;
  List<DataKoleksi>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class DataKoleksi {
  DataKoleksi({
    required num? id,
    required num? userId,
    required num? bookId,
    required String? createdAt,
    required String? updatedAt,
    required Book? book,
  }) {
    _id = id;
    _userId = userId;
    _bookId = bookId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _book = book;
  }

  DataKoleksi.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _bookId = json['book_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _book = json['book'] != null ? Book.fromJson(json['book']) : null;
  }

  num? _id;
  num? _userId;
  num? _bookId;
  String? _createdAt;
  String? _updatedAt;
  Book? _book;

  DataKoleksi copyWith({
    num? id,
    num? userId,
    num? bookId,
    String? createdAt,
    String? updatedAt,
    Book? book,
  }) =>
      DataKoleksi(
        id: id ?? _id,
        userId: userId ?? _userId,
        bookId: bookId ?? _bookId,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        book: book ?? _book,
      );

  num? get id => _id;
  num? get userId => _userId;
  num? get bookId => _bookId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  Book? get book => _book;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['book_id'] = _bookId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_book != null) {
      map['book'] = _book!.toJson();
    }
    return map;
  }
}

class Book {
  Book({
    required num? id,
    required String? judul,
    required String? image,
    required String? penulis,
    required String? penerbit,
    required num? tahunTerbit,
    required String? deskripsi,
    required num? kategoriId,
    required Kategori? kategori,
  }) {
    _id = id;
    _judul = judul;
    _image = image;
    _penulis = penulis;
    _penerbit = penerbit;
    _tahunTerbit = tahunTerbit;
    _deskripsi = deskripsi;
    _kategoriId = kategoriId;
    _kategori = kategori;
  }

  Book.fromJson(dynamic json) {
    _id = json['id'];
    _judul = json['judul'];
    _image = json['image'];
    _penulis = json['penulis'];
    _penerbit = json['penerbit'];
    _tahunTerbit = json['tahun_terbit'];
    _deskripsi = json['deskripsi'];
    _kategoriId = json['kategori_id'];
    _kategori = json['kategori'] != null ? Kategori.fromJson(json['kategori']) : null;
  }

  num? _id;
  String? _judul;
  String? _image;
  String? _penulis;
  String? _penerbit;
  num? _tahunTerbit;
  String? _deskripsi;
  num? _kategoriId;
  Kategori? _kategori;

  Book copyWith({
    num? id,
    String? judul,
    String? image,
    String? penulis,
    String? penerbit,
    num? tahunTerbit,
    String? deskripsi,
    num? kategoriId,
    Kategori? kategori,
  }) =>
      Book(
        id: id ?? _id,
        judul: judul ?? _judul,
        image: image ?? _image,
        penulis: penulis ?? _penulis,
        penerbit: penerbit ?? _penerbit,
        tahunTerbit: tahunTerbit ?? _tahunTerbit,
        deskripsi: deskripsi ?? _deskripsi,
        kategoriId: kategoriId ?? _kategoriId,
        kategori: kategori ?? _kategori,
      );

  num? get id => _id;
  String? get judul => _judul;
  String? get image => _image;
  String? get penulis => _penulis;
  String? get penerbit => _penerbit;
  num? get tahunTerbit => _tahunTerbit;
  String? get deskripsi => _deskripsi;
  num? get kategoriId => _kategoriId;
  Kategori? get kategori => _kategori;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['judul'] = _judul;
    map['image'] = _image;
    map['penulis'] = _penulis;
    map['penerbit'] = _penerbit;
    map['tahun_terbit'] = _tahunTerbit;
    map['deskripsi'] = _deskripsi;
    map['kategori_id'] = _kategoriId;
    if (_kategori != null) {
      map['kategori'] = _kategori!.toJson();
    }
    return map;
  }
}

class Kategori {
  Kategori({
    required num? id,
    required String? nama,
  }) {
    _id = id;
    _nama = nama;
  }

  Kategori.fromJson(dynamic json) {
    _id = json['id'];
    _nama = json['nama'];
  }

  num? _id;
  String? _nama;

  Kategori copyWith({
    num? id,
    String? nama,
  }) =>
      Kategori(
        id: id ?? _id,
        nama: nama ?? _nama,
      );

  num? get id => _id;
  String? get nama => _nama;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['nama'] = _nama;
    return map;
  }
}

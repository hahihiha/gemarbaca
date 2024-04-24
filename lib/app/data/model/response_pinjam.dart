class ResponsePinjam {
  ResponsePinjam({
    this.status,
    this.message,
    this.data,
  });

  factory ResponsePinjam.fromJson(Map<String, dynamic> json) => ResponsePinjam(
    status: json['status'] as num,
    message: json['message'] as String,
    data: (json['data'] as List?)
        ?.map((dynamic e) => DataPinjam.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  final num? status;
  final String? message;
  final List<DataPinjam>? data;

  ResponsePinjam copyWith({
    num? status,
    String? message,
    List<DataPinjam>? data,
  }) =>
      ResponsePinjam(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data?.map((e) => e.toJson()).toList(),
  };
}

class DataPinjam {
  DataPinjam({
    this.id,
    this.userId,
    this.bookId,
    this.tanggalPinjam,
    this.tanggalKembali,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.book,
  });

  factory DataPinjam.fromJson(Map<String, dynamic> json) => DataPinjam(
    id: json['id'] as num?,
    userId: json['user_id'] as num?,
    bookId: json['book_id'] as num?,
    tanggalPinjam: json['tanggal_pinjam'] as String?,
    tanggalKembali: json['tanggal_kembali'] as String?,
    status: json['status'] as String?,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
    book: json['book'] == null
        ? null
        : Book.fromJson(json['book'] as Map<String, dynamic>),
  );

  final num? id;
  final num? userId;
  final num? bookId;
  final String? tanggalPinjam;
  final String? tanggalKembali;
  final String? status;
  final String? createdAt;
  final String? updatedAt;
  final Book? book;

  DataPinjam copyWith({
    num? id,
    num? userId,
    num? bookId,
    String? tanggalPinjam,
    String? tanggalKembali,
    String? status,
    String? createdAt,
    String? updatedAt,
    Book? book,
  }) =>
      DataPinjam(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        bookId: bookId ?? this.bookId,
        tanggalPinjam: tanggalPinjam ?? this.tanggalPinjam,
        tanggalKembali: tanggalKembali ?? this.tanggalKembali,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        book: book ?? this.book,
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'user_id': userId,
    'book_id': bookId,
    'tanggal_pinjam': tanggalPinjam,
    'tanggal_kembali': tanggalKembali,
    'status': status,
    'created_at': createdAt,
    'updated_at': updatedAt,
    'book': book?.toJson(),
  };
}

class Book {
  Book({
    this.id,
    this.kategoriId,this.judul,
    this.image,
    this.penulis,
    this.penerbit,
    this.tahunTerbit,
    this.deskripsi,
    this.createdAt,
    this.updatedAt,
  });

  factory Book.fromJson(Map<String, dynamic> json) => Book(
    id: json['id'] as num?,
    kategoriId: json['kategori_id'] as num?,
    judul: json['judul'] as String?,
    image: json['image'] as String?,
    penulis: json['penulis'] as String?,
    penerbit: json['penerbit'] as String?,
    tahunTerbit: json['tahun_terbit'] as num?,
    deskripsi: json['deskripsi'] as String?,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
  );

  final num? id;
  final num? kategoriId;
  final String? judul;
  final String? image;
  final String? penulis;
  final String? penerbit;
  final num? tahunTerbit;
  final String? deskripsi;
  final String? createdAt;
  final String? updatedAt;

  Book copyWith({
    num? id,
    num? kategoriId,
    String? judul,
    String? image,
    String? penulis,
    String? penerbit,
    num? tahunTerbit,
    String? deskripsi,
    String? createdAt,
    String? updatedAt,
  }) =>
      Book(
        id: id ?? this.id,
        kategoriId: kategoriId ?? this.kategoriId,
        judul: judul ?? this.judul,
        image: image ?? this.image,
        penulis: penulis ?? this.penulis,
        penerbit: penerbit ?? this.penerbit,
        tahunTerbit: tahunTerbit ?? this.tahunTerbit,
        deskripsi: deskripsi ?? this.deskripsi,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'kategori_id': kategoriId,
    'judul': judul,
    'image': image,
    'penulis': penulis,
    'penerbit': penerbit,
    'tahun_terbit': tahunTerbit,
    'deskripsi': deskripsi,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };
}
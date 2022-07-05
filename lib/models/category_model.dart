// ignore_for_file: non_constant_identifier_names

class CategoryModel {
  int id;
  String nama_kategori;

  CategoryModel({
    this.id,
    this.nama_kategori,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama_kategori = json['nama_kategori'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama_kategori': nama_kategori,
    };
  }
}

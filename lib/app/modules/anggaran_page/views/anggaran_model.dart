class AnggaranModel {
  final int? id;
  final String nama;
  final int jumlah;

  AnggaranModel({this.id, required this.nama, required this.jumlah});

  factory AnggaranModel.fromMap(Map<String, dynamic> map) {
    return AnggaranModel(
      id: map['id'],
      nama: map['nama'],
      jumlah: map['jumlah'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
      'jumlah': jumlah,
    };
  }
}

import 'package:get/get.dart';
import 'package:moni_clone/app/data/db.helper.dart';
import '../views/anggaran_model.dart';

class AnggaranPageController extends GetxController {
  var anggaranList = <AnggaranModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    anggaranList.value = await DBHelper.getAllAnggaran();
  }

  Future<void> addAnggaran(String nama, int jumlah) async {
    final newItem = AnggaranModel(nama: nama, jumlah: jumlah);
    await DBHelper.insertAnggaran(newItem);
    loadData();
  }

  Future<void> deleteAnggaran(int id) async {
    await DBHelper.deleteAnggaran(id);
    loadData();
  }

  Future<void> updateAnggaran(AnggaranModel data) async {
    await DBHelper.updateAnggaran(data);
    loadData();
  }
}

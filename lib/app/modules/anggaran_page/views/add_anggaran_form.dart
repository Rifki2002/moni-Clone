import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moni_clone/app/modules/anggaran_page/views/anggaran_model.dart';
import '../controllers/anggaran_page_controller.dart';

class AddAnggaranForm extends StatefulWidget {
  final AnggaranModel? editData;

  const AddAnggaranForm({super.key, this.editData});

  @override
  State<AddAnggaranForm> createState() => _AddAnggaranFormState();
}

class _AddAnggaranFormState extends State<AddAnggaranForm> {
  final _jumlahController = TextEditingController();

  final List<String> _categories = [
    "Gaji",
    "Makanan",
    "Transportasi",
    "Kesehatan",
    "Hiburan",
    "Lainnya"
  ];

  String? _selectedCategory;

  @override
  void initState() {
    super.initState();
    if (widget.editData != null) {
      _jumlahController.text = widget.editData!.jumlah.toString();
      _selectedCategory = _categories.contains(widget.editData!.nama)
          ? widget.editData!.nama
          : _categories.last;
    } else {
      _selectedCategory = _categories.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Kategori Anggaran",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          DropdownButtonFormField<String>(
            value: _selectedCategory,
            items: _categories.map((category) {
              return DropdownMenuItem(
                value: category,
                child: Text(category),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedCategory = value;
              });
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[100],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 14,
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Jumlah Anggaran (Rp)",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          TextField(
            controller: _jumlahController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "Contoh: 1000000",
              filled: true,
              fillColor: Colors.grey[100],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 14,
              ),
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                final nama = _selectedCategory?.trim() ?? "";
                final jumlah = int.tryParse(_jumlahController.text) ?? 0;

                if (nama.isEmpty || jumlah <= 0) {
                  Get.snackbar("Error", "Data tidak valid");
                  return;
                }

                final controller = Get.find<AnggaranPageController>();

                if (widget.editData != null) {
                  final updated = AnggaranModel(
                    id: widget.editData!.id,
                    nama: nama,
                    jumlah: jumlah,
                  );
                  controller.updateAnggaran(updated);
                } else {
                  controller.addAnggaran(nama, jumlah);
                }

                Get.back();
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                backgroundColor: Colors.lightBlueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                widget.editData != null ? "Update" : "Simpan",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

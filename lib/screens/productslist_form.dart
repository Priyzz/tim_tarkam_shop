import 'package:flutter/material.dart';
import 'package:tim_tarkam_shop/widgets/left_drawer.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:tim_tarkam_shop/screens/products_entry_list.dart';

class ProductsListFormPage extends StatefulWidget {
  const ProductsListFormPage({super.key});

  @override
  State<ProductsListFormPage> createState() => _ProductsListFormPageState();
}

class _ProductsListFormPageState extends State<ProductsListFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _name = "";
  double _price = 0.0;
  String _description = "";
  String _thumbnail = "";
  String _category = "jersey";
  bool _isFeatured = false;
  int _stock = 0;
  String _brand = "";
  String _size = "";
  String _color = "";

  final List<String> _categories = [
    'jersey',
    'shoes',
    'ball',
    'accessories',
    'training',
  ];

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tambah Produk Baru',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 21, 129, 218),
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),

      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // NAME
              _buildInput(
                label: "Nama Produk",
                hint: "Nama Produk",
                validator: "Nama tidak boleh kosong!",
                onChanged: (v) => _name = v,
              ),

              // PRICE
              _buildInput(
                label: "Harga Produk",
                hint: "Harga",
                keyboard: TextInputType.number,
                validator: "Harga tidak boleh kosong!",
                onChanged: (v) => _price = double.tryParse(v) ?? 0,
              ),

              // DESCRIPTION
              _buildInput(
                label: "Deskripsi",
                hint: "Deskripsi Produk",
                maxLines: 3,
                validator: "Deskripsi tidak boleh kosong!",
                onChanged: (v) => _description = v,
              ),

              // THUMBNAIL
              _buildInput(
                label: "Thumbnail (URL)",
                hint: "URL Thumbnail",
                validator: "Thumbnail tidak boleh kosong!",
                onChanged: (v) => _thumbnail = v,
              ),

              // STOCK
              _buildInput(
                label: "Stok Produk",
                hint: "Stok",
                keyboard: TextInputType.number,
                validator: "Stok tidak boleh kosong!",
                onChanged: (v) => _stock = int.tryParse(v) ?? 0,
              ),

              // BRAND
              _buildInput(
                label: "Brand",
                hint: "Brand Produk",
                validator: "Brand tidak boleh kosong!",
                onChanged: (v) => _brand = v,
              ),

              // SIZE
              _buildInput(
                label: "Ukuran",
                hint: "Ukuran Produk (S, M, L, XL, dsb)",
                validator: "Ukuran tidak boleh kosong!",
                onChanged: (v) => _size = v,
              ),

              // COLOR
              _buildInput(
                label: "Warna Produk",
                hint: "Warna (Hitam, Putih, Biru...)",
                validator: "Warna tidak boleh kosong!",
                onChanged: (v) => _color = v,
              ),

              // CATEGORY
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Kategori",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  value: _category,
                  items: _categories
                      .map((cat) => DropdownMenuItem(
                            value: cat,
                            child: Text(cat),
                          ))
                      .toList(),
                  onChanged: (v) => setState(() => _category = v!),
                ),
              ),

              // FEATURED SWITCH
              SwitchListTile(
                title: const Text("Produk Featured"),
                value: _isFeatured,
                onChanged: (value) => setState(() => _isFeatured = value),
              ),

              const SizedBox(height: 20),

              // SAVE BUTTON
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 21, 129, 218),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 60, vertical: 14),
                  ),

                  onPressed: () async {
                    if (!_formKey.currentState!.validate()) return;

                    final response = await request.postJson(
                      "http://localhost:8000/create-product-flutter/",
                      {
                        "name": _name,
                        "description": _description,
                        "thumbnail": _thumbnail,
                        "category": _category,
                        "price": _price,
                        "is_featured": _isFeatured,
                        "stock": _stock,
                        "brand": _brand,
                        "size": _size,
                        "color": _color,
                      },
                    );

                    if (!context.mounted) return;

                    if (response['status'] == 'success') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Produk berhasil disimpan!")),
                      );

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const ProductsEntryListPage()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Terjadi kesalahan, coba lagi.")),
                      );
                    }
                  },

                  child: const Text("Save", style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable Input Generator
  Widget _buildInput({
    required String label,
    required String hint,
    required Function(String) onChanged,
    required String validator,
    TextInputType keyboard = TextInputType.text,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextFormField(
        keyboardType: keyboard,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
        onChanged: (value) => onChanged(value),
        validator: (value) =>
            value == null || value.isEmpty ? validator : null,
      ),
    );
  }
}

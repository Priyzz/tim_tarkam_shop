// lib/widgets/left_drawer.dart
import 'package:flutter/material.dart';
import 'package:tim_tarkam_shop/screens/menu.dart';
import 'package:tim_tarkam_shop/screens/products_entry_list.dart'; // Import halaman list produk
import 'package:tim_tarkam_shop/screens/productslist_form.dart'; // Pastikan import ini ada jika ingin link ke create

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              children: [
                Text(
                  'Tim Tarkam Shop',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Belanja Kebutuhan Tim Tarkam!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MenuPage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Tambah Produk'),
            onTap: () {
               Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProductsListFormPage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: const Text('Daftar Produk'),
            onTap: () {
              // Route menu ke halaman product_list
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProductsEntryListPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
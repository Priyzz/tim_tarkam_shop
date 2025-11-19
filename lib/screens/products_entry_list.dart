import 'package:flutter/material.dart';
import 'package:tim_tarkam_shop/models/products_entry.dart';
import 'package:tim_tarkam_shop/widgets/left_drawer.dart';
import 'package:tim_tarkam_shop/screens/products_detail.dart';
import 'package:tim_tarkam_shop/widgets/products_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class ProductsEntryListPage extends StatefulWidget {
  const ProductsEntryListPage({super.key});

  @override
  State<ProductsEntryListPage> createState() => _ProductsEntryListPageState();
}

class _ProductsEntryListPageState extends State<ProductsEntryListPage> {
  bool _showMyProductsOnly = false;

  Future<List<ProductEntry>> fetchProducts(CookieRequest request) async {
    final endpoint = _showMyProductsOnly ? '/json-my/' : '/json/';
    final response = await request.get('http://localhost:8000$endpoint');

    List<ProductEntry> listProducts = [];
    for (var d in response) {
      if (d != null) {
        listProducts.add(ProductEntry.fromJson(d));
      }
    }

    return listProducts;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      backgroundColor: const Color(0xFFE0E5EC),
      appBar: AppBar(
        title: const Text(
          'Products',
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: const Color(0xFFE0E5EC),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
        actions: [
          Row(
            children: [
              const Text(
                'My Products Only',
                style: TextStyle(color: Colors.black87),
              ),
              Switch(
                value: _showMyProductsOnly,
                onChanged: (value) {
                  setState(() {
                    _showMyProductsOnly = value;
                  });
                },
              ),
            ],
          ),
        ],
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProducts(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'There are no products available.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: snapshot.data!.length,
            itemBuilder: (_, index) {
              final product = snapshot.data![index];

              return Padding(
                padding: const EdgeInsets.only(bottom: 18),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductsDetailPage(
                          products: product,
                        ),
                      ),
                    );
                  },
                  child: ProductsEntryCard(product: product),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

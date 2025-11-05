import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.sports_soccer, size: 48),
                  SizedBox(height: 8),
                  Text(
                    'Welcome to Tim Tarkam Shop',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Tombol All Products
          ElevatedButton.icon(
            onPressed: () {
              _showSnackBar(context, 'Kamu telah menekan tombol All Products');
            },
            icon: const Icon(Icons.view_list),
            label: const Padding(
              padding: EdgeInsets.symmetric(vertical: 14.0),
              child: Text('All Products'),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 12),

          // Tombol My Products
          ElevatedButton.icon(
            onPressed: () {
              _showSnackBar(context, 'Kamu telah menekan tombol My Products');
            },
            icon: const Icon(Icons.person),
            label: const Padding(
              padding: EdgeInsets.symmetric(vertical: 14.0),
              child: Text('My Products'),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 12),

          // Tombol Create Product
          ElevatedButton.icon(
            onPressed: () {
              _showSnackBar(context, 'Kamu telah menekan tombol Create Product');
            },
            icon: const Icon(Icons.add_box),
            label: const Padding(
              padding: EdgeInsets.symmetric(vertical: 14.0),
              child: Text('Create Product'),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),

          const Spacer(),
          const Text(
            '',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
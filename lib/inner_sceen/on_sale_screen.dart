// on_sale_screen.dart
import 'package:flutter/material.dart';
import '../product/product.dart';
import '../widgets/on_sale_widget.dart';

class OnSaleScreen extends StatelessWidget {
  static const routeName = '/on-sale';

  final List<Product> onSaleProducts;

  const OnSaleScreen({Key? key, required this.onSaleProducts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sản Phẩm Đang Giảm Giá'),
        ),
        body: Padding(
          // Khoảng cách giữa lưới với mép thiết bị
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Số cột trong lưới
              crossAxisSpacing: 8.0, // Khoảng cách giữa các cột
              mainAxisSpacing: 8.0, // Khoảng cách giữa các dòng
            ),
            itemCount: onSaleProducts.length,
            itemBuilder: (ctx, index) {
              final sanPham = onSaleProducts[index];
              return OnSaleWidget(
                product: sanPham,
              );
            },
          ),
        ),
      ),
    );
  }
}

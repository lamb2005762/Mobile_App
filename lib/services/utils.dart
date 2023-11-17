import 'package:flutter/material.dart';
import '../product/product.dart';
import './cart.dart';

class Utils {
  BuildContext context;
  Utils(this.context);
  Size get getScreenSize => MediaQuery.of(context).size;

  static Cart _cart = Cart();

  // Lấy danh sách sản phẩm trong giỏ hàng
  static List<Product> get cartItems => _cart.items;

  // Thêm sản phẩm vào giỏ hàng
  static void addToCart(BuildContext context, Product product) {
    // Kiểm tra xem sản phẩm đã có trong giỏ hàng chưa
    bool productExists = false;
    for (Product item in _cart.items) {
      if (item.id == product.id) {
        // Sản phẩm đã tồn tại trong giỏ hàng, tăng số lượng
        item.quantity++;
        productExists = true;
        break;
      }
    }
    // Nếu sản phẩm chưa tồn tại, thêm vào giỏ hàng
    if (!productExists) {
      _cart.addToCart(product);
    }

    // Hiển thị thông báo hoặc thực hiện các hành động khác nếu cần thiết
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Sản phẩm đã được thêm vào giỏ hàng'),
      ),
    );
  }
}

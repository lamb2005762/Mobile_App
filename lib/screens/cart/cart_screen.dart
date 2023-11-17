import 'package:flutter/material.dart';
import 'package:ct484_project/product/product.dart';
import 'package:ct484_project/widgets/text_widget.dart';
import 'package:ct484_project/services/utils.dart';

import '../../app_drawer.dart';
import 'cart_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Product> cartItems = Utils.cartItems;
  double total = 0.0;

  @override
  void initState() {
    super.initState();
    updateTotal();
  }

  void updateTotal() {
    double newTotal = 0;
    for (Product product in cartItems) {
      newTotal += product.totalPrice ?? 0;
    }

    setState(() {
      total = newTotal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: TextWidget(
            text: 'Giỏ hàng (${cartItems.length})',
            color: Colors.white,
            textSize: 20,
          ),
          actions: [
            IconButton(
              onPressed: () {
                // Gọi hàm xử lý xóa sản phẩm khỏi giỏ hàng ở đây nếu cần
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
          ],
        ),
        drawer: const AppDrawer(),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return CartWidget(
                    product: cartItems[index],
                    onQuantityChanged: (quantity, totalPrice) {
                      // Cập nhật số lượng và tổng tiền của sản phẩm khi có thay đổi từ CartWidget
                      setState(() {
                        cartItems[index].quantity = quantity;
                        cartItems[index].totalPrice = totalPrice;
                        updateTotal(); // Cập nhật tổng giá trị của giỏ hàng
                      });
                    },
                  );
                },
              ),
            ),
            _checkout(),
          ],
        ),
      ),
    );
  }

  Widget _checkout() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              // Gọi hàm xử lý đặt hàng ở đây nếu cần
            },
            child: const Text('Đặt hàng ngay'),
          ),
          const SizedBox(height: 10),
          TextWidget(
            text: 'Tổng: \$${total.toStringAsFixed(2)}',
            color: Colors.black,
            textSize: 18,
            isTitle: true,
          ),
        ],
      ),
    );
  }
}

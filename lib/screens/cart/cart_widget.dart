import 'package:ct484_project/product/product.dart'; // Import đối tượng Product
import 'package:ct484_project/services/utils.dart';
import 'package:ct484_project/widgets/heart_btn.dart';
import 'package:ct484_project/widgets/text_widget.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CartWidget extends StatefulWidget {
  final Product product;
  final Function(int, double) onQuantityChanged;

  const CartWidget({
    Key? key,
    required this.product,
    required this.onQuantityChanged,
  }) : super(key: key);

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  final _quantityTextController = TextEditingController();
  double totalPrice = 0.0;

  @override
  void initState() {
    _quantityTextController.text = widget.product.quantity.toString();
    totalPrice = widget.product.totalPrice ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    Container(
                      height: size.width * 0.2,
                      width: size.width * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: FancyShimmerImage(
                        imageUrl: widget.product.imageUrl,
                        boxFit: BoxFit.fill,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: widget.product.name,
                          color: Colors.black,
                          textSize: 20,
                          isTitle: true,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          width: size.width * 0.3,
                          child: Row(
                            children: [
                              quantityController(
                                fct: decrementQuantity,
                                color: Colors.red,
                                icon: CupertinoIcons.minus,
                              ),
                              Flexible(
                                flex: 1,
                                child: TextField(
                                  controller: _quantityTextController,
                                  keyboardType: TextInputType.number,
                                  maxLines: 1,
                                  decoration: const InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(),
                                    ),
                                  ),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp('[0-9]'))
                                  ],
                                  onChanged: (v) {
                                    updateTotalPrice(); // Cập nhật tổng tiền khi số lượng thay đổi từ bàn phím
                                  },
                                ),
                              ),
                              quantityController(
                                fct: incrementQuantity,
                                color: Colors.green,
                                icon: CupertinoIcons.plus,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Icon(
                              CupertinoIcons.cart_badge_minus,
                              color: Colors.red,
                              size: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const HeartBtn(),
                          TextWidget(
                            text: '\$${totalPrice.toStringAsFixed(2)}',
                            color: Colors.black,
                            textSize: 18,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget quantityController({
    required Function fct,
    required IconData icon,
    required Color color,
  }) {
    return Flexible(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Material(
          color: color,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              fct();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                icon,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void decrementQuantity() {
    int currentQuantity = int.parse(_quantityTextController.text);
    if (currentQuantity > 1) {
      currentQuantity--;
      _quantityTextController.text = currentQuantity.toString();
      updateTotalPrice(); // Cập nhật tổng tiền khi giảm số lượng
    }
  }

  void incrementQuantity() {
    int currentQuantity = int.parse(_quantityTextController.text);
    currentQuantity++;
    _quantityTextController.text = currentQuantity.toString();
    updateTotalPrice(); // Cập nhật tổng tiền khi tăng số lượng
  }

  void updateTotalPrice() {
    int currentQuantity = int.parse(_quantityTextController.text);
    setState(() {
      totalPrice = currentQuantity * widget.product.salePrice;
    });
    widget.onQuantityChanged(currentQuantity, totalPrice);
  }
}

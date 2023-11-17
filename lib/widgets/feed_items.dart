import 'package:ct484_project/services/utils.dart';
import 'package:ct484_project/widgets/heart_btn.dart';
import 'package:ct484_project/widgets/price_widget.dart';
import 'package:ct484_project/widgets/text_widget.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class FeedsWidget extends StatefulWidget {
  const FeedsWidget({super.key});

  @override
  State<FeedsWidget> createState() => _FeedsWidgetState();
}

class _FeedsWidgetState extends State<FeedsWidget> {
  final _quantityTextController = TextEditingController();

  @override
  void initState() {
    _quantityTextController.text = '1';
    super.initState();
  }

  @override
  void dispose() {
    _quantityTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).cardColor,
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(12),
            child: Column(
              children: [
                FancyShimmerImage(
                  imageUrl:
                      'https://suckhoedoisong.qltns.mediacdn.vn/Images/duylinh/2020/05/14/dao_2_resize.jpg',
                  height: size.width * 0.2,
                  width: size.width * 0.2,
                  boxFit: BoxFit.fill,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        text: 'Title',
                        color: Colors.black,
                        textSize: 20,
                        isTitle: true,
                      ),
                      const Spacer(),
                      const Icon(
                        IconlyLight.bag,
                        size: 20,
                        color: Colors.black,
                      ),
                      const HeartBtn(),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: PriceWidget(
                      salePrice: 2.99,
                      price: 5.9,
                      textPrice: '1',
                      isOnSale: true,
                    ),
                  ),
                ),
                // const Spacer(),
                SizedBox(
                  width: size.width * 0.4,
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        text: 'Quantities',
                        color: Colors.black,
                        textSize: 15,
                        isTitle: true,
                      ),
                      const Spacer(),
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
                            FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                          ],
                          onChanged: (v) {
                            setState(() {});
                          },
                        ),
                      ),
                      //const Spacer(),
                      TextWidget(
                        text: 'Kg',
                        color: Colors.black,
                        textSize: 15,
                        isTitle: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

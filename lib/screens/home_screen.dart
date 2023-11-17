import 'package:card_swiper/card_swiper.dart';
import 'package:ct484_project/inner_sceen/feeds_screen.dart';
import 'package:ct484_project/services/global_method.dart';
import 'package:ct484_project/services/utils.dart';
import 'package:ct484_project/widgets/feed_items.dart';
import 'package:ct484_project/widgets/on_sale_widget.dart';
import 'package:ct484_project/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../inner_sceen/on_sale_screen.dart';
import '../product/product.dart';
import '/app_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _offerImg = [
    'assets/images/offers/dau.jpg',
    'assets/images/offers/rau.png',
    'assets/images/offers/trai_cay.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    List<Product> sanPhamSale = [
      Product(
        id: '1',
        name: 'Cam',
        imageUrl:
            'https://dacsancamvinh.net/wp-content/uploads/2015/06/cong-dung-qua-cam.jpg',
        salePrice: 2.99,
        regularPrice: 5.9,
      ),
      Product(
        id: '2',
        name: 'Cóc',
        imageUrl:
            'https://cdn.tgdd.vn/Products/Images/8788/233526/bhx/coc-lon-tui-1kg-4-6-trai-202205310926394910.jpg',
        salePrice: 2.99,
        regularPrice: 5.9,
      ),
      Product(
        id: '3',
        name: 'Ổi',
        imageUrl:
            'https://vtv1.mediacdn.vn/zoom/640_400/2018/10/9/qua-oi-xanh-chuan-crop-15390767439471555931383.jpeg',
        salePrice: 2.99,
        regularPrice: 5.9,
      ),
      Product(
        id: '4',
        name: 'Chôm chôm',
        imageUrl:
            'https://redpineinternational.vn/wp-content/uploads/2021/08/Diem-ten-5-loai-phan-bon-duong-qua-chom-chom-day-cui-doc-hat.png',
        salePrice: 2.99,
        regularPrice: 5.9,
      ),
    ];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: TextWidget(
            text: "Cửa Hàng Hoa Quả",
            textSize: 20,
            color: Colors.white,
          ),
        ),
        drawer: const AppDrawer(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.3,
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return Image.asset(
                        _offerImg[index],
                        fit: BoxFit.fill,
                      );
                    },
                    autoplay: true,
                    itemCount: _offerImg.length,
                    pagination: const SwiperPagination(
                        alignment: Alignment.bottomCenter,
                        builder: DotSwiperPaginationBuilder(
                            color: Colors.white, activeColor: Colors.black)),
                    control: const SwiperControl(
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      OnSaleScreen.routeName,
                      arguments: sanPhamSale,
                    );
                  },
                  child: TextWidget(
                    text: 'Xem tất cả',
                    color: Colors.cyan,
                    maxLines: 1,
                    textSize: 20,
                  ),
                ),
                Row(
                  children: [
                    RotatedBox(
                      quarterTurns: -1,
                      child: Row(
                        children: [
                          TextWidget(
                              text: 'Giảm sâu'.toUpperCase(),
                              color: Colors.red,
                              textSize: 18),
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(
                            IconlyLight.discount,
                            color: Colors.red,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: SizedBox(
                        height: size.height * 0.24,
                        child: ListView.builder(
                          itemCount: sanPhamSale.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, index) {
                            final sanPham = sanPhamSale[index];
                            return OnSaleWidget(
                              product: sanPham,
                              //onAddToCart: () {},
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        text: 'Tất cả',
                        color: Colors.black,
                        textSize: 20,
                        isTitle: true,
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          GlobalMethod.navigateTo(
                              ctx: context, routeName: FeedsScreen.routeName);
                        },
                        child: TextWidget(
                          text: 'Xem tất cả',
                          color: Colors.blue,
                          maxLines: 1,
                          textSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  padding: EdgeInsets.zero,
                  //crossAxisSpacing: 10,
                  childAspectRatio: size.width / (size.height * 0.6),
                  children: List.generate(4, (index) {
                    return const FeedsWidget();
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

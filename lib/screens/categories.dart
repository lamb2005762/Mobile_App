import 'package:ct484_project/widgets/categories_widget.dart';
import 'package:ct484_project/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import '/app_drawer.dart';

// ignore: must_be_immutable
class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});
  List<Color> gridColors = [
    const Color(0x00add9cc),
    const Color(0x00f0d6fa),
    const Color(0x00ffdce3),
    const Color(0x00eedcce),
    const Color(0x00e9c3bb),
    const Color(0x00b8e1ff),
  ];
  List<Map<String, dynamic>> catInfo = [
    {'imgPath': 'assets/images/cat/cam.jpg', 'catText': 'Cam'},
    {'imgPath': 'assets/images/cat/oi.webp', 'catText': 'Oi'},
    {'imgPath': 'assets/images/cat/sau_rieng.webp', 'catText': 'Sau rieng'},
    {'imgPath': 'assets/images/cat/chom_chom.png', 'catText': 'Chom chom'},
    {'imgPath': 'assets/images/cat/thanh_long.jpg', 'catText': 'Thanh long'},
    {'imgPath': 'assets/images/cat/xoai.jpg', 'catText': 'Xoai'},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          drawer: const AppDrawer(),
          appBar: AppBar(
            elevation: 5,
            title: TextWidget(
              text: 'Danh mục',
              color: Colors.white,
              //isTitle: true,
              textSize: 20,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 240 / 250,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: List.generate(6, (index) {
                return CategoriesWidget(
                  catText: catInfo[index]['catText'],
                  imgPath: catInfo[index]['imgPath'],
                  passedcolor: gridColors[index],
                );
              }),
            ),
          )),
    );
  }
}

import 'package:ct484_project/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget(
      {super.key,
      required this.catText,
      required this.imgPath,
      required this.passedcolor});

  final String catText, imgPath;
  final Color passedcolor;

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        print('Category pressed');
      },
      child: Container(
          //height: _screenWidth * 0.6,
          decoration: BoxDecoration(
              color: passedcolor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
              border:
                  Border.all(color: passedcolor.withOpacity(0.7), width: 2)),
          child: Column(children: [
            Container(
              height: _screenWidth * 0.3,
              width: _screenWidth * 0.3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        imgPath,
                      ),
                      fit: BoxFit.fill)),
            ),
            TextWidget(text: catText, color: Colors.black, textSize: 20),
          ])),
    );
  }
}

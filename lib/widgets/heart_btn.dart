import 'package:flutter/material.dart';

class HeartBtn extends StatefulWidget {
  const HeartBtn({Key? key}) : super(key: key);

  @override
  _HeartBtnState createState() => _HeartBtnState();
}

class _HeartBtnState extends State<HeartBtn> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkResponse(
        onTap: () {
          setState(() {
            isLiked = !isLiked;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
          ),
          child: Icon(
            isLiked ? Icons.favorite : Icons.favorite_border,
            size: 20,
            color: isLiked ? Colors.red : Colors.black,
          ),
        ),
      ),
    );
  }
}

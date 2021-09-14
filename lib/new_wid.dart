import 'package:flutter/material.dart';
class CustomWid extends StatelessWidget{
  final double wid;
  final double hei;
  final int num;
  const CustomWid({
    Key? key,
    this.wid = 100,
    this.hei = 100,
    this.num = 0,
  }) : assert(wid >=100),
        assert(hei >= 100),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: wid,
      height: hei,
      color: Colors.red,
      child: Center(
        child: Text(
          '$num',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.blueGrey
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
class PaintWidget extends StatelessWidget{
  final double thWidth;
  final double thHeight;
  const PaintWidget({
    Key? key,
    this.thHeight = 200,
    this.thWidth = 200,
  }) : assert(thWidth >= 200),
        assert(thHeight >= 200),
        super(key: key);
  //asset은 위젯이 가진 조건이다.

  @override
  Widget build(BuildContext context) {
    return Container(
      width: thWidth,
      height: thHeight,
      color: Colors.greenAccent,
      child: CustomPaint(
        painter: MyPainter(),
        child: const Center(
          child: Text('동그라미'),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    double cRadius = size.width;
    if(size.width > size.height){
      cRadius = size.height;
    }
    final circle1 = Rect.fromCircle(
      center: Offset(size.width/4, size.height/2),
      radius: cRadius/8,
    );
    final circle2 = Rect.fromCircle(
      center: Offset(size.width/2, size.height/4),
      radius: cRadius/8,
    );

    var minCircle = Paint();
    var maxCircle = Paint();

    maxCircle.color = const Color(0xff053aea);
    minCircle.color = const Color(0xffecad0a);

    canvas.drawOval(circle1, maxCircle);
    canvas.drawOval(circle2, minCircle);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
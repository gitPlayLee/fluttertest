import 'dart:async';
import 'package:flutter/widgets.dart';
class CarTimeWidget extends StatefulWidget{
  final width;
  const CarTimeWidget({
    Key? key,
    this.width = 3000,
  }): assert(width >= 300),
        super(key: key);
  @override
  State<StatefulWidget> createState() => _CarTimeWiget();
}

class _CarTimeWiget extends State<CarTimeWidget>{
  int _hour = DateTime.now().hour;
  int _miute = DateTime.now().minute;
  double lifebar=0.85;
  double rightbar=0.15;
  String time = '';
  _CarTimeWiget(){
    Timer.periodic(Duration(milliseconds: 50), (timer){
      setState(() {
        _hour = DateTime.now().hour;
        _miute = DateTime.now().minute;
        time = '$_hour:$_miute';
        if(lifebar <= -0.3){
          lifebar = 0.85;
        }
        if(rightbar >= 1.3){
          rightbar = 0.15;
        }
        lifebar = lifebar - 0.01;
        rightbar = rightbar + 0.01;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: 100,
      child: CustomPaint(
        painter: TopBar(
          width: widget.width,
          l_col: lifebar,
          r_col: rightbar
        ),
        child: CustomPaint(
          painter: CarTime(
            width: widget.width,
            text: time,
          )
        ),
      ),
    );
  }
}

class TopBar extends CustomPainter{
  double width;
  double l_col;
  double r_col;
  TopBar({
    this.l_col = 0.5,
    this.r_col = 0.5,
    this.width = 300
  });
  @override
  void paint(Canvas canvas, Size size) {
    final topBar = Rect.fromLTRB(0, 0, width, 55);
    final lBar2 = Rect.fromLTRB(0, 52, width/2, 55);
    final rRar3 = Rect.fromLTRB(width/2, 52, width, 55);

    //top
    final gradient = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xff686767),
          Color(0xff343434),
          Color(0xff212121),
          Color(0xff343434),
          Color(0xff686767)],
        stops: [0.05, 0.2, 0.5, 0.8, 0.95],
    );
    final rect = Rect.fromLTRB(0, 0, width, 55);
    final shader = gradient.createShader(rect);

    //left
    final gradient1 = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color(0xffffe700),
        Color(0xfffdf8d8),
        Color(0xffffe700)
      ],
      stops: [l_col-0.15, l_col, l_col+0.15],
    );
    final rect1 = Rect.fromLTRB(0, 53, width/2, 54);
    final shader1 = gradient1.createShader(rect1);

    //right
    final gradient2 = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color(0xff7ff55b),
        Color(0xffe2fcd9),
        Color(0xff7ff55b)
      ],
      stops: [r_col-0.15, r_col, r_col+0.15],
    );
    final rect2 = Rect.fromLTRB(width/2, 53, width, 54);
    final shader2 = gradient2.createShader(rect2);

    // top
    var topPt = Paint()
    ..color = Color(0xff525151)
    ..shader = shader;

    //left
    var leftPt = Paint()
    ..color = Color(0xfff8e567)
    ..shader = shader1;

    //right
    var rightPt = Paint()
    ..color = Color(0xff7ff55b)
    ..shader = shader2;

    canvas.drawRect(topBar, topPt);
    canvas.drawRect(lBar2, leftPt);
    canvas.drawRect(rRar3, rightPt);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CarTime extends CustomPainter{
  double width;
  String text;
  CarTime({
    Key? key,
    this.text = '00:00',
    this.width = 300
  });
  @override
  void paint(Canvas canvas, Size size) {
    final boxCenter = Size(width*0.5, 80);
    final CTpath = Path()
    ..moveTo(boxCenter.width-100, 30)
    ..lineTo(boxCenter.width-80, 55)
    ..quadraticBezierTo(boxCenter.width-70, 70, boxCenter.width-45, 70)
    ..lineTo(boxCenter.width+45, 70)
    ..quadraticBezierTo(boxCenter.width+70, 70, boxCenter.width+80, 55)
    ..lineTo(boxCenter.width+100, 30)
    ..quadraticBezierTo(boxCenter.width+120, 0, boxCenter.width+90, 0)
    ..lineTo(boxCenter.width-90, 0)
    ..quadraticBezierTo(boxCenter.width-120, 0, boxCenter.width-100, 30);
    // ?????? ???????????? ?????? ????????? ?????????, ??? ???????????? ??????????????? ?????? ?????? ??????

    final gradient = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.1, 0.7, 1.0],
        colors: [
          Color(0xff000000),
          Color(0xff7b7a7a),
          Color(0xffffffff)
        ]
    );
    final rect = Rect.fromCircle(center: Offset(size.width, 70),
        radius: 100);
    final shader = gradient.createShader(rect);
    final boxPaint = Paint()
    ..color = Color(0xff090909)
    ..shader = shader
    ..style = PaintingStyle.fill;

    final gradientline = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.1, 0.3, 0.6],
        colors: [
          Color(0xff000000),
          Color(0xff7b7a7a),
          Color(0xffffffff)
        ]
    );
    final shaderline = gradientline.createShader(rect);

    final linePaint = Paint()
      ..color = Color(0xff000000)
      ..shader = shaderline
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawPath(CTpath, boxPaint);
    canvas.drawPath(CTpath, linePaint);
    drawText(canvas, size, text, width);
  }

  void drawText(Canvas canvas, Size size, String text, double width){
    TextSpan sp = TextSpan(
      text: text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 40,
        color: Color(0xffffffff),
      )
    );
    TextPainter tp = TextPainter(
      text: sp,
      textDirection: TextDirection.ltr
    );
    tp.layout();
    double dx = width / 2 - tp.width / 2;
    double dy = 30 - tp.height / 2;
    Offset offset = Offset(dx,dy);
    tp.paint(canvas, offset);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
/*
https://owenhalliday.co.uk/flutter-gradient/
https://www.debugcn.com/ko/article/54169497.html
https://www.raywenderlich.com/7560981-drawing-custom-shapes-with-custompainter-in-flutter#toc-anchor-019
https://www.python2.net/questions-836780.htm
https://ichi.pro/ko/flutterui-meosjin-baegyeong-aenimeisyeon-71897032121399
https://software-creator.tistory.com/23
*/
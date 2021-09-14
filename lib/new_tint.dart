import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class TipWidget extends SingleChildRenderObjectWidget{
  @override
  RenderObject createRenderObject(BuildContext context) {
    return RendTip();
  }

}

class RendTip extends RenderCustomPaint{
  @override
  void markNeedsPaint(){

  }
  @override
  void paint(PaintingContext context, Offset offset){

  }
}
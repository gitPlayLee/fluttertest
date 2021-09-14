import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
class TestUi extends StatelessWidget{
  final Widget? child;
  final String? title;
  const TestUi({
    Key? key,
    this.title = '',
    this.child,
  }) : assert(title != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget tipWidget = child!;
    return tipWidget;
  }
}

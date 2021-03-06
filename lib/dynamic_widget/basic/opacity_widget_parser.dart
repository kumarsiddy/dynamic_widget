import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:flutter/widgets.dart';

class OpacityWidgetParser extends WidgetParser {
  @override
  String get widgetName => "Opacity";

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickEventListener listener,
      {GlobalKey<State<StatefulWidget>> stateKey}) {
    return Opacity(
      opacity: map["opacity"],
      alwaysIncludeSemantics: map.containsKey("alwaysIncludeSemantics")
          ? map["alwaysIncludeSemantics"]
          : false,
      child: DynamicWidgetBuilder.buildFromMap(
          map["child"], buildContext, listener,
          stateKey: stateKey),
    );
  }
}

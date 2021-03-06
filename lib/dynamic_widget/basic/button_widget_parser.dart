import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/eventhandler/click_event.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/material.dart';

class RaisedButtonParser extends WidgetParser {
  @override
  String get widgetName => "RaisedButton";

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickEventListener listener,
      {GlobalKey<State<StatefulWidget>> stateKey}) {
    ClickEvent clickEvent = map.containsKey("clickEvent")
        ? ClickEvent.fromJson(map['clickEvent'])
        : ClickEvent(EventType.NOT_DEFINED);

    var raisedButton = RaisedButton(
      color: map.containsKey('color') ? parseHexColor(map['color']) : null,
      disabledColor: map.containsKey('disabledColor')
          ? parseHexColor(map['disabledColor'])
          : null,
      disabledElevation:
          map.containsKey('disabledElevation') ? map['disabledElevation'] : 0.0,
      disabledTextColor: map.containsKey('disabledTextColor')
          ? parseHexColor(map['disabledTextColor'])
          : null,
      elevation: map.containsKey('elevation') ? map['elevation'] : 0.0,
      padding: map.containsKey('padding')
          ? parseEdgeInsetsGeometry(map['padding'])
          : null,
      splashColor: map.containsKey('splashColor')
          ? parseHexColor(map['splashColor'])
          : null,
      textColor:
          map.containsKey('textColor') ? parseHexColor(map['textColor']) : null,
      shape: map.containsKey('shape')
          ? RoundedRectangleBorder(
              borderRadius: parseBorderRadius(map['shape']))
          : null,
      child: DynamicWidgetBuilder.buildFromMap(
          map['child'], buildContext, listener,
          stateKey: stateKey),
      onPressed: () {
        listener.onClicked(clickEvent);
      },
    );

    return raisedButton;
  }
}

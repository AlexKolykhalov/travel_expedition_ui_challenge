import 'package:flutter/material.dart';
import 'package:some_animation_ex12/models.dart';
import 'package:some_animation_ex12/widgets/page_view/widgets/third_page/widgets/semicircle_painter.dart';

class ElementOfListView extends StatelessWidget {
  const ElementOfListView({
    Key key,
    this.element,
  }) : super(key: key);

  final User element;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                foregroundPainter:
                    SemiCirclePainter(isOnline: element.isOnline),
                child: Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10.0,
                        ),
                      ]),
                ),
              ),
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
              Positioned(
                bottom: 3.0,
                right: 5.0,
                child: Container(
                  width: 10.0,
                  height: 10.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        (element.isOnline) ? Colors.green : Colors.transparent,
                  ),
                ),
              ),
            ],
          ),
          Text(element.name)
        ],
      ),
    );
  }
}

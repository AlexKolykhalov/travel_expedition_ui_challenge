import 'package:flutter/material.dart';

class VerticalLineAnimalLabel extends StatelessWidget {
  const VerticalLineAnimalLabel({
    Key key,
    @required this.horizontalPosition,
    @required this.opacity,
    @required this.size,
    @required this.type,
  }) : super(key: key);

  final double horizontalPosition;
  final double opacity;
  final Size size;
  final String type; //'L' - leopard, 'V' - verture

  @override
  Widget build(BuildContext context) {
    double _bottom = size.height * 0.16;
    return AnimatedPositioned(
      duration: Duration(milliseconds: 300),
      left: (type == 'V') ? null : horizontalPosition,
      right: (type == 'V') ? horizontalPosition : null,
      bottom: (type == 'V')
          ? _bottom + size.height * 0.2 - (size.height * 0.015 / 2)
          : _bottom + size.height * 0.4 - (size.height * 0.015 / 2),
      child: Opacity(
        opacity: opacity,
        child: Container(
          width: size.width * 0.2,
          height: size.width * 0.2,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                (type == 'V')
                    ? Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: size.width * 0.15,
                          height: size.width * 0.13,
                          child: Image.asset(
                            'assets/images/vultures.png',
                            color: Colors.black,
                          ),
                        ),
                      )
                    : Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: size.width * 0.15,
                          height: size.width * 0.13,
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Image.asset(
                              'assets/images/leopards.png',
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                SizedBox(
                  height: size.width * 0.01,
                ),
                (type == 'V')
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                              width: size.width * 0.04,
                              height: 1.5,
                              decoration: BoxDecoration(color: Colors.black)),
                          Text(
                            'Vultures',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: size.height * 0.019),
                          )
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Leopards',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: size.height * 0.019),
                          ),
                          Container(
                              width: size.width * 0.04,
                              height: 1.5,
                              decoration: BoxDecoration(color: Colors.black)),
                        ],
                      ),
              ]),
        ),
      ),
    );
  }
}

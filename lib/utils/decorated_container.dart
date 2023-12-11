import 'package:flutter/material.dart';

class DecoratedContainer extends StatelessWidget {
  DecoratedContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(5, 5), // changes position of shadow
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.6),
            blurRadius: 5,
            offset: const Offset(-5, -5), // changes position of shadow
          ),
        ],
        color: const Color(0xffE1E1EC),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: child,
    );
  }
}

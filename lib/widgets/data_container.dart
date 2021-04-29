import 'package:flutter/material.dart';

class DataContainer extends StatelessWidget {
  DataContainer({
    required this.data,
    required this.color,
    required this.dataValue,
  });

  final String dataValue;
  final String data;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      width: 190,
      height: 140,
      child: Column(
        children: [
          Align(
            child: Padding(
              padding: EdgeInsets.only(
                top: 15,
                left: 15,
              ),
              child: Text(
                '$data',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: color,
                ),
              ),
            ),
            alignment: Alignment.topLeft,
          ),
          SizedBox(
            height: 45,
          ),
          Align(
            child: Padding(
              padding: EdgeInsets.only(
                right: 15,
                bottom: 15,
              ),
              child: Text(
                '$dataValue',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
              ),
            ),
            alignment: Alignment.bottomRight,
          ),
        ],
      ),
    );
  }
}

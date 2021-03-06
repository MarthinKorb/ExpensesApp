import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double value;
  final double percent;

  ChartBar({
    this.label,
    this.value,
    this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20,
          child: FittedBox(
            child: Text(
              'R\$${value.toStringAsFixed(2)}',
            ),
          ),
        ),
        SizedBox(height: 5),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.purple,
                    style: BorderStyle.solid,
                    width: 1.0,
                  ),
                  color: Color.fromRGBO(220, 220, 220, 1.0),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              FractionallySizedBox(
                heightFactor: percent,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5),
        Text(label),
      ],
    );
  }
}

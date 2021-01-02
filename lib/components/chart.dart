import 'package:expenses/components/chart_bar.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  Chart(this.recentTransaction);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0;

      recentTransaction.forEach((element) {
        bool sameDay = element.date.day == weekDay.day;
        bool sameMonth = element.date.month == weekDay.month;
        bool sameYear = element.date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum += element.value;
        }
      });

      return {
        'day': DateFormat.E().format(weekDay),
        'value': totalSum,
      };
    }).reversed.toList();
  }

  double get _weekTotalValue {
    return groupedTransactions.fold(0.0, (acumulator, element) {
      return acumulator + element['value'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactions.map((e) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label: e['day'],
                value: e['value'],
                percent: _weekTotalValue == 0
                    ? 0
                    : (e['value'] as double) / _weekTotalValue,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

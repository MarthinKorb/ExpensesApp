import 'dart:math';

import 'package:flutter/material.dart';
import 'transactions_form.dart';
import 'transaction_list.dart';
import '../models/transaction.dart';

class TransactionUser extends StatefulWidget {
  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {

   final _transactions = [
    Transaction(id: 't1', title: 'title 1', value: 310.99, date: DateTime.now()),
    Transaction(id: 't2', title: 'title 2', value: 380.99, date: DateTime.now()),
  ];
  

  _addTransaction(String title, double value){
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(_transactions),
        TransactionForm(_addTransaction),
      ],
    );
  }
}
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:kitahack/main.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BasePage(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Home',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFF77BB81),
        centerTitle: true,
        elevation: 0.0,
      ),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            child: Text('Logout'),
          ),
        ],
      )
    );
  }
}

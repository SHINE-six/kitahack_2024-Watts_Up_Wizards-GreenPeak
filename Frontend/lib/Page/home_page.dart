// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:kitahack/main.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BasePage(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.notifications_active_outlined),
          onPressed: () {},
        ),
        title: const Text(
          'GreenPeak',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {},
          ),
        ],
        backgroundColor: Color(0xFF77BB81),
        centerTitle: true,
        elevation: 0.0,
      ),
      child: Stack(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFF77BB81),
            ),
          ),
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 160,
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Color(0xFFFFEB85),
                    width: 4,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center, 
                      children: [
                        Text("Energy Used: ", style: TextStyle(fontWeight: FontWeight.bold),),
                        SizedBox(width: 20),
                        Text("0.0", style: TextStyle(fontWeight: FontWeight.bold),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Today: ", style: TextStyle(fontWeight: FontWeight.bold),),
                        SizedBox(width: 20),
                        Text("0.0", style: TextStyle(fontWeight: FontWeight.bold),),
                      ],),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("This Month: ", style: TextStyle(fontWeight: FontWeight.bold),),
                        SizedBox(width: 20),
                        Text("0.0", style: TextStyle(fontWeight: FontWeight.bold),),
                      ],),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Energy Saved: ", style: TextStyle(fontWeight: FontWeight.bold),),
                        SizedBox(width: 20),
                        Text("0.0", style: TextStyle(fontWeight: FontWeight.bold),),
                      ],),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Color(0xFF8299ED),
                    width: 4,
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Color(0xFF8299ED),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Energy Analysis Report", style: TextStyle(fontWeight: FontWeight.bold),),
                          IconButton(
                            icon: const Icon(Icons.arrow_forward_ios),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 170,
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 17),
                      child: Placeholder(),
                    )
                  ]
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF8299ED),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(child: Text("Energy Consumption Report", style: TextStyle(fontWeight: FontWeight.bold),)),
              ),
              SizedBox(height: 20),
              Container(
                height: 90,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 140,
                      padding: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        color: Color(0xFFA4ED82),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text("Energy Saving Mode", textAlign: TextAlign.center,)
                          ),
                          Container(
                            height: 20,
                            child: Transform.scale(
                              scale: 0.7,
                              child: Switch(value: false, onChanged: (value) {})
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 140,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Color(0xFFFFEB85),
                          width: 4,
                        ),
                      ),
                      child: Icon(Icons.chat, size: 50,)
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}



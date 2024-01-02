// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Center(
              child: Text(
                "Login", 
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            )
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              decoration: BoxDecoration(
                color: Color(0xFF77BB81),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Container(
                    // height will follow the child's height
                    width: 200,
                    margin: EdgeInsets.only(top: 30, bottom: 30),
                    child: Icon(Icons.person, size: 180),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    // width: ,
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                                    ),
                                    child: Text(
                                      "Username", 
                                      textAlign: TextAlign.center, 
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Roboto Mono',
                                      )
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFE5E5E5),
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15), topRight: Radius.circular(15)),
                                ),
                                child: TextField(
                                  onChanged: (value) {},
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter your username',
                                    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                  )
                                )
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    // width: ,
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                                    ),
                                    child: Text(
                                      "Password", 
                                      textAlign: TextAlign.center, 
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Roboto Mono',
                                      )
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFE5E5E5),
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15), topRight: Radius.circular(15)),
                                ),
                                child: TextField(
                                  onChanged: (value) {},
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter your Password',
                                    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                  )
                                )
                              ),
    
                              Container(
                                width: 120,
                                height: 45,
                                margin: EdgeInsets.only(top: 30),
                                child: ElevatedButton(
                                  onPressed: () {Navigator.pushNamed(context, '/control');},
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.white),
                                    foregroundColor: MaterialStateProperty.all(Colors.black),
                                    padding: MaterialStateProperty.all(EdgeInsets.all(8)),
                                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: BorderSide(color: Colors.black, width: 1),
                                    )),
                                  ),
                                  child: Wrap(
                                    children: [
                                      Center(
                                        child: Text(
                                          "Login", 
                                          style: TextStyle(
                                            fontFamily: 'Roboto Mono',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ), 
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 12),
            decoration: BoxDecoration(
              color: Color(0xFFFFEB85),
              borderRadius: BorderRadius.circular(12),
            ),
    
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            
              children: [
                SizedBox(
                  width: 120,
                  height: 70,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      foregroundColor: MaterialStateProperty.all(Colors.black),
                      padding: MaterialStateProperty.all(EdgeInsets.all(8)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(color: Colors.black, width: 1),
                      )),
                    ),
                    child: Wrap(
                      children: [
                        Text(
                          "Forgot Password", 
                          style: TextStyle(
                            fontFamily: 'Roboto Mono',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ), 
                  ),
                ),
    
                SizedBox(
                  width: 120,
                  height: 70,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      foregroundColor: MaterialStateProperty.all(Colors.black),
                      padding: MaterialStateProperty.all(EdgeInsets.all(8)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(color: Colors.black, width: 1),
                      )),
                    ),
                    child: Wrap(
                      children: [
                        Text(
                          "Sign Up", 
                          style: TextStyle(
                            fontFamily: 'Roboto Mono',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ), 
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

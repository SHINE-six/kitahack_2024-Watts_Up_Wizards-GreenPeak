// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kitahack/main.dart';

class ControlPage extends StatelessWidget {
  const ControlPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Control Home',
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
      child: PageBody(),
      // bottomNavigationBar: NavBar(),
    );
  }

  Column PageBody(){
    return Column(
      children: [
        Container(
          color: Color(0xFF77BB81),
          width: double.infinity,
          child: Column(
          children: [
            SumInfo(),
            SizedBox(height: 20),
          ],
        )),
        Location_Control()
      ],
    );
  }

  Column Location_Control() {
    final List<String> LivingRoomIOT = <String>['Light', 'Fan', 'Air-Con', 'TV-1', 'TV-2'];
    final List<String> KitchenIOT = <String>['Light 1', 'Washing Machine', 'Light 2'];
    final List<String> BedroomIOT = <String>['Fan', 'Air-Con', 'TV'];
    return Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
            color: Color(0xFFFFEB85),
            height: 142,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text("Living Room", style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                SizedBox(height: 10,),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: LivingRoomIOT.length,
                    itemBuilder: (BuildContext context, int index) {
                      return OnOff_button(text: LivingRoomIOT[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 14,),
          Container(
            padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
            color: Color(0xFFFFEB85),
            height: 142,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text("Kitchen", style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                SizedBox(height: 10,),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: KitchenIOT.length,
                    itemBuilder: (BuildContext context, int index) {
                      return OnOff_button(text: KitchenIOT[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 14,),
          Container(
            padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
            color: Color(0xFFFFEB85),
            height: 142,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text("Bedroom", style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                SizedBox(height: 10,),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: BedroomIOT.length,
                    itemBuilder: (BuildContext context, int index) {
                      return OnOff_button(text: BedroomIOT[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      );
  }

  Container SumInfo(){
    return Container(
      height: 160,
      width: 320,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xFFFFEB85),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Energy Usage", style: TextStyle(fontWeight: FontWeight.bold),),
              Text("900W"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Room Temperature", style: TextStyle(fontWeight: FontWeight.bold),),
              Text("21.0 C"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Low Energy Usage", style: TextStyle(fontWeight: FontWeight.bold),),
              switch_onOff(),
            ],
          ),
        ],
      )
    );
  }
}

class OnOff_button extends StatefulWidget {
  final String text;
  const OnOff_button({
    super.key,
    required this.text,
  });

  @override
  State<OnOff_button> createState() => _OnOff_buttonState();
}

class _OnOff_buttonState extends State<OnOff_button> {
  bool light = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          light = !light;
        });
      },
      child: Container(
        width: 88,
        height: 95,
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: light ? Color(0xFFA4ED82) : Color(0xFF8299ED),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(widget.text, style: TextStyle(fontWeight: FontWeight.w700), overflow: TextOverflow.visible,),
              Container(
                height: 20,
                child: Transform.scale(
                  scale: 0.7,
                  child: Switch(
                    value: light, 
                    onChanged: (value) {
                    setState(() {
                      light = value;
                    });},
                    activeTrackColor: Colors.green,
                    activeColor: Colors.white,
                    inactiveTrackColor: Colors.white70,
                    inactiveThumbColor: Colors.black,       
                  ),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}

class switch_onOff extends StatefulWidget {
  const switch_onOff({
    super.key,
  });

  @override
  State<switch_onOff> createState() => _switch_onOffState();
}

class _switch_onOffState extends State<switch_onOff> {
  bool light = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 40,
      child: Transform.scale(
        scale: 0.7,
        child: Switch(
          value: light,
          onChanged: (value) {
            setState(() {
              light = value;
            });
          },
          activeTrackColor: Colors.green,
          activeColor: Colors.white,
          inactiveTrackColor: Colors.white70,
          inactiveThumbColor: Colors.black,        
        ),
      ),
    );
  }
}

class NavBar extends StatefulWidget {
  const NavBar({
    super.key,
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int selectedPageIndex = 3;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      selectedIndex: selectedPageIndex,
      onDestinationSelected: (value) {
        setState(() {
          selectedPageIndex = value;
        });
        // switch (selectedPageIndex) {
        //   case 0:
        //     Navigator.pushNamed(context, '/home');
        //     break;
        //   case 1:
        //     Navigator.pushNamed(context, '/profile');
        //     break;
        //   case 2:
        //     Navigator.pushNamed(context, '/control');
        //     break;
        //   case 3:
        //     Navigator.pushNamed(context, '/setting');
        //     break;
        // }
      },
      destinations: [
        NavigationDestination(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
        NavigationDestination(
          icon: Icon(Icons.control_camera_sharp),
          label: 'Control',
        ),
        NavigationDestination(
          icon: Icon(Icons.settings),
          label: 'Setting',
        ),
      ],
    );
  }
}

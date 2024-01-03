// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kitahack/main.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:time_picker_spinner_pop_up/time_picker_spinner_pop_up.dart';

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
        LocationControl()
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

class LocationControl extends StatelessWidget {
  const LocationControl({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> LivingRoomIOT = <String>['Light', 'Fan', 'Air-Con', 'TV-1', 'TV-2'];
    final List<int> LivingRoomIOTEnergyUse = <int>[100, 50, 200, 300, 300];
    final List<String> KitchenIOT = <String>['Light 1', 'Washing Machine', 'Light 2'];
    final List<int> KitchenIOTEnergyUse = <int>[100, 50, 200, 300, 300];
    final List<String> BedroomIOT = <String>['Fan', 'Air-Con', 'TV'];
    final List<int> BedroomIOTEnergyUse = <int>[100, 50, 200, 300, 300];

    return Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RoomControlPage(room: "Living Room", iot: LivingRoomIOT, IOTEnergyUse: LivingRoomIOTEnergyUse)),
              );
            
            },
            child: Container(
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
          ),
          SizedBox(height: 14,),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RoomControlPage(room: "Kitchen", iot: KitchenIOT, IOTEnergyUse: KitchenIOTEnergyUse)),
              );
            },
            child: Container(
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
          ),
          SizedBox(height: 14,),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RoomControlPage(room: "Bedroom", iot: BedroomIOT, IOTEnergyUse: BedroomIOTEnergyUse)),
              );
            },
            child: Container(
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
          ),
        ],
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

//* Another Page
class RoomControlPage extends StatelessWidget {
  final String room;
  final List<String> iot;
  final List<int> IOTEnergyUse;
  const RoomControlPage({
    super.key, 
    required this.room, 
    required this.iot, 
    required this.IOTEnergyUse
  });

  @override
  Widget build(BuildContext context) {
    return BasePage(
      appBar: AppBar(backgroundColor: Color(0xFF77BB81)),
      child: Stack(
        children: [
          Container(
            color: Color(0xFF77BB81),
            width: double.infinity,
            height: 200,
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 18),
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Color(0xFFFFEB85),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                SizedBox(height: 10,),
                Text("Control - $room", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color(0xFF8299ED),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Placeholder(fallbackHeight: 30,fallbackWidth: 30,),
                      Container(
                        width: 200,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Today: "),
                                Text("\$ 3.50"),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("This Month: "),
                                Text("\$ 105.00"),
                              ],
                            ),
                          ],
                        ),
                      ),
                      ],
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xFF8299ED),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(child: Text("Schedule Appliance", style: TextStyle(fontWeight: FontWeight.bold),)),
                ),
                SizedBox(height: 20,),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF8299ED),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: EdgeInsets.only(bottom: 20),
                    child: Column(
                      children: [
                        Text('Room Appliances'),
                        Container(
                          child: Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: iot.length,
                              itemBuilder: (BuildContext context, int index){
                                return EachItemInTheList(iotName: iot[index], IOTEnergyUse: IOTEnergyUse[index], room: room);
                              }, 
                              )
                          ),
                        ),
                        Container(
                          width: 200,
                          margin: EdgeInsets.symmetric(vertical: 5),
                          height: 40,
                          decoration: BoxDecoration(
                            color: Color(0xFF77BB81),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                          child: Center(child: Text("Add Appliance", style: TextStyle(fontWeight: FontWeight.bold),)),
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

class EachItemInTheList extends StatelessWidget {
  final String iotName;
  final int IOTEnergyUse;
  final String room;

  const EachItemInTheList({
    super.key,
    required this.iotName,
    required this.IOTEnergyUse,
    required this.room,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => IotDevicePage(room: room, iotName: iotName, IOTEnergyUse: IOTEnergyUse)),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Color(0XFFFFEB85),
            width: 4,
          ),
        ),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Placeholder(fallbackHeight: 30,fallbackWidth: 30,),
            Container(
              width: 150,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Energy Use:", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("$IOTEnergyUse\W", style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Status:"),
                      Text("Good"),
                    ],
                  ),
                ],
              ),
            )
            ],
        ),
      ),
    );
  }
}

//* Another Page
class IotDevicePage extends StatelessWidget {
  final String room;
  final String iotName;
  final int IOTEnergyUse;
  
  const IotDevicePage({
    super.key,
    required this.room,
    required this.iotName,
    required this.IOTEnergyUse,
  });

  @override
  Widget build(BuildContext context) {
    return BasePage(
      appBar: AppBar(
        backgroundColor: Color(0xFF77BB81),
      ),
      child: Stack(
        children: [
          Container(
            color: Color(0xFF77BB81),
            width: double.infinity,
            height: 200,
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 18),
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Color(0xFF8299ED),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                SizedBox(height: 10,),
                Text("$room - $iotName", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                SizedBox(
                  width: double.infinity,
                  height: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 10,),
                      Placeholder(fallbackWidth: 110,),
                      SizedBox(width: 20,),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 120,
                                height: 150,
                                child: SfCircularChart(
                                  series: <CircularSeries>[
                                    PieSeries<ChartData, String>(
                                      dataSource: <ChartData>[
                                        ChartData('Grid', IOTEnergyUse.toDouble()* 2/3),
                                        ChartData('Solar', IOTEnergyUse.toDouble()* 1/3),
                                      ],
                                      xValueMapper: (ChartData data, _) => data.x,
                                      yValueMapper: (ChartData data, _) => data.y,
                                      dataLabelSettings: DataLabelSettings(isVisible: true, textStyle: TextStyle(fontWeight: FontWeight.bold),),
                                      dataLabelMapper: (ChartData data, _) => '${data.x}\n${(data.y).round()}W',
                                      radius: '110%',
                                      strokeColor: Colors.black,
                                      strokeWidth: 2,
                                    ),
                                  ],
                                ),
                              ),
                      
                            ],
                          ),
                          Row(
                            children: [
                              Text("Power: "),
                              switch_onOff(),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                SizedBox(
                  width: double.infinity,
                  child: BrightnessSlider(),
                ),
                SizedBox(height: 20,),
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text("Color: ", style: TextStyle(fontWeight: FontWeight.bold)),
                       SizedBox(height: 5,),
                       SizedBox(
                        height: 20,
                        child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              color: Color(0xFFF6FF00),
                            )
                          ),
                          SizedBox(width: 5,),
                          Expanded(
                            child: Container(
                              color: Color(0xFFFBF66C),
                            )
                          ),
                          SizedBox(width: 5,),
                          Expanded(
                            child: Container(
                              color: Color(0xFFFFFFFF),
                            )
                          )
                        ],
                        ),
                       )
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                SizedBox(
                  height: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Schedule: ", style: TextStyle(fontWeight: FontWeight.bold)),
                      switch_onOff(),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text("On Time"),
                            Container(
                              width: 150,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                              ),
                              child: TimePickerSpinnerPopUp(
                                mode: CupertinoDatePickerMode.time,
                                initTime: DateTime.now(),
                                minuteInterval: 1,
                                padding: EdgeInsets.all(3),
                                timeFormat: 'HH:mm',
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            
                            )
                          ]
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text("Off Time"),
                            Container(
                              width: 150,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                              ),
                              child: TimePickerSpinnerPopUp(
                                mode: CupertinoDatePickerMode.time,
                                initTime: DateTime.now(),
                                minuteInterval: 1,
                                padding: EdgeInsets.all(3),
                                timeFormat: 'HH:mm',
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            
                            )
                          ]
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ), 
    );
  }
}

class BrightnessSlider extends StatefulWidget {
  const BrightnessSlider({
    super.key,
  });

  @override
  State<BrightnessSlider> createState() => _BrightnessSliderState();
}

class _BrightnessSliderState extends State<BrightnessSlider> {
  double _currentSliderValue = 20;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Brightness", style: TextStyle(fontWeight: FontWeight.bold),),
            Text("$_currentSliderValue", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
    
        Slider(
          value: _currentSliderValue,
          min: 0,
          max: 100,
          divisions: 5,
          label: _currentSliderValue.round().toString(),
          onChanged: (double value) {
            setState(() {
              _currentSliderValue = value;
            });
          },
        ),
      ],
    );
  }
}



class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}




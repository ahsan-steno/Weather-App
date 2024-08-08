import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';
import 'package:weather_update/consts.dart';
import 'package:weather_update/splash_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final WeatherFactory _wf = WeatherFactory(OPENWEATHER_API_KEY);
  Weather? weather;
  @override
  void initState() {

    super.initState();
    _wf.currentWeatherByCityName('Dubai').then((w){
      setState(() {
        weather = w;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,

      body:  _build(),



    );

  }
  Widget _build(){
    if (weather == null){
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return SizedBox(width: MediaQuery.sizeOf(context).width,
    height: MediaQuery.sizeOf(context).height,child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          locationHeader(),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.08,),
          dateTimeInfo(),
          SizedBox( height: MediaQuery.sizeOf(context).height *0.05,),
          weatherIcon(),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.02,),
           currentTemp(),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.02,),
           extraInfo(),
        ],
      ),
    );

  }
  Widget locationHeader()
  {
    return Text(weather?.areaName ?? "",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,color: Colors.white,
    ),
    );

}
Widget dateTimeInfo(){
    DateTime now = weather!.date!;
    return Column(
      children: [
        Text(DateFormat("h:mm a").format(now),
        style: TextStyle(fontSize: 35,color: Colors.white),
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(DateFormat("EEEE").format(now),
              style: TextStyle(fontSize: 20,color: Colors.white),
            ),
            Text("  ${DateFormat("d.m.y").format(now)}",
            style: TextStyle(
              fontWeight: FontWeight.w700,color: Colors.white,fontSize: 20
            ),)
          ],
        )
      ],
    );
}
Widget weatherIcon(){
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: Image(image: AssetImage('assets/pic_2.png'), height: 170,width: 170,),
        ),



        Text(weather?.weatherDescription ?? "", style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
      ],

    );
}

  Widget currentTemp() {
    return Text('${weather?.temperature?.celsius?.toStringAsFixed(0)} C',style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),);
  }

  Widget extraInfo() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.15,
        width: MediaQuery.sizeOf(context).height * 0.80,
        decoration: BoxDecoration(color: Colors.deepPurple,borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row( mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Text('Max: ${weather?.temperature?.celsius?.toStringAsFixed(0)} C',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                Text('Min: ${weather?.tempMin?.celsius?.toStringAsFixed(0)} C',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)
          ],
            ),
            Row( mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Wind: ${weather?.windSpeed?.toStringAsFixed(0)} m/s',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                Text('Humidity: ${weather?.humidity?.toStringAsFixed(0)} %',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)
              ],
            )
          ],
        ),

      ),
    );
  }
}


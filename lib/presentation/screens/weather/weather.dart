import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/const/const.dart';

import '../../../bussines_logic/bloc/weather_bloc.dart';
import '../../../data/models/weather2_model.dart';
import '../../../data/models/weather_model.dart';

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  late WeatherBloc weatherBloc = BlocProvider.of<WeatherBloc>(context);
  @override
  void initState() {
    //precacheImage(const AssetImage('assets/images/newweather2.jpg'), context);
    //precacheImage(const AssetImage('assets/images/night.jpg'), context);
    super.initState();
  }

  var cityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[900],
        body: Material(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                BlocBuilder<WeatherBloc, WeatherState>(
                    builder: (context, state) {
                  if (state is WeatherIsNotSearched) {
                    return Stack(
                      children: [
                        Container(
                            width: double.infinity,
                            height: 758,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                    AssetImage('assets/images/newweather2.jpg'),
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Stack(
                                      children: [
                                        Container(
                                          width:
                                              40, // Adjust the width and height according to your needs
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        Positioned.fill(
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: IconButton(
                                              icon: Icon(
                                                Icons.arrow_back,
                                                color: Color(
                                                    kPrimaryColor), // Change the color if needed
                                              ),
                                              onPressed: () {
                                                //BlocProvider.of<WeatherBloc>(context).close();
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        Container(
                          padding: EdgeInsets.only(
                            top: 250,
                            left: 32,
                            right: 32,
                          ),
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Search Weather",
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white70,
                                ),
                              ),
                              Text(
                                "Wherever you go",
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w200,
                                  color: Colors.white70,
                                ),
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              TextFormField(
                                controller: cityController,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.white70,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                      color: Colors.white70,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  hintText: "City Name",
                                  hintStyle: TextStyle(color: Colors.white70),
                                ),
                                style: TextStyle(color: Colors.white70),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    //primary: Color(kPrimaryColor),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          20), // Adjust the radius as needed
                                    ),
                                    // Change the color here
                                  ),
                                  onPressed: () {
                                    weatherBloc
                                        .add(FetchWeather(cityController.text));
                                  },
                                  child: Text(
                                    "Search",
                                    style: TextStyle(
                                        color: Colors.white70, fontSize: 16),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else if (state is WeatherIsLoading) {
                    return Container(
                        padding: const EdgeInsets.only(left: 35, right: 35),
                        width: double.infinity,
                        height: 758,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    "assets/images/newweather2.jpg"))),
                        child:
                            const Center(child: CircularProgressIndicator()));
                  } else if (state is WeatherIsLoaded)
                    return ShowWeather(weatherBloc, state.getWeather,
                        cityController.text, state.get2Weather);
                  else
                    return Stack(
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          height: 758,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage("assets/images/night.jpg"))),
                        ),
                        Container(
                          padding:
                              EdgeInsets.only(left: 35, right: 35, top: 390),
                          child: Column(
                            children: [
                              Text(
                                "Wrong Search",
                                style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white70),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    // primary: Color(kPrimaryColor),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          20), // Adjust the radius as needed
                                    ),
                                    // Change the color here
                                  ),
                                  onPressed: () {
                                    weatherBloc.add(ResetWeather());
                                  },
                                  child: Text(
                                    "Search",
                                    style: TextStyle(
                                        color: Colors.white70, fontSize: 16),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                })
              ],
            ),
          ),
        ));
  }
}

class ShowWeather extends StatelessWidget {
  WeatherModel weather;
  Weather2Model weather2;
  String city;
  late WeatherBloc weatherBloc;

  ShowWeather(
    this.weatherBloc,
    this.weather,
    this.city,
    this.weather2,
  );
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 758,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/night.jpg'),
            ),
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Stack(
                    children: [
                      Container(
                        width:
                            40, // Adjust the width and height according to your needs
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Color(
                                  kPrimaryColor), // Change the color if needed
                            ),
                            onPressed: () {
                              weatherBloc.add(ResetWeather());
                            },
                          ),
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
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 120,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      city,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      weather2.getDesc.toString(),
                      style: TextStyle(fontSize: 20, color: Colors.white30),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 210,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    weather.getTempMin.round().toString() + "C",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    weather2.getMain.toString(),
                    style: TextStyle(fontSize: 20, color: Colors.white30),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              Divider(
                thickness: 2,
                height: 30,
                color: Colors.black,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        weather.getTempMin.round().toString() + "C",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        "Min Temp",
                        style: TextStyle(color: Colors.white30),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        weather.getTempMax.round().toString() + "C",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        "Max Temp",
                        style: TextStyle(color: Colors.white30),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        weather.getPressure.round().toString() + "%",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        "Humidity",
                        style: TextStyle(color: Colors.white30),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        weather.getHumidity.round().toString() + "Pa",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        "Pressure",
                        style: TextStyle(color: Colors.white30),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    //    primary: Color(kPrimaryColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          20), // Adjust the radius as needed
                    ),
                    // Change the color here
                  ),
                  onPressed: () {
                    weatherBloc.add(ResetWeather());
                  },
                  child: Text(
                    "Search",
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

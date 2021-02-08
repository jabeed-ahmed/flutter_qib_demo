import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qib_app/src/business_logic/bloc/weather_bloc.dart';
import 'package:qib_app/src/business_logic/model/weather_model.dart';
import 'package:qib_app/src/views/utils/colors.dart';
import 'package:qib_app/src/views/utils/style.dart';
import 'package:qib_app/src/views/utils/utility.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bloc = WeatherBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.fetchTorontoWeather();
    bloc.fetchLondonWeather();
    bloc.fetchNewYorkWeather();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: parseColor(themePrimaryColor),
        title: Text(
          "Home",
          style: AppBarTextStyle,
        ),
        automaticallyImplyLeading: false,
      ),
      body: _homeUI(context),
    );
  }

  Widget _homeUI(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            _weatherLondonUI(context),
            _weatherNewYorkUI(context),
            _weatherTorontoUI(context),
            // _testProgressBarUI(context),
          ],
        ),
      ),
    );
  }

  /* WEATHER LONDON UI  */
  Widget _weatherLondonUI(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
      child: Container(
        child: Wrap(
          children: [
            StreamBuilder(
              stream: bloc.getLondonWeather,
              builder: (context, AsyncSnapshot<WeatherModel> snapshot) {
                if (snapshot.hasData) {
                  return Card(
                    child: Row(
                      children: [
                        Container(
                          width: 120.0,
                          height: 120.0,
                          child: Image.network(snapshot.data.imageUrl),
                        ),
                        horizontalDivider(10.0),
                        Container(
                          child: Text(
                            snapshot.data.temp,
                            style: textStyle(parseColor(themeSecondaryColor),
                                FontWeight.normal, 50.0),
                          ),
                        ),
                        new SizedBox(
                          width: 10.0,
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                snapshot.data.title,
                                style: textStyle(
                                    parseColor(themeSecondaryColor),
                                    FontWeight.normal,
                                    22.0),
                              ),
                              verticalDivider(5.0),
                              Text(
                                snapshot.data.city,
                                style: textStyle(
                                    parseColor(themeSecondaryColor),
                                    FontWeight.normal,
                                    RegularTextSize),
                              ),
                              verticalDivider(5.0),
                              Text(
                                snapshot.data.date,
                                style: textStyle(
                                    parseColor(themeSecondaryColor),
                                    FontWeight.normal,
                                    SmallTextSize),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                return Column(
                  children: [
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  /* WEATHER NEW YORK UI  */
  Widget _weatherNewYorkUI(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 2.0),
      child: Container(
        child: Wrap(
          children: [
            StreamBuilder(
              stream: bloc.getNewYorkWeather,
              builder: (context, AsyncSnapshot<WeatherModel> snapshot) {
                if (snapshot.hasData) {
                  return Card(
                    child: Row(
                      children: [
                        Container(
                          width: 120.0,
                          height: 120.0,
                          child: Image.network(snapshot.data.imageUrl),
                        ),
                        horizontalDivider(10.0),
                        Container(
                          child: Text(
                            snapshot.data.temp,
                            style: textStyle(parseColor(themeSecondaryColor),
                                FontWeight.normal, 50.0),
                          ),
                        ),
                        horizontalDivider(10.0),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                snapshot.data.title,
                                style: textStyle(
                                    parseColor(themeSecondaryColor),
                                    FontWeight.normal,
                                    22.0),
                              ),
                              verticalDivider(5.0),
                              Text(
                                snapshot.data.city,
                                style: textStyle(
                                    parseColor(themeSecondaryColor),
                                    FontWeight.normal,
                                    RegularTextSize),
                              ),
                              verticalDivider(5.0),
                              Text(
                                snapshot.data.date,
                                style: textStyle(
                                    parseColor(themeSecondaryColor),
                                    FontWeight.normal,
                                    SmallTextSize),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                return Column(
                  children: [
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  /* WEATHER TORONTO UI  */
  Widget _weatherTorontoUI(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 2.0),
      child: Container(
        child: Wrap(
          children: [
            StreamBuilder(
              stream: bloc.getTorontoWeather,
              builder: (context, AsyncSnapshot<WeatherModel> snapshot) {
                if (snapshot.hasData) {
                  return Card(
                    child: Row(
                      children: [
                        Container(
                          width: 120.0,
                          height: 120.0,
                          child: Image.network(snapshot.data.imageUrl),
                        ),
                        horizontalDivider(10.0),
                        Container(
                          child: Text(
                            snapshot.data.temp,
                            style: textStyle(parseColor(themeSecondaryColor),
                                FontWeight.normal, 50.0),
                          ),
                        ),
                        horizontalDivider(10.0),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                snapshot.data.title,
                                style: textStyle(
                                    parseColor(themeSecondaryColor),
                                    FontWeight.normal,
                                    22.0),
                              ),
                              verticalDivider(5.0),
                              Text(
                                snapshot.data.city,
                                style: textStyle(
                                    parseColor(themeSecondaryColor),
                                    FontWeight.normal,
                                    RegularTextSize),
                              ),
                              verticalDivider(5.0),
                              Text(
                                snapshot.data.date,
                                style: textStyle(
                                    parseColor(themeSecondaryColor),
                                    FontWeight.normal,
                                    SmallTextSize),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                return Column(
                  children: [
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _testProgressBarUI(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Wrap(
          children: [
            StreamBuilder(
              stream: bloc.getTorontoWeather,
              builder: (context, AsyncSnapshot<WeatherModel> snapshot) {
                if (snapshot.hasData) {
                  return Card(
                    child: Column(
                      children: [
                        Center(
                          child: CircularProgressIndicator(),
                        ),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                return Column(
                  children: [
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:prayer_api_flutter/prayer_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;
  bool isError = false;
  late Prayers prayersTimings;

  Client client = Client();

  Future LoadData() async {
    isLoading = true;
    String url =
        'https://api.aladhan.com/v1/timingsByCity/20-02-2023?city=Abbottabad&country=Pakistan&method=8';
    Uri uri = Uri.parse(url);
    Response response = await client.get(uri);
    isLoading = false;
    // print(response.body);
    if (response.statusCode == 200) {
      final apiData = jsonDecode(response.body);
      prayersTimings = Prayers.fromMap(apiData);
      print(prayersTimings.data!.timings!.asr); 
      return prayersTimings;

      // prayers.data!.forEach((element) {

      //   prayerList.add(element.date);
      // });
    } else {
      isError = true;
      print(response.statusCode);
    }
  }

  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoadData();
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prayer Api'),
        centerTitle: true,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : isError
              ? Text('Error')
              : FutureBuilder(
                  future: LoadData(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return Center(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text('Prayer Timings Abbottabad',
                                    style: TextStyle(
                                        color: Colors.amber, fontSize: 20.0)),
                                SizedBox(
                                  width: 50.0,
                                ),
                                Text(snapshot.data.data!.date!.readable,
                                    style: TextStyle(
                                        color: Colors.amber, fontSize: 20.0))
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    children: [
                                      Text('Fajar:',
                                          style: TextStyle(fontSize: 20.0)),
                                      Text('Zohar:',
                                          style: TextStyle(fontSize: 20.0)),
                                      Text('Asar:',
                                          style: TextStyle(fontSize: 20.0)),
                                      Text('Maghrib:',
                                          style: TextStyle(fontSize: 20.0)),
                                      Text('Isha:',
                                          style: TextStyle(fontSize: 20.0))
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        snapshot.data.data!.timings!.fajr,
                                        style: TextStyle(fontSize: 20.0),
                                      ),
                                      Text(snapshot.data.data!.timings!.dhuhr,
                                          style: TextStyle(fontSize: 20.0)),
                                      Text(snapshot.data.data!.timings!.asr,
                                          style: TextStyle(fontSize: 20.0)),
                                      Text(snapshot.data.data!.timings!.maghrib,
                                          style: TextStyle(fontSize: 20.0)),
                                      Text(snapshot.data.data!.timings!.isha,
                                          style: TextStyle(fontSize: 20.0)),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    }
                    return Text('loading');
                  }),
      bottomNavigationBar: NavigationBar(
          height: 50.0,
          selectedIndex: currentIndex,
          onDestinationSelected: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
                icon: Icon(Icons.settings), label: 'Settings'),
            NavigationDestination(icon: Icon(Icons.person), label: 'User'),
          ]),
    );
  }
}

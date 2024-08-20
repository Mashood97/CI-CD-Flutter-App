import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';
//
// import 'features/locate/presentation/pages/locate_view.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('Rocket Launcher Animation')),
//         body: MapScreen(),
//       ),
//     );
//   }
// }
//
// class MapScreen extends StatefulWidget {
//   @override
//   _MapScreenState createState() => _MapScreenState();
// }
//
// class _MapScreenState extends State<MapScreen> with TickerProviderStateMixin {
//   late MapController mapController;
//
//   List<AnimationController> _rocketControllers = [];
//   List<Animation<double>> _rocketAnimations = [];
//   List<LatLng> _rocketPositions = [];
//
//   final List<Map<String, LatLng>> _markerPairs = [
//     {'origin': LatLng(37.7749, -122.4194), 'destination': LatLng(37.7849, -122.4294)},
//     {'origin': LatLng(37.7849, -122.4294), 'destination': LatLng(37.7949, -122.4394)},
//     {'origin': LatLng(37.7949, -122.4394), 'destination': LatLng(37.8049, -122.4494)},
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     mapController = MapController();
//
//     for (int i = 0; i < _markerPairs.length; i++) {
//       final origin = _markerPairs[i]['origin']!;
//       final destination = _markerPairs[i]['destination']!;
//
//       final AnimationController controller = AnimationController(
//         vsync: this,
//         duration: const Duration(seconds: 3),
//       );
//
//       final Animation<double> animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
//
//         animation.addListener(() {
//           setState(() {
//             _updateRocketPosition(i, origin, destination, animation.value);
//           });
//         });
//
//       _rocketControllers.add(controller);
//       _rocketAnimations.add(animation);
//       _rocketPositions.add(origin);
//
//       controller.forward();
//     }
//   }
//
//   void _updateRocketPosition(int index, LatLng origin, LatLng destination, double progress) {
//     final double latDiff = destination.latitude - origin.latitude;
//     final double lngDiff = destination.longitude - origin.longitude;
//
//     final double newLat = origin.latitude + (progress * latDiff);
//     final double newLng = origin.longitude + (progress * lngDiff);
//
//     _rocketPositions[index] = LatLng(newLat, newLng);
//   }
//
//   @override
//   void dispose() {
//     for (var controller in _rocketControllers) {
//       controller.dispose();
//     }
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         FlutterMap(
//           mapController: mapController,
//           options: MapOptions(
//             initialCenter: _markerPairs.first['origin']! ,
//             initialZoom: 10.0,
//           ),
//           children: [
//             openStreetMapTileLayer,
//             MarkerLayer(markers: _rocketPositions.map((position) {
//               return Marker(
//                 point: position,
//                 child:  Icon(
//                   Icons.rocket_launch,
//                   color: Colors.red,
//                   size: 50.0,
//                 ),
//               );
//             }).toList(),)
//           ],
//
//         ),
//       ],
//     );
//   }
// }


//location.json
// {
//   "launch_sites": [
//     {
//       "attempted_launches": 3,
//       "details": "SpaceX's first east coast landing pad is Landing Zone 1, where the historic first Falcon 9 landing occurred in December 2015. LC-13 was originally used as a launch pad for early Atlas missiles and rockets from Lockheed Martin. LC-1 was later expanded to include Landing Zone 2 for side booster RTLS Falcon Heavy missions, and it was first used in February 2018 for that purpose.",
//       "id": "5e9e3032383ecb267a34e7c7",
//       "location": {
//         "latitude": 69.12406746327187,
//         "longitude": 76.77442483309576,
//         "name": "Launching Zone 1"
//       },
//       "location_landing": {
//         "latitude": 70.12406746327187,
//         "longitude": 77.77442483309576,
//         "name": "Landing Zone 1"
//       },
//       "name": "LZ-1",
//       "status": "active",
//       "successful_launches": 0,
//       "wikipedia": "https://en.wikipedia.org/wiki/Landing_Zones_1_and_2"
//     },
//     {
//       "attempted_launches": 8,
//       "details": "SpaceX's first east coast landing pad is Landing Zone 2, where the historic first Falcon 9 landing occurred in December 2020. LC-16 was originally used as a launch pad for early Atlas missiles and rockets from Lockheed Martin. LC-2 was later expanded to include Landing Zone 2 for side booster RTLS Falcon Heavy missions, and it was first used in February 2021 for that purpose.",
//       "id": "5e9e3032383ecb90a834e7c8",
//       "location": {
//         "latitude": 69.88406746327187,
//         "longitude": 76.33442483309576,
//         "name": "Launching Zone 2"
//       },
//       "location_landing": {
//         "latitude": 70.88406746327187,
//         "longitude": 77.33442483309576,
//         "name": "Landing Zone 2"
//       },
//       "name": "LZ-2",
//       "status": "active",
//       "successful_launches": 0,
//       "wikipedia": "https://en.wikipedia.org/wiki/Landing_Zones_1_and_2"
//     },
//     {
//       "attempted_launches": 10,
//       "details": "SpaceX's west coast landing pad. The pad is adjacent to SLC-4E, SpaceX's west coast launch site. The pad was under construction for about a year starting in 2016. After concerns with seal mating season, this pad was first used for the SAOCOM 1A mission in October 2018. Officially referred to as LZ-4 in FCC filings.",
//       "id": "5e9e3032383ecb554034e7c9",
//       "location": {
//         "latitude": 69.50906746327127,
//         "longitude": 76.97442483309576,
//         "name": "Launching Zone 3"
//       },
//       "location_landing": {
//         "latitude": 70.50906746327127,
//         "longitude": 77.97442483309576,
//         "name": "Landing Zone 3"
//       },
//       "name": "LZ-4",
//       "status": "active",
//       "successful_launches": 1,
//       "wikipedia": "https://en.wikipedia.org/wiki/Vandenberg_AFB_Space_Launch_Complex_4#LZ-4_landing_history"
//     },
//     {
//       "attempted_launches": 25,
//       "details": "The second ASDS barge, Of Course I Still Love You (OCISLY), had been under construction in a Louisiana shipyard since early 2015 using a different hull—Marmac 304—in order to service launches on the east coast. It was built as a replacement for the first Just Read the Instructions and entered operational service for Falcon 9 Flight 19 in late June 2015. As of June 2015, its home port was Jacksonville, Florida, but after December 2015, it was transferred 160 miles (260 km) further south, at Port Canaveral. While the dimensions of the ship are nearly identical to the first ASDS, several enhancements were made including a steel blast wall erected between the aft containers and the landing deck. The ship was in place for a first-stage landing test on the CRS-7 mission, which failed on launch on 28 June 2015. On 8 April 2016 the first stage, which launched the Dragon CRS-8 spacecraft, successfully landed for the first time ever on OCISLY, which is also the first ever drone ship landing. In February 2018, the Falcon Heavy Test Flight's central core exploded upon impact next to OCISLY that damaged two of the four thrusters on the drone ship. Two thrusters were removed from the Marmac 303 barge in order to repair OCISLY.",
//       "id": "5e9e3032383ecb6bb234e7ca",
//       "location": {
//         "latitude": 69.70906746327127,
//         "longitude": 76.67442483309576,
//         "name": "Launching Zone 4"
//       },
//       "location_landing": {
//         "latitude": 70.70906746327127,
//         "longitude": 77.67442483309576,
//         "name": "Landing Zone 4"
//       },
//       "name": "OCISLY",
//       "status": "active",
//       "successful_launches": 6,
//       "wikipedia": "https://en.wikipedia.org/wiki/Autonomous_spaceport_drone_ship"
//     }
//   ]
// }

//--- LocateView


//import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';

// import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
// import 'package:space_x_project/features/locate/presentation/manager/fetch_launch_zones_bloc.dart';
// import 'package:space_x_project/utils/constant/app_snack_bar.dart';
// import 'package:space_x_project/widgets/error/app_error.dart';
// import 'package:space_x_project/widgets/loader/app_loader.dart';

// import '../../../../utils/dependency_injector/di_container.dart';
// import '../manager/geo_fence/user_location_tracking_bloc.dart';
// import '../manager/launch_zone_details/launch_zone_details_cubit.dart';
// import '../widgets/launch_zone_detail_card.dart';
// import '../widgets/zoom_buttons.dart';

// TileLayer get openStreetMapTileLayer => TileLayer(
//       urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
//       userAgentPackageName: 'dev.fleaflet.flutter_map.example',
//       tileProvider: CancellableNetworkTileProvider(),
//     );

// class LocateView extends StatefulWidget {
//   const LocateView({super.key});

//   @override
//   State<LocateView> createState() => _LocateViewState();
// }

// class _LocateViewState extends State<LocateView> with TickerProviderStateMixin {
//   late FetchLaunchZonesBloc fetchLaunchZonesBloc;
//   late LaunchZoneDetailsCubit launchZoneDetailsCubit;
//   late UserLocationTrackingBloc userLocationTrackingBloc;

//   List<AnimationController> _rocketControllers = [];
//   List<Animation<double>> _rocketAnimations = [];
//   List<LatLng> _rocketPositions = [];

//   double zoom = 7;

//   @override
//   void initState() {
//     super.initState();
//     launchZoneDetailsCubit = sl.get<LaunchZoneDetailsCubit>();
//     fetchLaunchZonesBloc = sl.get<FetchLaunchZonesBloc>();
//     userLocationTrackingBloc = sl.get<UserLocationTrackingBloc>();
//     userLocationTrackingBloc.add(LocationStarted());

//     fetchLaunchZonesBloc.add(FetchRocketLaunchZonesEvent());
//   }

//   static final MapController _mapController = MapController();

//   void _updateRocketPosition(
//       int index, LatLng origin, LatLng destination, double progress) {
//     final double latDiff = destination.latitude - origin.latitude;
//     final double lngDiff = destination.longitude - origin.longitude;

//     final double newLat = origin.latitude + (progress * latDiff);
//     final double newLng = origin.longitude + (progress * lngDiff);

//     _rocketPositions[index] = LatLng(newLat, newLng);
//   }

//   @override
//   void dispose() {
//     fetchLaunchZonesBloc.close();
//     launchZoneDetailsCubit.close();
//     userLocationTrackingBloc.close();

//     for (var controller in _rocketControllers) {
//       controller.dispose();
//     }
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Locate')),
//       body: BlocProvider.value(
//         value: userLocationTrackingBloc,
//         child: BlocBuilder<UserLocationTrackingBloc, UserLocationTrackingState>(
//           buildWhen: (previous, current) => previous != current,
//           builder: (context, locationState) {
//             if (locationState is UserLocationTrackingInitial) {
//               return const Center(child: Text('Fetching Location'));
//             }
//             if (locationState is UserLocationTrackingLoadSuccess) {
//               return Padding(
//                 padding: const EdgeInsets.all(8),
//                 child: Column(
//                   children: [
//                     Flexible(
//                       child: BlocProvider.value(
//                         value: fetchLaunchZonesBloc,
//                         child: BlocConsumer<FetchLaunchZonesBloc,
//                             FetchLaunchZonesState>(
//                           buildWhen: (previous, current) => previous != current,
//                           listener: (ctx, state) {
//                             if (state is FetchLaunchZonesFailure) {
//                               AppSnackBar().showErrorSnackBar(
//                                   context: ctx,
//                                   errorMessage: state.errorMessage);
//                             }
//                             if (state is FetchLaunchZonesLoaded) {

//                               for (int i = 0;
//                                   i < state.launchZoneEntityList.length;
//                                   i++) {
//                                 final origin = LatLng(
//                                   state.launchZoneEntityList[i]
//                                       .launchZoneLocationEntity.longitude,
//                                   state.launchZoneEntityList[i]
//                                       .launchZoneLocationEntity.latitude,
//                                 );
//                                 final destination = LatLng(
//                                   state.launchZoneEntityList[i]
//                                       .landingZoneLocationEntity.longitude,
//                                   state.launchZoneEntityList[i]
//                                       .landingZoneLocationEntity.latitude,
//                                 );

//                                 final AnimationController controller =
//                                     AnimationController(
//                                   vsync: this,
//                                   duration: const Duration(seconds: 3),
//                                 );

//                                 final Animation<double> animation =
//                                     Tween<double>(begin: 0.0, end: 1.0)
//                                         .animate(controller);

//                                 animation.addListener(() {
//                                   setState(() {
//                                     _updateRocketPosition(i, origin,
//                                         destination, animation.value);
//                                   });
//                                 });

//                                 _rocketControllers.add(controller);
//                                 _rocketAnimations.add(animation);
//                                 _rocketPositions.add(origin);

//                                 controller.forward();
//                               }

//                               print(state.launchZoneEntityList.first.launchId);
//                               launchZoneDetailsCubit.fetchLaunchZoneDetails(
//                                   launchZoneId: state
//                                       .launchZoneEntityList.first.launchId);
//                             }
//                           },
//                           builder: (context, state) {
//                             if (state is FetchLaunchZonesLoading) {
//                               return const AppLoader();
//                             }
//                             if (state is FetchLaunchZonesFailure) {
//                               return AppError(
//                                 appErrorMessage: state.errorMessage,
//                               );
//                             }
//                             if (state is FetchLaunchZonesLoaded) {
//                               return FlutterMap(
//                                 mapController: _mapController,
//                                 options: MapOptions(
//                                   keepAlive: true,
//                                   initialCenter: LatLng(
//                                       state.launchZoneEntityList.last
//                                           .launchZoneLocationEntity.latitude,
//                                       state.launchZoneEntityList.last
//                                           .launchZoneLocationEntity.longitude),
//                                   initialZoom: zoom,
//                                   //
//                                   //
//                                   maxZoom: 25,
//                                   minZoom: 3,
//                                 ),
//                                 children: [
//                                   openStreetMapTileLayer,
//                                   MarkerLayer(markers: [
//                                     Marker(
//                                         height: 36,
//                                         width: 36,
//                                         point: LatLng(
//                                             locationState.position.latitude,
//                                             locationState.position.longitude),
//                                         child: IconButton(
//                                           tooltip: "User",
//                                           onPressed: () {},
//                                           iconSize: 36.0,
//                                           icon: const Icon(
//                                             Icons.person,
//                                             color: Colors.black,
//                                           ),
//                                         )),
//                                   ]),
//                                   MarkerLayer(
//                                       markers: state.launchZoneEntityList
//                                           .map((locData) {
//                                     return Marker(
//                                         height: 36,
//                                         width: 36,
//                                         point: LatLng(
//                                             locData.launchZoneLocationEntity
//                                                 .latitude,
//                                             locData.launchZoneLocationEntity
//                                                 .longitude),
//                                         child: IconButton(
//                                           tooltip: locData
//                                               .launchZoneLocationEntity
//                                               .locationName,
//                                           onPressed: () {
//                                             launchZoneDetailsCubit
//                                                 .fetchLaunchZoneDetails(
//                                                     launchZoneId:
//                                                         locData.launchId);
//                                           },
//                                           iconSize: 36.0,
//                                           icon: const Icon(
//                                             Icons.location_on_rounded,
//                                             color: Colors.red,
//                                           ),
//                                         ));
//                                   }).toList()),
//                                   MarkerLayer(
//                                       markers: state.launchZoneEntityList
//                                           .map((locData) {
//                                     return Marker(
//                                         height: 36,
//                                         width: 36,
//                                         point: LatLng(
//                                             locData.landingZoneLocationEntity
//                                                 .latitude,
//                                             locData.landingZoneLocationEntity
//                                                 .longitude),
//                                         child: IconButton(
//                                           tooltip: locData
//                                               .landingZoneLocationEntity
//                                               .locationName,
//                                           onPressed: () {
//                                             launchZoneDetailsCubit
//                                                 .fetchLaunchZoneDetails(
//                                                     launchZoneId:
//                                                         locData.launchId);
//                                           },
//                                           iconSize: 36.0,
//                                           icon: const Icon(
//                                             Icons.location_on_rounded,
//                                             color: Colors.blue,
//                                           ),
//                                         ));
//                                   }).toList()),
//                                   MarkerLayer(
//                                     markers: _rocketPositions.map((position) {
//                                       return Marker(
//                                         point: position,
//                                         child: const Icon(
//                                           Icons.rocket_launch,
//                                           color: Colors.red,
//                                           size: 50.0,
//                                         ),
//                                       );
//                                     }).toList(),
//                                   ),
//                                   PolylineLayer(
//                                     polylines: state.launchZoneEntityList
//                                         .map(
//                                           (locData) => Polyline(
//                                             pattern:
//                                                 const StrokePattern.dotted(),
//                                             points: [
//                                               LatLng(
//                                                   locData
//                                                       .launchZoneLocationEntity
//                                                       .latitude,
//                                                   locData
//                                                       .launchZoneLocationEntity
//                                                       .longitude),
//                                               LatLng(
//                                                   locData
//                                                       .landingZoneLocationEntity
//                                                       .latitude,
//                                                   locData
//                                                       .landingZoneLocationEntity
//                                                       .longitude)
//                                               // Amsterdam, Netherlands
//                                             ],
//                                             color: Colors.green,
//                                             // strokeWidth: 2,
//                                           ),
//                                         )
//                                         .toList(),
//                                   ),
//                                   Align(
//                                     alignment: Alignment.bottomLeft,
//                                     child: ZoomButtons(
//                                       onIncrementPressed: () {
//                                         if (zoom < 25 && zoom > 0) {
//                                           setState(() {
//                                             zoom++;
//                                           });

//                                           _mapController.move(
//                                               _mapController.camera.center,
//                                               zoom);
//                                         }
//                                       },
//                                       onDecrementPressed: () {
//                                         if (zoom > 3) {
//                                           setState(() {
//                                             zoom--;
//                                           });
//                                           _mapController.move(
//                                               _mapController.camera.center,
//                                               zoom);
//                                         }
//                                       },
//                                     ),
//                                   ),
//                                   Align(
//                                     alignment: Alignment.bottomRight,
//                                     child: FloatingActionButton.small(
//                                       heroTag: null,
//                                       onPressed: () {
//                                         _mapController.move(
//                                             LatLng(
//                                                 locationState.position.latitude,
//                                                 locationState
//                                                     .position.longitude),
//                                             zoom);
//                                       },
//                                       child: const Icon(
//                                           Icons.location_searching_rounded),
//                                     ),
//                                   )
//                                 ],
//                               );
//                             }
//                             return const AppError();
//                           },
//                         ),
//                       ),
//                     ),
//                     const Divider(),
//                     BlocProvider.value(
//                       value: launchZoneDetailsCubit,
//                       child: BlocConsumer<LaunchZoneDetailsCubit,
//                               LaunchZoneDetailsState>(
//                           buildWhen: (previous, current) => previous != current,
//                           listener: (ctx, state) {
//                             if (state is LaunchZoneDetailsFailure) {
//                               AppSnackBar().showErrorSnackBar(
//                                   context: ctx,
//                                   errorMessage: state.errorMessage);
//                             }
//                           },
//                           builder: (ctx, state) {
//                             if (state is LaunchZoneDetailsLoading) {
//                               return const AppLoader();
//                             }

//                             if (state is LaunchZoneDetailsFailure) {
//                               return AppError(
//                                 appErrorMessage: state.errorMessage,
//                               );
//                             }
//                             if (state is LaunchZoneDetailsLoaded) {
//                               final result = state.launchZoneEntity;
//                               return LaunchZoneDetailCard(
//                                 launchZoneEntity: result,
//                               );
//                             }
//                             return const AppError();
//                           }),
//                     ),
//                   ],
//                 ),
//               );
//             }
//             return const Center(child: CircularProgressIndicator());
//           },
//         ),
//       ),
//     );
//   }
// }

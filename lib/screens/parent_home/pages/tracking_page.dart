import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:school_sawaari_app/constants.dart';
import 'package:school_sawaari_app/data_handler/app_data.dart';
import 'package:school_sawaari_app/models/address.dart';
import 'file:///C:/Users/HAMZA/AndroidStudioProjects/SchoolSawaari/lib/screens/search_screen/search_screen.dart';
import 'package:school_sawaari_app/widgets/divider.dart';
import 'package:school_sawaari_app/assistants/assistant_methods.dart';

class TrackingPage extends StatefulWidget {
  final String routeName = '/tracking_page';

  @override
  _TrackingPageState createState() => _TrackingPageState();
}

class _TrackingPageState extends State<TrackingPage> {
  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  GoogleMapController newGoogleMapController;
  AppData placeAddress;

  Address adrs=Address();

  static final CameraPosition _kGooglePlex =
      CameraPosition(target: LatLng(30.6628055, 73.024696), zoom: 14.4746);

   Position currentPosition ;
   var geoLocator = Geolocator();
   double bottomPaddingOfMap = 0;

   void locatePosition() async{
     Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
     currentPosition = position;

     LatLng latLngPosition = LatLng(position.latitude, position.longitude);

     CameraPosition cameraPosition = new CameraPosition(target: latLngPosition,zoom: 14);
     newGoogleMapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

     String address = await AssistantMethods.searchCoordinateAddress(position, context);
     print("This is your Address :: " + address);
   }

  @override
  Widget build(BuildContext context) {
    AppData _appData=Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Tracking Page',
          style: TextStyle(
              fontFamily: 'Muli', color: Color(0XFF8B8B8B), fontSize: 18),
        ),
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          GoogleMap(
            padding: EdgeInsets.only(bottom: bottomPaddingOfMap),
            initialCameraPosition: _kGooglePlex,
            myLocationEnabled: true,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: true,
            onMapCreated: (GoogleMapController controller) {

              _controllerGoogleMap.complete(controller);
              newGoogleMapController = controller;

              setState(() {
                bottomPaddingOfMap = 290.0;
              });

              locatePosition();
            },
            mapType: MapType.normal,
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: Container(
              height: 290.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18.0),
                  topRight: Radius.circular(18.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 16.4,
                    spreadRadius: 0.5,
                    offset: Offset(0.7, 0.7),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      'Hi there,',
                      style: TextStyle(fontSize: 12.0),
                    ),
                    Text(
                      'Where to?',
                      style:
                          TextStyle(fontSize: 20.0, fontFamily: "Brand-Bold"),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Provider.of<AppData>(context).pickUpLocation != null ?  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChangeNotifierProvider.value(value:_appData,
                          child: SearchScreen(),)));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54,
                              blurRadius: 6.0,
                              spreadRadius: 0.5,
                              offset: Offset(0.7, 0.7),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.search,
                                color: kPrimaryColor,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text('Search Drop Off')
                            ],
                          ),
                        ),
                      ),
                    ):Container(child: Center(child: Text("Please Wait..."),),),
                    SizedBox(
                      height: 24.0,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.home,
                          color: kPrimaryColor,
                        ),
                        SizedBox(width: 12.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Provider.of<AppData>(context).pickUpLocation != null ?
                              Provider.of<AppData>(context).pickUpLocation.placeName
                                  : 'Add Home',
                            ),
                            SizedBox(
                              height: 4.0,
                            ),
                            Text(
                              'Your living home address',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 12.0),
                            )
                          ],
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 10.0,
                    ),

                    DividerWidget(),

                    SizedBox(
                      height: 16.0,
                    ),

                    Row(
                      children: [
                        Icon(
                          Icons.work,
                          color: kPrimaryColor,
                        ),
                        SizedBox(width: 12.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Add Work'),
                            SizedBox(
                              height: 4.0,
                            ),
                            Text(
                              'Your office address',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 12.0),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
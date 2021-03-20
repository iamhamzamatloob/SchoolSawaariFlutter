import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:school_sawaari_app/assistants/request_assistant.dart';
import 'package:school_sawaari_app/data_handler/app_data.dart';
import 'package:school_sawaari_app/models/address.dart';

class AssistantMethods{
  static Future<String> searchCoordinateAddress(Position position, context) async{

    String placeAddress = "";
    String st1, st2, st3, st4;

    String url = "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=AIzaSyBEbIBleAtxX9q8IEc5hCBKp841L6e23ik";

    var response = await RequestAssistant.getRequest(url);

    if(response != "failed"){

      // placeAddress = response["results"][0]["formatted_address"];
      st1 = response["results"][0]["address_components"][0]["long_name"];
      st2 = response["results"][0]["address_components"][3]["long_name"];
      // st3 = response["results"][0]["address_components"][4]["long_name"];
      // st4 = response["results"][0]["address_components"][6]["long_name"];
      placeAddress = st1 + ", " + st2;

      Address userPickUpAddress = new Address();
      userPickUpAddress.latitude = position.latitude;
      userPickUpAddress.longitude = position.longitude;
      userPickUpAddress.placeName = placeAddress;
      
      Provider.of<AppData>(context, listen: false).updatePickUpLocationAddress(userPickUpAddress);
    }
    return placeAddress;
  }
}
import 'package:geolocator/geolocator.dart';
import 'package:school_sawaari_app/assistants/request_assistant.dart';

class AssistantMethods{
  static Future<String> searchCoordinateAddress(Position position) async{
    String placeAddress = "";
    String url = "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=AIzaSyBEbIBleAtxX9q8IEc5hCBKp841L6e23ik";

    var response = await RequestAssistant.getRequest(url);
    if(response != "failed"){
      placeAddress = response["results"][0]["formatted_address"];
    }
    return placeAddress;
  }
}
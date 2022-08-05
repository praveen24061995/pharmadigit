import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:location/location.dart';

class ClientGeotagging extends StatefulWidget {
  const ClientGeotagging({super.key});

  @override
  State<ClientGeotagging> createState() => _ClientGeotaggingState();
}

class _ClientGeotaggingState extends State<ClientGeotagging> {
  var location = new Location();
  late Map<String, double> userLocation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            userLocation == null
                ? CircularProgressIndicator()
                : Text("Location:" +
                    userLocation["latitude"].toString() +
                    " " +
                    userLocation["longitude"].toString()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  _getLocation().then((value) {
                    setState(() {
                      userLocation = value;
                    });
                  });
                },
                child: Text(
                  "Get Location",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<Map<String, double>> _getLocation() async {
    var currentLocation = <String, double>{};
    try {
      currentLocation = (await location.getLocation()) as Map<String, double>;
    } catch (e) {
      currentLocation = null!;
    }
    return currentLocation;
  }
}

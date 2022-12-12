// All
import 'package:flutter/material.dart';
import 'package:wisata_nusantara_mobile/components/Drawer.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: buildDrawer(context),
      body: Center(
        child: Container(
            decoration: BoxDecoration(
                color: Colors.green[200],
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(color: Colors.black, blurRadius: 2.0)
                ]),
            child: Column(
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Icon(
                //       Icons.holiday_village_rounded,
                //       size: 60,
                //     ),
                //     Icon(Icons.home, size: 60)
                //   ],
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        padding: EdgeInsets.only(top: 30, bottom: 20),
                        decoration: BoxDecoration(
                            // padding: const EdgeInsets.all(10),
                            ),
                        child: Text("Wisata Nusantara",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)))
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 6),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "The “Wisata Nusantara” application is inspired by the enthusiasm of the G20 Indonesia 2022 presidency. G20 Indonesia 2022 is expected to be a means to promote the Indonesian tourism sector and the creative economy which had weakened due to the Covid-19 pandemic.",
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 6),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                            "This application will contain various destinations and events in Indonesia. In addition, this application will also provide travel guides for local and international tourists.")),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 6),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "You can see all the list of Indonesian tourist destinations that are on the website so you can set your trip more easily and neatly.",
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 6),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                            "Hi You! Come on join with us, You can join as a contributor in our project with register and help fill in data to make it easier for every application user.")),
                  ],
                ),
              ],
            )),
        // MULAI KERJAIN DARI SINI YA
      ),
    );
  }
}

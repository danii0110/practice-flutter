import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 50),
              child: CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('images/danflix_logo.png'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                'Dani',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: 90,
              height: 5,
              color: Colors.red,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Linkify(
                onOpen: (link) async {
                  if (await canLaunchUrl(Uri.parse(link.url))) {
                    await launchUrl(Uri.parse(link.url));
                  }
                },
                text: "https://github.com/danii0110",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                linkStyle: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextButton(
                onPressed: () {},
                child: Container(
                  color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '프로필 수정하기',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:permission_handler/permission_handler.dart';

class ServiceButton extends StatelessWidget {
  final IconData icon;
  final String label;

  ServiceButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (label == 'SOS alert') {
          await _sendSOSMessage();
        } else if (label == 'Helpline') {
          await _callHelpline();
        }
      },
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.pink[200],
            child: Icon(icon, color: Colors.pink[800]),
          ),
          SizedBox(height: 4),
          Text(label, style: TextStyle(color: Colors.pink[800])),
        ],
      ),
    );
  }

  // Function to send SOS message
  Future<void> _sendSOSMessage() async {
    // Check and request SMS permission
    var status = await Permission.sms.status;
    if (status.isDenied) {
      await Permission.sms.request();
    }

    // If permission granted, send the SMS
    if (await Permission.sms.isGranted) {
      final Uri _smsUri = Uri(
        scheme: 'sms',
        path: '112', // Emergency number
        queryParameters: <String, String>{
          'body': 'SOS! I need immediate assistance. Please help me!',
        },
      );
      if (await canLaunchUrl(_smsUri)) {
        await launchUrl(_smsUri);
      } else {
        print('Could not launch $_smsUri');
      }
    }
  }

  // Function to call the women's helpline
  Future<void> _callHelpline() async {
    final Uri helplineUri = Uri(scheme: 'tel', path: '1092');
    if (await canLaunchUrl(helplineUri)) {
      await launchUrl(helplineUri);
    } else {
      print('Could not launch $helplineUri');
    }
  }
}

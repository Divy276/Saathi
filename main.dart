import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafetyScreen(),
    );
  }
}

class SafetyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.pink[100],
        title: Text('Home', style: TextStyle(color: Colors.pink[900])),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            color: Colors.pink[900],
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShieldCard(),
              SizedBox(height: 20),
              ServiceButtonsRow(),
              SizedBox(height: 20),
              SafetyScoreCard(),
              SizedBox(height: 20),
              EmergencyContacts(),
            ],
          ),
        ),
      ),
    );
  }

  ServiceButtonsRow() {}
}

class ShieldCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.pink[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.shield, color: Colors.pink[800], size: 40),
              SizedBox(width: 16),
              Text(
                'Shield Off\nTap to activate services',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

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

class SafetyScoreCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.pink[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Safety Score\nBased on current location',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          Text(
            '6.6 / 10',
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class EmergencyContacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Emergency Contacts',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.pink[800])),
        SizedBox(height: 10),
        ContactCard(
            name: 'Vishal', phone: '9876543210', email: 'vks1234566@gmail.com'),
        ContactCard(
            name: 'Divyanshu',
            phone: '8595126184',
            email: 'divyanshucloud@gmail.com'),
      ],
    );
  }
}

class ContactCard extends StatelessWidget {
  final String name;
  final String phone;
  final String email;

  const ContactCard(
      {required this.name, required this.phone, required this.email});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient:
            LinearGradient(colors: [Colors.pink[100]!, Colors.pink[200]!]),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: TextStyle(color: Colors.white, fontSize: 18)),
              SizedBox(height: 4),
              Text(phone, style: TextStyle(color: Colors.white)),
              Text(email, style: TextStyle(color: Colors.white)),
            ],
          ),
          Icon(Icons.delete, color: Colors.white),
        ],
      ),
    );
  }
}

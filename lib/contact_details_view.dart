import 'package:awesome_contact_app/contact_model.dart';
import 'package:flutter/material.dart';
import './video_call_screen.dart';

class ContactDetailsView extends StatelessWidget {
  const ContactDetailsView({Key? key, required this.contact}) : super(key: key);

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text('Contact',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black)),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),
        body: ListView(
          children: [
            const CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/avatar.jpg'),
            ),
            const SizedBox(
              height: 25,
            ),
            Center(
                child: Text(contact.name,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.w600))),
            Center(
                child: Text('${contact.region}, ${contact.country}',
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.normal))),
            const SizedBox(
              height: 30,
            ),
            Container(
              color: const Color(0xff4285f4),
              child: Column(
                children: [
                  ListTile(
                      title: const Text(
                        'Mobile',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                      subtitle: Text(
                        contact.phone,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color(0xf3333333)),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
//..........Button to message
                          TextButton(
                            onPressed: () {},
                            child: const Icon(
                              Icons.message,
                              color: Colors.black,
                            ),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: const CircleBorder()),
                          ),
//.........Button to video call
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => VideoCallScreen()));
                            },
                            child: const Icon(
                              Icons.video_call,
                              color: Colors.black,
                            ),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: const CircleBorder()),
                          ),
                        ],
                      )),
                  ListTile(
                      title: const Text(
                        'Email',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                      subtitle: Text(
                        contact.email,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color(0xf3333333)),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Icon(
                              Icons.email,
                              color: Colors.black,
                            ),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: const CircleBorder()),
                          ),
                        ],
                      )),
                  const ListTile(
                    title: Text(
                      'Group',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    subtitle: Text(
                      'Uni Friends',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Color(0xff9AADBE)),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Account Linked',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
            ),
            Container(
              color: const Color(0xff4285f4),
              child: Column(
                children: [
                  ListTile(
                    title: const Text(
                      'Telegram',
                      style: TextStyle(fontSize: 18),
                    ),
                    trailing: Image.asset('assets/telegram.png'),
                  ),
                  ListTile(
                    title: const Text(
                      'WhatsApp',
                      style: TextStyle(fontSize: 18),
                    ),
                    trailing: Image.asset('assets/whatsapp.png'),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'More Options',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
            ),
            Container(
              color: const Color(0xff4285f4),
              child: Column(
                children: const [
                  ListTile(
                    title: Text(
                      'Share Contact',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'QR Code',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}

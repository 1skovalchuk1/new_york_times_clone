import 'package:flutter/material.dart';
import 'package:new_york_times_clone/widgets/items/padding_text.dart';

class UserSettings extends StatelessWidget {
  const UserSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.8,
      maxChildSize: 0.95,
      builder: (_, controller) => Container(
        color: Colors.white,
        child: Column(children: [
          Row(
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_drop_down_sharp, size: 28),
              ),
              const Text(
                'Account',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Expanded(
            child: ListView(
              controller: controller,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const PaddingText(
                  text: 'user@mail.com',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const Divider(
                    color: Color.fromARGB(255, 120, 120, 120),
                    indent: 20,
                    height: 30,
                    thickness: 0.2),
                const PaddingText(
                    text: 'Subscribe', style: TextStyle(fontSize: 16)),
                const Divider(
                    color: Color.fromARGB(255, 120, 120, 120),
                    height: 30,
                    thickness: 0.4),
                const PaddingText(
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  text: 'SAVED FOR LATER',
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: RichText(
                      text: const TextSpan(
                          style: TextStyle(color: Colors.grey),
                          children: [
                        TextSpan(text: 'Start saving stories. Tap the '),
                        WidgetSpan(
                            child: Icon(
                          color: Colors.grey,
                          Icons.bookmark_outline_outlined,
                        )),
                        TextSpan(
                            text: ' icon on a story to see it appear here.')
                      ])),
                ),
                const Divider(
                    color: Color.fromARGB(255, 120, 120, 120),
                    height: 30,
                    thickness: 0.4),
                const PaddingText(
                    text: 'Account Settings', style: TextStyle(fontSize: 16)),
                const Divider(
                    color: Color.fromARGB(255, 120, 120, 120),
                    indent: 20,
                    height: 30,
                    thickness: 0.2),
                const PaddingText(
                    text: 'Privacy Settings', style: TextStyle(fontSize: 16)),
                const Divider(
                    color: Color.fromARGB(255, 120, 120, 120),
                    indent: 20,
                    height: 30,
                    thickness: 0.2),
                const PaddingText(
                    text: 'Log Out',
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 0, bottom: 20),
                    style: TextStyle(fontSize: 16, color: Colors.red)),
                const Divider(color: Colors.black, height: 30, thickness: 0.4),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

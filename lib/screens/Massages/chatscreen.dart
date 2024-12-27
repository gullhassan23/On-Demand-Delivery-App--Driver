import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return 
       Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(16.0), // Adjust the padding as needed
          child: ChatWidget(),
        ),
      
    );
  }
}

class ChatWidget extends StatelessWidget {
  ChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(
          height: screenSize.height*0.05,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {},
            ),
            SizedBox(width: 20),
            SizedBox(
              width: 60,
              height: screenSize.height*0.06,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/alice.jpeg'),
                radius: 30,
              ),
            ),
            SizedBox(width: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Maddy Lin",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  "Online",
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.phone),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert), // Vertical three dots icon
              onPressed: () {},
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true, // Make the ListView adapt to its content
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final message = messages[index];
              return MessageWidget(message: message);
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                  child: SizedBox(
                height: screenSize.height*0.04, // Adjust the height as needed
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 0), // Removes vertical padding
                    hintText: 'Type a message...',
                    prefixIcon:
                        Icon(Icons.attach_file, color: Colors.grey),
                    suffixIcon: Icon(Icons.sentiment_satisfied,
                        color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          20.0), // Adjust the border radius as needed
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          30.0), // Adjust the border radius as needed
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              )),
              IconButton(
                icon: Icon(
                  Icons.send,
                  color: Colors.green,
                ),
                onPressed: () {
                  // Implement send message logic here
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Message {
  final String text;
  final bool isMe;

  Message(this.text, this.isMe);
}

List<Message> messages = [
  Message(
      'Hai Raizal , I,m on the way to your home, Please wait a moment.Thanks,',
      false),
  Message('ThankYou! Ill be waiting for that', true),
  Message(
      'Hai riazal, I , m on the wat to your home , please wait for a moment ',
      false),
];

class MessageWidget extends StatelessWidget {
  final Message message;

  MessageWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: message.isMe ? Colors.green : Colors.grey,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          message.text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}

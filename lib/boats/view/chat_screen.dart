import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weboapp_pocket/boats/controller/chat_controller.dart';
import 'package:weboapp_pocket/core/component/appbar_views.dart';
import 'package:weboapp_pocket/utilities/data/chat_model.dart';

class ChatScreen extends StatelessWidget {
  final ChatController chatController = Get.put(ChatController());
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          "Chat your Query",
          style: TextStyle(fontSize: 20, fontFamily: 'Quicksand_bold'),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: chatController.messages.length,
                itemBuilder: (context, index) {
                  final message = chatController.messages[index];
                  return ListTile(
                    title: Align(
                      alignment: message.isUser
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: message.isUser ? Colors.blue : Colors.grey,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(message.message),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          Container(
            color: Colors.blueGrey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        labelText: 'Enter your message',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      final userMessage = _controller.text.trim();
                      if (userMessage.isNotEmpty) {
                        chatController.addMessage(
                            ChatMessage(message: userMessage, isUser: true));
                        chatController.getBotResponse(userMessage);
                        _controller.clear();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

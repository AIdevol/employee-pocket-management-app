import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weboapp_pocket/utilities/data/chat_model.dart';

class ChatController extends GetxController {
  var messages = <ChatMessage>[].obs;

  void addMessage(ChatMessage message) {
    messages.add(message);
  }

  Future<void> getBotResponse(String userMessage) async {
    // Simulate API call to backend
    await Future.delayed(Duration(seconds: 1));

    // Example response
    final botResponse = "This is a response to: $userMessage";

    addMessage(ChatMessage(message: botResponse, isUser: false));
  }
}

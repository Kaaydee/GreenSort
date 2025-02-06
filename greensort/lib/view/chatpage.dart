import 'package:flutter/material.dart';
import 'package:greensort/widgets/ChatpageAppbar.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, String>> _messages = [];
  final String apiUrl = "http://chatwithdoc.tiendungcorp.com/normalchat";

  // Hàm gửi tin nhắn đến API và nhận phản hồi
  Future<void> _sendMessage(String message) async {
    if (message.trim().isEmpty) return;

    setState(() {
      _messages.add({"sender": "user", "message": message});
    });

    _messageController.clear();

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json; charset=utf-8"},
        body: utf8.encode(jsonEncode({"message": message})),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(utf8.decode(response.bodyBytes));
        setState(() {
          _messages.add({
            "sender": "bot",
            "message": responseData["response"] ??
                "Xin lỗi, tôi không hiểu yêu cầu của bạn."
          });
        });
      } else {
        setState(() {
          _messages.add({
            "sender": "bot",
            "message": "Đã xảy ra lỗi từ phía máy chủ. Vui lòng thử lại sau."
          });
        });
        debugPrint("Lỗi API: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      debugPrint("Lỗi khi gửi yêu cầu: $e");
      setState(() {
        _messages.add({
          "sender": "bot",
          "message":
              "Không thể kết nối với máy chủ. Vui lòng kiểm tra kết nối mạng."
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ChatPageAppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isUserMessage = message["sender"] == "user";

                return Align(
                  alignment: isUserMessage
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isUserMessage
                          ? Colors.green.withOpacity(0.8)
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      message["message"]!,
                      style: TextStyle(
                        color: isUserMessage ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: "Gửi tin nhắn...",
                      filled: true,
                      fillColor: Colors.green[200],
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 16,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.green),
                  onPressed: () {
                    _sendMessage(_messageController.text);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

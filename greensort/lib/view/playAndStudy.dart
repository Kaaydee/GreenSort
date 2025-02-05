import 'package:flutter/material.dart';
// import 'dart:math';
import 'package:greensort/widgets/playStudyAppbar.dart';

class PlayAndLearnScreen extends StatefulWidget {
  const PlayAndLearnScreen({super.key});

  @override
  State<PlayAndLearnScreen> createState() => _PlayAndLearnScreenState();
}

class _PlayAndLearnScreenState extends State<PlayAndLearnScreen> {
  int totalScore = 0;
  int currentQuestionIndex = 0;
  bool isDoublePointsActive = false; // Trạng thái x2 điểm
  List<int> hiddenAnswers = []; // Lưu các đáp án bị loại bỏ (50/50)
  bool isFiftyFiftyUsed = false; // Trạng thái đã dùng 50/50
  bool isDoublePointsUsed = false; // Trạng thái đã dùng x2 điểm

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          'Câu 1: Vi nhựa - các phần tử nhựa sẽ mất bao lâu để phân hủy ở ngoài môi trường?',
      'answers': [
        {
          'text': '10 năm',
          'isCorrect': false,
          'explanation': 'Nhựa không phân hủy nhanh như vậy.'
        },
        {
          'text': '100 năm',
          'isCorrect': false,
          'explanation':
              '100 năm là thời gian phân hủy của một số vật liệu khác, không phải nhựa.'
        },
        {
          'text': 'Hơn 1000 năm',
          'isCorrect': true,
          'explanation':
              'Chính xác! Nhựa mất hơn 1000 năm để phân hủy hoàn toàn.'
        },
        {
          'text': '50 năm',
          'isCorrect': false,
          'explanation': '50 năm là thời gian ngắn hơn thực tế cho nhựa.'
        },
      ],
    },
    {
      'question': 'Câu 2: Nước chiếm bao nhiêu phần trăm cơ thể con người?',
      'answers': [
        {'text': '50%', 'isCorrect': false, 'explanation': '50% là không đủ.'},
        {
          'text': '60%',
          'isCorrect': true,
          'explanation': 'Đúng rồi! Nước chiếm khoảng 60% trọng lượng cơ thể.'
        },
        {
          'text': '70%',
          'isCorrect': false,
          'explanation': '70% là hơi cao hơn thực tế.'
        },
        {
          'text': '80%',
          'isCorrect': false,
          'explanation': '80% là không đúng.'
        },
      ],
    },
    {
      'question': 'Câu 3: Loại khí nào gây hiệu ứng nhà kính nhiều nhất?',
      'answers': [
        {
          'text': 'Oxygen',
          'isCorrect': false,
          'explanation': 'Oxygen không gây hiệu ứng nhà kính.'
        },
        {
          'text': 'Carbon dioxide',
          'isCorrect': true,
          'explanation': 'Chính xác! Carbon dioxide là nguyên nhân chính.'
        },
        {
          'text': 'Hydrogen',
          'isCorrect': false,
          'explanation': 'Hydrogen không liên quan đến hiệu ứng nhà kính.'
        },
        {
          'text': 'Nitrogen',
          'isCorrect': false,
          'explanation':
              'Nitrogen không phải là khí gây hiệu ứng nhà kính chính.'
        },
      ],
    },
  ];

  void _handleAnswer(bool isCorrect, String explanation) {
    setState(() {
      if (isCorrect) {
        totalScore += isDoublePointsActive ? 20 : 10; // X2 điểm nếu kích hoạt
      } else {
        if (totalScore <= 0) {
          totalScore = 0;
        } else {
          totalScore -= 5;
        }
      }
      isDoublePointsActive = false; // Tắt chế độ X2 điểm sau khi trả lời
    });

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isCorrect ? 'Đúng!' : 'Sai!'),
        content: Text(explanation),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _moveToNextQuestion();
            },
            child: const Text('Tiếp tục'),
          ),
        ],
      ),
    );
  }

  void _moveToNextQuestion() {
    setState(() {
      hiddenAnswers.clear(); // Reset đáp án bị loại bỏ cho câu hỏi mới
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        _showEndGameDialog();
      }
    });
  }

  void _showEndGameDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hoàn thành!'),
        content: Text(
            'Bạn đã hoàn thành tất cả các câu hỏi!\nTổng điểm: $totalScore'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('Quay lại'),
          ),
        ],
      ),
    );
  }

  // Kích hoạt tính năng 50/50
  void _useFiftyFifty() {
    final currentAnswers = questions[currentQuestionIndex]['answers']
        as List<Map<String, dynamic>>;
    final wrongAnswers = currentAnswers
        .asMap()
        .entries
        .where((entry) => !entry.value['isCorrect']) // Chỉ lấy đáp án sai
        .map((entry) => entry.key)
        .toList();

    if (wrongAnswers.length > 2) {
      wrongAnswers.shuffle(); // Xáo trộn đáp án sai
    }

    setState(() {
      hiddenAnswers = wrongAnswers.take(2).toList(); // Loại bỏ 2 đáp án sai
      isFiftyFiftyUsed = true; // Đánh dấu đã dùng 50/50
    });
  }

  // Kích hoạt x2 điểm
  void _activateDoublePoints() {
    setState(() {
      isDoublePointsActive = true;
      isDoublePointsUsed = true; // Đánh dấu đã dùng x2 điểm
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    final currentAnswers =
        currentQuestion['answers'] as List<Map<String, dynamic>>;

    return Scaffold(
      appBar: const PlayStudyAppBar(),
      // appBar: AppBar(
      //   backgroundColor: const Color(0xFF00BD15),
      //   title: const Text(
      //     'CHƠI VÀ HỌC',
      //     style: TextStyle(
      //       fontFamily: 'Poppins',
      //       fontWeight: FontWeight.bold,
      //       color: Colors.white,
      //     ),
      //   ),
      // ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          // Tổng điểm và câu hỏi
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            color: const Color(0xFFEAFBE3),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.emoji_events, // Biểu tượng cúp
                      color: Colors.amber, // Màu vàng giống hình
                      size: 30, // Kích thước biểu tượng
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Tổng điểm: $totalScore',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  currentQuestion['question'],
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),

            // Hiển thị các đáp án
          ),
          const Padding(padding: EdgeInsets.all(10)),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(10.0),
            color: const Color(0xFFEAFBE3),
            child: SizedBox(
              // Thay thế Expanded bằng SizedBox
              height: 300, // Chiều cao tùy chỉnh để hiển thị background
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: currentAnswers
                    .asMap()
                    .entries
                    .where((entry) => !hiddenAnswers.contains(entry.key))
                    .map((entry) {
                  int index = entry.key;
                  Map<String, dynamic> answer = entry.value;

                  Color color;
                  switch (index) {
                    case 0:
                      color = Colors.green;
                      break;
                    case 1:
                      color = Colors.blue;
                      break;
                    case 2:
                      color = Colors.red;
                      break;
                    case 3:
                      color = Colors.orange;
                      break;
                    default:
                      color = Colors.grey;
                  }

                  return _buildAnswerOption(
                    answer['text'],
                    color,
                    answer['isCorrect'],
                    answer['explanation'],
                  );
                }).toList(),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Trợ giúp 50/50
                Column(
                  children: [
                    GestureDetector(
                      onTap: isFiftyFiftyUsed ? null : _useFiftyFifty,
                      child: CircleAvatar(
                        radius: 30.0, // Giảm bán kính để icon nhỏ hơn
                        backgroundColor: isFiftyFiftyUsed
                            ? Colors.grey.shade300
                            : Colors.blue.withOpacity(0.2),
                        child: Image.asset(
                          'assets/fityfity.png', // Icon 50/50
                          width: 40, // Kích thước hình ảnh nhỏ hơn
                          height: 40,
                          color: isFiftyFiftyUsed ? Colors.grey : Colors.blue,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    const Text(
                      '50/50',
                      style: TextStyle(
                          fontSize: 12.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                // Trợ giúp Gợi ý

                // Trợ giúp X2 điểm
                Column(
                  children: [
                    GestureDetector(
                      onTap: isDoublePointsUsed ? null : _activateDoublePoints,
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundColor: isDoublePointsUsed
                            ? Colors.grey.shade300
                            : Colors.red.withOpacity(0.2),
                        child: Image.asset(
                          'assets/x2.png', // Icon X2 điểm
                          width: 24,
                          height: 24,
                          color: isDoublePointsUsed ? Colors.grey : Colors.red,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    const Text(
                      'X2 điểm',
                      style: TextStyle(
                          fontSize: 12.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAnswerOption(
      String text, Color color, bool isCorrect, String explanation) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () => _handleAnswer(isCorrect, explanation),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: color, width: 2.0),
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: color,
              radius: 12.0,
            ),
            title: Text(
              text,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

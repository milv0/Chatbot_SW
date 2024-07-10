// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// enum Emotion {
//   joy,
//   hope,
//   anger,
//   anxiety,
//   neutrality,
//   sadness,
//   tiredness,
//   regret,
// }

// Emotion _selectedEmotion = Emotion.joy;

// class AddDiaries extends StatefulWidget {
//   final String selectedDate;
//   final String memberId;
//   const AddDiaries(
//       {super.key, required this.selectedDate, required this.memberId});

//   @override
//   State<AddDiaries> createState() => _AddDiariesState();
// }

// class _AddDiariesState extends State<AddDiaries> {
//   late String _content = '';
//   late String _writeDate;
//   final TextEditingController _textEditingController = TextEditingController();
//   String _emotionType = '';
//   late String _selectedImage = 'lib/assets/images/giryong.png';

//   SharedPreferences? prefs;
//   List<String> writedays = [];

//   Future<void> _initPrefs() async {
//     prefs = await SharedPreferences.getInstance();
//     final writedaysList = prefs!.getStringList(widget.memberId);

//     if (writedaysList != null) {
//       writedays = writedaysList;
//     }

//     if (mounted) {
//       setState(() {});
//     }
//   }

//   void _updateWritedays(String date) async {
//     writedays.add(date);
//     await prefs!.setStringList(
//         widget.memberId, writedays); // writedays 리스트를 SharedPreferences에 저장합니다.
//     setState(() {});
//   }

//   @override
//   void initState() {
//     super.initState();
//     _initPrefs();
//     _writeDate = widget.selectedDate;
//   }

//   // Future<Map<String, dynamic>> analyzeSentiment(String text) async {
//   //   final url = Uri.parse('http://3.35.183.52:8081/analyze');
//   //   final payload = jsonEncode({'text': text});
//   //   final response = await http.post(
//   //     url,
//   //     headers: {'Content-Type': 'application/json'},
//   //     body: payload,
//   //   );

//   //   if (response.statusCode == 200) {
//   //     Map<String, dynamic> result = jsonDecode(response.body);
//   //     print(result);
//   //     print("감정 전송 완료");
//   //     return result;
//   //   } else {
//   //     throw Exception('감정 분석 오류!!');
//   //   }
//   // }

//   Future<String?> _showImagePicker(BuildContext context) async {
//     return showModalBottomSheet<String>(
//       context: context,
//       builder: (BuildContext context) {
//         return SizedBox(
//           height: 500,
//           width: 400,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     _selectedImage = 'lib/assets/images/joy.png';
//                     _emotionType = Emotion.joy.toString().split('.').last;
//                     _writeDate = widget.selectedDate;
//                   });
//                   Navigator.pop(context, _emotionType);
//                 },
//                 child: const Text('기쁨'),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     _selectedImage = 'lib/assets/images/hope.png';
//                     _emotionType = Emotion.hope.toString().split('.').last;
//                     _writeDate = widget.selectedDate;
//                   });
//                   Navigator.pop(context, _emotionType);
//                 },
//                 child: const Text('희망'),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     _selectedImage = 'lib/assets/images/anger.png';
//                     _emotionType = Emotion.anger.toString().split('.').last;
//                     _writeDate = widget.selectedDate;
//                   });
//                   Navigator.pop(context, _emotionType);
//                 },
//                 child: const Text('분노'),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     _selectedImage = 'lib/assets/images/anxiety.png';
//                     _emotionType = Emotion.anxiety.toString().split('.').last;
//                     _writeDate = widget.selectedDate;
//                   });
//                   Navigator.pop(context, _emotionType);
//                 },
//                 child: const Text('불안'),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     _selectedImage = 'lib/assets/images/neutrality.png';
//                     _emotionType =
//                         Emotion.neutrality.toString().split('.').last;
//                     _writeDate = widget.selectedDate;
//                   });
//                   Navigator.pop(context, _emotionType);
//                 },
//                 child: const Text('중립'),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     _selectedImage = 'lib/assets/images/sadness.png';
//                     _emotionType = Emotion.sadness.toString().split('.').last;
//                     _writeDate = widget.selectedDate;
//                   });
//                   Navigator.pop(context, _emotionType);
//                 },
//                 child: const Text('슬픔'),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     _selectedImage = 'lib/assets/images/tiredness.png';
//                     _emotionType = Emotion.tiredness.toString().split('.').last;
//                     _writeDate = widget.selectedDate;
//                   });
//                   Navigator.pop(context, _emotionType);
//                 },
//                 child: const Text('피곤'),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     _selectedImage = 'lib/assets/images/regret.png';
//                     _emotionType = Emotion.regret.toString().split('.').last;
//                     _writeDate = widget.selectedDate;
//                   });
//                   Navigator.pop(context, _emotionType);
//                 },
//                 child: const Text('후회'),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF4CADE4),
//         centerTitle: true,
//         title: Text(
//           (_writeDate),
//           style: const TextStyle(
//             color: Colors.black,
//             fontSize: 30,
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () async {
//               if (_emotionType.isEmpty) {
//                 showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return AlertDialog(
//                       backgroundColor: const Color(0xFFFFE3EE),
//                       content: const Text(
//                         '감정을 선택해주세요!',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 25,
//                         ),
//                       ),
//                       actions: [
//                         TextButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           child: const Text(
//                             '확인',
//                             style: TextStyle(
//                               color: Colors.blue,
//                               fontSize: 20,
//                             ),
//                           ),
//                         ),
//                       ],
//                     );
//                   },
//                 );
//                 return;
//               }
//               if (_content.isEmpty) {
//                 showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return AlertDialog(
//                       backgroundColor: const Color(0xFFFFE3EE),
//                       content: const Text(
//                         '내용을 입력해주세요!',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 20,
//                         ),
//                       ),
//                       actions: [
//                         TextButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           child: const Text(
//                             '확인',
//                             style: TextStyle(
//                               color: Color.fromARGB(255, 61, 149, 250),
//                               fontSize: 20,
//                             ),
//                           ),
//                         ),
//                       ],
//                     );
//                   },
//                 );
//                 return;
//               }

//               //백엔드 요청
//               Diaries newPage = Diaries(
//                 diaryId: 0,
//                 memberId: widget.memberId,
//                 writeDate: _writeDate,
//                 content: _content,
//                 emotionType: _emotionType,
//               );
//               await saveDiary(newPage);
//               _updateWritedays(_writeDate);
//               Navigator.pop(context, _emotionType);
//             },
//             icon: Image.asset(
//               'lib/assets/images/month.png',
//               width: 35,
//               height: 35,
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.all(30),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               GestureDetector(
//                 onTap: () async {
//                   final String? selectedEmotion =
//                       await _showImagePicker(context);
//                   setState(() {
//                     _emotionType = selectedEmotion ?? '';
//                   });
//                   print(_emotionType);
//                 },
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       width: 200,
//                       padding: const EdgeInsets.all(8),
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                         color: const Color(0xFF98DFFF),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: const Text(
//                         '저를 클릭해서 당신의 \n기분을 선택하세요!',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 22,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 8),
//                     Image.asset(
//                       _selectedImage,
//                       height: 80,
//                       width: 70,
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 16),
//               TextField(
//                 controller: _textEditingController,
//                 maxLines: 19,
//                 onChanged: (value) {
//                   setState(() {
//                     _content = value;
//                   });
//                 },
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: const Color(0xFFFFE3EE), // 배경색 지정
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 30),
//               Container(
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: const Color(0xFFFFE3EE),
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: TextButton(
//                   onPressed: () async {
//                     // 여기!! 여기에 data 전송 api 넣기
//                     // _content 가 넘어와야 함
//                     Map<String, dynamic> sentiment =
//                         await analyzeSentiment(_content);
//                     Navigator.push(
//                       // ignore: use_build_context_synchronously
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Statics(sentiment: sentiment)),
//                     );
//                   },
//                   child: const Text(
//                     '오늘의 기분 상태 보기',
//                     style: TextStyle(
//                       color: Color(0xFFFB7474),
//                       fontSize: 25,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class AddDiary extends StatefulWidget {
  const AddDiary({super.key});

  @override
  State<AddDiary> createState() => _AddDiaryState();
}

class _AddDiaryState extends State<AddDiary> {
  final TextEditingController _textEditingController = TextEditingController();
  String _content = ' ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
        title: const Text('Add / writeday'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.red,
              height: 100,
              width: 100,
              child: const Text('Emotion'),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: _textEditingController,
              maxLines: 19,
              onChanged: (value) {
                setState(() {
                  _content = value;
                });
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFFFFE3EE), // 배경색 지정
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
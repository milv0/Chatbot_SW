import 'package:flutter/material.dart';

class Statistics extends StatelessWidget {
  const Statistics({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Scaffold(
        body: Column(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Text('이 달의 마음들'),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  width: 200,
                  color: Colors.red,
                  child: Text('PieChart'),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Text('많이 느낀 감정'),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.red,
                      child: Text('Emo1'),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.blue,
                      child: Text('Emo2'),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.green,
                      child: Text('Emo3'),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Text('ooo님은 ㅁㅁ을 하면\n기분이 나아져요!!'),
                ),
                Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.cyan,
                      child: Text('Action'),
                    ),
                    Text('행동추천'),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

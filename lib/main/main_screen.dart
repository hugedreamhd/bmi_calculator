import 'dart:convert';

import 'package:first_flutter/result/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

final heightController = TextEditingController();
final weightController = TextEditingController();

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    load();
  }

  @override
  void dispose() {
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }

  Future save() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('height', double.parse(heightController.text));
    await prefs.setDouble('weight', double.parse(weightController.text));
  }

  Future load() async {
    //화면이 시작되는 시점
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final double? height = prefs.getDouble('height'); //값이 없을 수 있는경우
    final double? weight = prefs.getDouble('weight'); // 저장하기 전에 로드할 때

    if (height != null && weight != null) {
      heightController.text = '$height';
      weightController.text = '$weight';
      print('키 : $height, 몸무게 : $weight');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('비만도 계산기'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextFormField(
                controller: heightController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '키',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return '키를 입력하세요';
                  }
                  return null;
                },
              ), //잘못된 입력 처리
              const SizedBox(height: 8),
              TextFormField(
                controller: weightController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '몸무게',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return '몸무게를 입력하세요';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() == false) {
                    return;
                  }

                  //final height = heightController.text;

                  save();

                  context.push('/result');//버튼을 누르면 push 된 페이지로 간다

                  /*Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultScreen(
                        height: double.parse(heightController.text),
                        weight: double.parse(weightController.text),
                      ),
                    ),
                  );*/
                },
                child: const Text('결과'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

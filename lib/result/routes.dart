import 'package:first_flutter/main/main_screen.dart';
import 'package:first_flutter/result/result_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const MainScreen();//첫 페이지가 메인 페이지로 가게
      },
    ),
    GoRoute(
      path: '/result',
      builder: (context, state) {
        return  ResultScreen(//값을 가지고 결과페이지로 간다
          height: double.parse(heightController.text),
          weight: double.parse(weightController.text),
        );
      },
    ),
  ],
);

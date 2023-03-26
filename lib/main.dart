import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_search/firebase_options.dart';
import 'package:word_search/provider/word_provider.dart';
import 'package:word_search/screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ChangeNotifierProvider(
      create: (_) => WordProvider(),
      child: MaterialApp(
        home: HomeScreen(),
      ),
    ),
  );
}

/*
parsing해서 cache에 저장
cache 저장 하듯이 그대로 단어리스트에 저장하기

cache로 불러오면 api 내용 달라지면 대응이 어려움
*/
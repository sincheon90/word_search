import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:word_search/component/search_bar.dart';
import 'package:word_search/const/colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<dynamic> _data = [];
  final TextStyle meaningStyle =
      TextStyle(fontSize: 16.0, color: DARK_GREY_COLOR);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: SearchBar(search: _search),
        ),
        body: _displayWordMeanings(_data),
      ),
    );
  }

  Widget _displayWordMeanings(datas) {
    return ListView.builder(
      itemCount: datas.length,
      itemBuilder: (BuildContext context, int index) {
        final wordData = datas[index];
        final meanings = wordData['meanings'];

        return ListTile(
          title: Text.rich(
            TextSpan(
              text: wordData['word'],
              style: TextStyle(fontSize: 20.0), // 기본 폰트 크기
              children: [
                TextSpan(
                  text: (index + 1).toString(),
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ), // 작은 숫자 스타일
                ),
              ],
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final meaning in meanings)
                Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        meaning['partOfSpeech'],
                        style: meaningStyle.copyWith(color: PRIMARY_COLOR),
                      ),
                      for (final def in meaning['definitions'])
                        Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '' + def['definition'],
                                style: meaningStyle,
                              ),
                              if (def['example'] != null)
                                Text(
                                  'ex) ' + def['example'],
                                  style: meaningStyle.copyWith(color: LIGHT_GREY_COLOR),
                                ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _search(String term) async {
    try {
      final response = await Dio().get(
          'https://api.dictionaryapi.dev/api/v2/entries/en_US/$term',
          options: Options(responseType: ResponseType.json));
      setState(() {
        _data = response.data;
      });
    } catch (e) {
      print('Error: $e');
    }
  }
}

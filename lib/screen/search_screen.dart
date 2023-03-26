import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_search/component/search_bar.dart';
import 'package:word_search/const/colors.dart';
import 'package:word_search/models/word_model.dart';
import 'package:word_search/provider/word_provider.dart';

class SearchScreen extends StatelessWidget {
  final meaningStyle = TextStyle(fontSize: 16.0, color: DARK_GREY_COLOR);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<WordProvider>();
    final searchWord = provider.searchWord;
    final cachedWordMeanings = provider.cache[searchWord] ?? [];

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: SearchBar(search: (term) => provider.search(term: term)),
        ),
        body: _displayWordMeanings(cachedWordMeanings),
      ),
    );
  }

  Widget _displayWordMeanings(List<WordModel> wordMeanings) {
    return ListView.builder(
      itemCount: wordMeanings.length,
      itemBuilder: (BuildContext context, int index) {
        final wordMeaning = wordMeanings[index];
        final meanings = wordMeaning.meanings;

        return ListTile(
          onTap: () {
            print(meanings.toString());
          },
          title: Text.rich(
            TextSpan(
              text: wordMeaning.word,
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
                        meaning.partOfSpeech,
                        style: meaningStyle.copyWith(color: PRIMARY_COLOR),
                      ),
                      for (final def in meaning.definitions)
                        Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                def.definition,
                                style: meaningStyle,
                              ),
                              if (def.example != null)
                                Text(
                                  'ex) ${def.example}',
                                  style: meaningStyle.copyWith(
                                      color: LIGHT_GREY_COLOR),
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
}

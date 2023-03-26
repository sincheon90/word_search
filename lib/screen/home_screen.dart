import 'package:flutter/material.dart';
import 'package:word_search/const/colors.dart';
import 'package:word_search/screen/search_screen.dart';
import 'package:word_search/screen/word_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: [
          SearchScreen(),
          WordListScreen(),
        ],
      ),
      bottomNavigationBar: TabBar(
        controller: _tabController,
        tabs: [
          Tab(icon: Icon(Icons.search), text: 'search',),
          Tab(icon: Icon(Icons.list_alt_rounded), text: 'list',),
        ],
        labelColor: PRIMARY_COLOR,
        unselectedLabelColor: DARK_GREY_COLOR,
      ),
    );
  }
}

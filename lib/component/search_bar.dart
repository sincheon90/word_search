import 'package:flutter/material.dart';
import 'package:word_search/const/colors.dart';

class SearchBar extends StatefulWidget {
  final Function(String) search;

  SearchBar({
    required this.search,
    Key? key,
  }) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        controller: _searchController,
        onChanged: (value) => widget.search(value),
        style: const TextStyle(fontSize: 20.0),
        cursorColor: DARK_GREY_COLOR,
        maxLines: 1,
        decoration: InputDecoration(
          hintText: 'Search...',
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: PRIMARY_COLOR),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: PRIMARY_COLOR),
          ),
          fillColor: TEXT_FIELD_FILL_COLOR,
          filled: true,
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear, color: Colors.grey),
            onPressed: () {
              _searchController.clear();
            },
          ),
        ),
      ),
    );
  }
}

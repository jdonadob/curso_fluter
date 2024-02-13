import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inputs/models/country.dart';
import 'package:inputs/contants/countries.dart';

class TextFieldPage extends StatefulWidget {
  const TextFieldPage({super.key});

  @override
  State<TextFieldPage> createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  late final List<Country> _countries;
  String _query = '';

  @override
  void initState() {
    super.initState();

    _countries = countries
        .map(
          (e) => Country.fromJson(e),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    late final List<Country> filteredList;

    if (_query.isEmpty) {
      filteredList = _countries;
    } else {
      filteredList = _countries
          .where(
            (e) => e.name.toLowerCase().contains(
                  _query.toLowerCase(),
                ),
          )
          .toList();
    }

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: TextField(onChanged: (text) {
            _query = text;

            setState(() {});
          })),
      body: ListView.builder(
        itemBuilder: (_, index) {
          final country = filteredList[index];

          return ListTile(
            title: Text(
              country.name,
            ),
            onTap: () {},
          );
        },
        itemCount: filteredList.length,
      ),
    );
  }
}

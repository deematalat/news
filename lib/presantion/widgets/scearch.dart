import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/newscubit/cubit_cubit.dart';
import 'package:news/presantion/widgets/build_artical_item.dart';

class SearchScreen extends StatelessWidget {
  var searchController = new TextEditingController();
  String? validateName(String? value) {
    if (value!.isEmpty) return 'Search must not be empty !';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var list = NewsCubit.get(context).search;

    return BlocConsumer(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        return Scaffold(
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  onChanged: (value) {
                    NewsCubit.get(context).getSearch(value);
                  },
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  validator: validateName,
                  decoration: InputDecoration(
                    labelText: 'Search',
                    icon: Icon(Icons.search),
                  ),
                ),
              ),
              Expanded(
                child: buildArticalItem(list, context),
              )
            ],
          ),
        );
      },
    );
  }
}

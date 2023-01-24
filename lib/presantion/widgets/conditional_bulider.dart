import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'build_artical_item.dart';

Widget conditionalBuilder(list) {
  return ConditionalBuilder(
    builder: (context) => ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildArticalItem(list[index], context),
        separatorBuilder: (context, index) => myDivider(),
        itemCount: 10),
    fallback: (context) => Center(
      child: CircularProgressIndicator(),
    ),
    condition: list.length > 0,
  );
}

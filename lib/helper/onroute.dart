
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/helper/constant.dart';
import 'package:news/presantion/widgets/scearch.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {

    switch (settings.name) {
      case   searchScreen :
        return   MaterialPageRoute(
            builder:(BuildContext context )=>
                SearchScreen()
        );

    }
  }
}

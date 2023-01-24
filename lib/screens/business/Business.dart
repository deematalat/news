import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/newscubit/cubit_cubit.dart';
import '../../presantion/widgets/conditional_bulider.dart';

class Business_Screen extends StatelessWidget {
  const Business_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,Newsstate>(
      listener:(context, state) {} ,
      builder:(context, state) {
      var list = NewsCubit.get(context).business;
        return  conditionalBuilder(list) ;
      }

    );



  }
}




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: unused_import
import '../../networks/remote/dio_helper.dart';
import '../../newscubit/cubit_cubit.dart';


class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer< NewsCubit,Newsstate>(
        builder: (BuildContext context, state  ) {
          var  cubit = NewsCubit.get(context);
          return Scaffold(
              appBar: AppBar(
                title: Text("News App"),
                titleSpacing: 20.0,
                actions: [
                /*  IconButton(onPressed: (){
          Navigator.push(
            context,
              MaterialPageRoute(builder: (BuildContext context )=>SearchScreen() )
          );
                  }, icon:Icon(Icons.search,
                  size: 30.0,
                  )),*/
                  IconButton(onPressed: (){
                    NewsCubit.get(context).themeMode(
                        fromShared: null,

                    );
                  }, icon:Icon(Icons.brightness_4_outlined,
                    size: 30.0,
                  ))
                ],
              ),
             /* floatingActionButton: FloatingActionButton(onPressed: () {
              },
                child:Icon(Icons.add) ,

              )*/
              body: cubit.screens[cubit.currentIndex],
              bottomNavigationBar:  BottomNavigationBar(
                items:cubit.bottomItem,
                currentIndex: cubit.currentIndex,
                onTap: (index){
                           cubit.changeBottomNavBar(index);
                },
              )
          );
    },
        listener: (BuildContext context, Object? state) {  },
    );
  }


}

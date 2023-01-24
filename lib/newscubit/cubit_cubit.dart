
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news/networks/local/shared_preferences.dart';
import '../networks/remote/dio_helper.dart';
import '../screens/Science/Scinece_Screen.dart';
import '../screens/business/Business.dart';
import '../screens/sports/Sport_Screen.dart';


part 'cubit_state.dart';

class NewsCubit extends Cubit<Newsstate> {
  NewsCubit() : super(Initial());
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screens=[
    Business_Screen(),
    Sports_Screen(),
    Scinece_Screen(),
  ];

  List<BottomNavigationBarItem> bottomItem = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Businees'
    ),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Scinecs'),

  ];
  void changeBottomNavBar(int index){
     currentIndex=index;
     if(currentIndex==0){
       getBusiness();
     }else{
       emit(NewsGetSportsLoading());
     }
     if(currentIndex==1){
       getSports();
     }else{
       emit(NewsGetSportsLoading());
     }
     if(currentIndex==2){
       getSciences();
     }else{
       emit(NewsGetSciencesLoading());
     }
     emit(NewsBottomNafState() );
  }
  List<dynamic> business=[];
  void getBusiness(){
    emit(NewsGetBusinessLoading());
    DioHelper.getData(url:'v2/top-headlines',
        query:{
          'country':'eg',
          'category':'business',
          'apiKey':'3d3c16a685464571a4a0bebac90fe793',
        }
    ).then((value){
      business=value.data['articles'];
        print( business[0]['title']);
      emit(NewsGetBusinessSuccess());
    }).catchError(
            (error){
          print(error.toString());
          emit(NewsGetBusinessError(error.toString()));
        });
  }



  List<dynamic>  sports=[];
  void getSports(){
    emit(NewsGetSportsLoading());
    DioHelper.getData(url:'v2/top-headlines',
        query:{
          'country':'eg',
          'category':'sports',
          'apiKey':'3d3c16a685464571a4a0bebac90fe793',
        }
    ).then((value){
       sports=value.data['articles'];
      print(sports[0]['title']);
      emit(NewsGetSportsSuccess());
    }).catchError(
            (error){
          print(error.toString());
          emit(NewsGetSportsError(error.toString()));
        });
  }

  List<dynamic>  sciences=[];
  void getSciences(){
    emit( NewsGetSciencesLoading());
    DioHelper.getData(url:'v2/top-headlines',
        query:{
          'country':'eg',
          'category':'science',
          'apiKey':'3d3c16a685464571a4a0bebac90fe793',
        }
    ).then((value){
      sciences =value.data['articles'];
      print(  sciences[0]['title']);
      emit(NewsGetSciencesSuccess() );
    }).catchError(
            (error){
          print(error.toString());
          emit( NewsGetSciencesError(error.toString()));
        });
  }

  bool isDark= false;
  void themeMode({required bool ? fromShared}){
    if(fromShared!=null) isDark=fromShared;
    else isDark= !isDark;
    Db_helper.putData(key:'isDark', value:isDark).then((value) =>  emit(AppChangeThemeState()));
    print(isDark);
  }



  List<dynamic>  search=[];
  void getSearch(String value){
    emit( NewsGetSearchLoading());
    search=[];
    DioHelper.getData(url:'v2/everything',
        query:{
          'q':'$value',
          'apiKey':'3d3c16a685464571a4a0bebac90fe793',
        }
    ).then((value){
      search =value.data['articles'];
      print(  search[0]['title']);
      emit(NewsGetSearchSuccess() );
    }).catchError(
            (error){
          print(error.toString());
          emit( NewsGetSearchError(error.toString()));
        });
  }

}


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/networks/local/shared_preferences.dart';
import 'package:news/networks/remote/dio_helper.dart';
import 'package:news/newscubit/cubit_cubit.dart';
import 'helper/onroute.dart';
import 'networks/styles/bloc_observer.dart';
import 'screens/mainscreen/news_layout.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
 await Db_helper.init();
 bool? isDark= Db_helper.getData(key:'isDark');
  BlocOverrides.runZoned(
        () => runApp( MyApp(isDark:isDark,appRouter:AppRouter() )),
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  final  AppRouter appRouter;
  const MyApp({super.key, required this.isDark,required this.appRouter,}  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
        create:(BuildContext context)=> NewsCubit(),),
       BlocProvider(
    create:(BuildContext context )=>NewsCubit()..themeMode(
    fromShared:isDark,

    ) ,
    )
      ],
      child: BlocConsumer<NewsCubit,Newsstate>(
        listener: (context, state) =>{
        },
        builder: (context, state) => MaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(
                  color: Colors.black
              ),
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor:Colors.white ,
                statusBarIconBrightness:Brightness.dark ,
              ),
              backgroundColor: Colors.white,
              elevation:20.0,
              titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0

              ),

            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(

              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.deepOrange,
              elevation: 20.0,


            ),
            textTheme: TextTheme(
              bodyText1:
              TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
              ),
            ),
            primarySwatch: Colors.deepOrange,

          ),
          darkTheme: ThemeData(
            scaffoldBackgroundColor: Colors.blueGrey[800],
            appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(
                  color: Colors.white
              ),
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor:Colors.blueGrey[800] ,
                statusBarIconBrightness:Brightness.light ,
              ),
              backgroundColor:Colors.blueGrey[800],
              elevation: 20.0,
              titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0

              ),

            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor:Colors.blueGrey[800],
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor:Colors.grey ,
                elevation: 20.0
            ),
            primarySwatch: Colors.deepOrange,
            textTheme: TextTheme(
              bodyText1:
              TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            ),
          ),
          themeMode: NewsCubit.get(context).isDark? ThemeMode.dark:ThemeMode.light,
          debugShowCheckedModeBanner: false,
          onGenerateRoute:appRouter.generateRoute,
          home:   NewsLayout(),
        ),
      )
      
    );
  }
}


 import 'package:get/get.dart';

const baseUrl='https://newsapi.org/';
 const  searchScreen = '/scearch.dart';

void goToNextPage(
    ){
   Future.delayed(Duration(seconds:3),
           ()=> Get.to(()=>{},transition: Transition.fadeIn)
   );
 }


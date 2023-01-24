part of 'cubit_cubit.dart';

@immutable
abstract class  Newsstate {}
class  Initial extends   Newsstate {}
class NewsBottomNafState extends  Newsstate{}
class NewsGetBusinessSuccess extends Newsstate{}
class NewsGetBusinessError extends Newsstate{
  late final String error;
  NewsGetBusinessError(this.error);

}
class NewsGetBusinessLoading extends Newsstate{}



class NewsGetSciencesSuccess extends Newsstate{}
class NewsGetSciencesError extends Newsstate{
  late final String error;
  NewsGetSciencesError(this.error);

}
class NewsGetSciencesLoading extends Newsstate{}


class NewsGetSportsSuccess extends Newsstate{}
class NewsGetSportsError extends Newsstate{
  late final String error;
  NewsGetSportsError(this.error);

}
class NewsGetSportsLoading extends Newsstate{}
class AppChangeThemeState extends Newsstate{

}



class NewsGetSearchSuccess extends Newsstate{}
class NewsGetSearchError extends Newsstate{
  late final String error;
  NewsGetSearchError(this.error);

}
class NewsGetSearchLoading extends Newsstate{}

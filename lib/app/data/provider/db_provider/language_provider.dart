import 'package:get_storage/get_storage.dart';

class Language{
  final box = GetStorage();


  setPreferedLanguage(String language){
    box.write('language', language);
  }

  getPreferedLanguage(){
   return box.read('language');
  }

}
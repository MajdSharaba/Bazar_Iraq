
import 'package:get_storage/get_storage.dart';

class AccessTokenStorage{
  final box = GetStorage();

  saveAccessToken(String accessToken){
    box.write("accessToken", accessToken);
  }

  getAccessToken(){
  return box.read("accessToken");
  }

}
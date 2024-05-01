

import '../../core/class/crud.dart';
import '../../linkapi.dart';

class MyFavoriteData {
  Crud crud;
  MyFavoriteData(this.crud);
  getData(dynamic userid) async {
    var response = await crud.postData(AppLink.favoriteView, {"id": userid.toString()},{});
    return response.fold((l) => l, (r) => r);
  }

  deleteData(dynamic userid) async {
    var response = await crud.postData(AppLink.deletefromfavroite, {"id": userid.toString()},{});
    return response.fold((l) => l, (r) => r);
  }
}

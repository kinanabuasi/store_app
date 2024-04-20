

import '../../core/class/crud.dart';
import '../../linkapi.dart';

class MyFavoriteData {
  Crud crud;
  MyFavoriteData(this.crud);
  getData(dynamic id) async {
    var response = await crud.postData(AppLink.favoriteView, {"id": id.toString()},{});
    return response.fold((l) => l, (r) => r);
  }

  deleteData(dynamic id) async {
    var response = await crud.postData(AppLink.deletefromfavroite, {"id": id.toString()},{});
    return response.fold((l) => l, (r) => r);
  }
}

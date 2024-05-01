import '../../core/class/crud.dart';
import '../../linkapi.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);
  addFavorite(int usersid, dynamic itemsid) async {
    var response = await crud.postData(
        AppLink.favoriteAdd, {"userid": usersid.toString(), "itemid": itemsid.toString()},{});
    return response.fold((l) => l, (r) => r);
  }

  removeFavorite(int usersid, dynamic itemsid) async {
    var response = await crud.postData(
        AppLink.favoriteRemove, {"userid": usersid.toString(), "itemid": itemsid.toString()},{});
    return response.fold((l) => l, (r) => r);
  }
}

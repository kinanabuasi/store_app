import '../../core/class/crud.dart';
import '../../linkapi.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);
  getData(dynamic id, dynamic userid) async {
    var response = await crud.postData(
        AppLink.items, {"id": id.toString(), "usersid": userid.toString()}, {});
    return response.fold((l) => l, (r) => r);
  }
}

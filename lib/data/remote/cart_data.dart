

import '../../core/class/crud.dart';
import '../../linkapi.dart';

class CartData {
  Crud crud;
  CartData(this.crud);
  addCart(int userid, String itemid) async {
    var response = await crud
        .postData(AppLink.cartadd, {"userid": userid.toString(), "itemid": itemid.toString()},{});
    return response.fold((l) => l, (r) => r);
  }

  deleteCart(int userid, String itemid) async {
    var response = await crud
        .postData(AppLink.cartdelete, {"userid": userid.toString(), "itemid": itemid.toString()},{});
    return response.fold((l) => l, (r) => r);
  }

  getCountCart(int userid, int itemid) async {
    var response = await crud.postData(
        AppLink.cartgetcountitems, {"userid": userid.toString(), "itemid": itemid.toString()},{});
    return response.fold((l) => l, (r) => r);
  }

  viewCart(int userid) async {
    var response = await crud.postData(AppLink.cartview, {
      "userid": userid.toString(),
    },{});
    return response.fold((l) => l, (r) => r);
  }

  // checkCoupon(String couponname) async {
  //   var response =
  //       await crud.postData(AppLink.checkcoupon, {"couponname": couponname},{});
  //   return response.fold((l) => l, (r) => r);
  // }
}

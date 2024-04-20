

import '../../core/class/crud.dart';
import '../../linkapi.dart';

class CartData {
  Crud crud;
  CartData(this.crud);
  addCart(String userid, String itemid) async {
    var response = await crud
        .postData(AppLink.cartadd, {"userid": userid, "itemid": itemid.toString()},{});
    return response.fold((l) => l, (r) => r);
  }

  deleteCart(String userid, String itemid) async {
    var response = await crud
        .postData(AppLink.cartdelete, {"userid": userid, "itemid": itemid.toString()},{});
    return response.fold((l) => l, (r) => r);
  }

  getCountCart(String userid, String itemid) async {
    var response = await crud.postData(
        AppLink.cartgetcountitems, {"userid": userid, "itemid": itemid.toString()},{});
    return response.fold((l) => l, (r) => r);
  }

  viewCart(String userid) async {
    var response = await crud.postData(AppLink.cartview, {
      "userid": userid,
    },{});
    return response.fold((l) => l, (r) => r);
  }

  // checkCoupon(String couponname) async {
  //   var response =
  //       await crud.postData(AppLink.checkcoupon, {"couponname": couponname},{});
  //   return response.fold((l) => l, (r) => r);
  // }
}

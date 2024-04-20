// ignore_for_file: unnecessary_this

class ItemsModel {
  dynamic itemsId;
  String? itemsName;
  String? itemsDescription;
  String? itemsImage;
  dynamic itemsCount;
  dynamic itemsActive;
  dynamic itemsPrice;
  dynamic itemsDiscount;
  String? itemsDate;
  dynamic itemsCat;
  dynamic categoriesId;
  String? categoriesName;
  String? categoriesImage;
  String? categoriesDatetime;
  dynamic favorite;

  ItemsModel(
      {this.itemsId,
      this.itemsName,
      this.itemsDescription,
      this.itemsImage,
      this.itemsCount,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsDate,
      this.itemsCat,
      this.categoriesId,
      this.categoriesName,
      this.categoriesImage,
      this.categoriesDatetime,
      this.favorite});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    itemsId = json['item_id'];
    itemsName = json['item_name'];
    itemsDescription = json['item_description'];
    itemsImage = json['item_image'];
    itemsCount = json['item_count'];
    itemsActive = json['item_active'];
    itemsPrice = json['item_price'];
    itemsDiscount = json['item_discount'];
    itemsDate = json['item_date'];
    itemsCat = json['item_cat'];
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesImage = json['categories_image'];
    categoriesDatetime = json['categories_datetime'];
    favorite = json['favorite'];
  }

  Map<String, String?> toJson() {
    final Map<String, String?> data = new Map<String, String?>();
    data['item_id'] = this.itemsId;
    data['item_name'] = this.itemsName;
    data['item_description'] = this.itemsDescription;
    data['item_image'] = this.itemsImage;
    data['item_count'] = this.itemsCount;
    data['item_active'] = this.itemsActive;
    data['item_price'] = this.itemsPrice;
    data['item_discount'] = this.itemsDiscount;
    data['item_date'] = this.itemsDate;
    data['item_cat'] = this.itemsCat;
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_image'] = this.categoriesImage;
    data['categories_datetime'] = this.categoriesDatetime;
    return data;
  }
}

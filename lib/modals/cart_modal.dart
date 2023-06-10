class OrderModal {
  String? added_by;
  String? img;
  String? qty;
  String? sellername;
  String? title;
  String? tprice;
  String? cartId;

  OrderModal(
      {this.added_by,
      this.img,
      this.qty,
      this.sellername,
      this.title,
      this.tprice,
      this.cartId});

  OrderModal.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["added_by"] = added_by;
    data["img"] = img;
    data["qty"] = qty;
    data["sellername"] = sellername;
    data["title"] = title;
    data["tprice"] = tprice;
    data['orderId'] = cartId;
    return data;
  }
}

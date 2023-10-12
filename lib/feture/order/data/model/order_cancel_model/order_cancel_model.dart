// ignore_for_file: prefer_collection_literals

class CancelOrderModel {
  bool? status;
  String? message;
  Data? data;

  CancelOrderModel({this.status, this.message, this.data});

  CancelOrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  dynamic cost;
  dynamic discount;
  dynamic points;
  dynamic vat;
  dynamic total;
  dynamic pointsCommission;
  String? promoCode;
  String? paymentMethod;

  Data(
      {this.id,
      this.cost,
      this.discount,
      this.points,
      this.vat,
      this.total,
      this.pointsCommission,
      this.promoCode,
      this.paymentMethod});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cost = json['cost'];
    discount = json['discount'];
    points = json['points'];
    vat = json['vat'];
    total = json['total'];
    pointsCommission = json['points_commission'];
    promoCode = json['promo_code'];
    paymentMethod = json['payment_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['cost'] = cost;
    data['discount'] = discount;
    data['points'] = points;
    data['vat'] = vat;
    data['total'] = total;
    data['points_commission'] = pointsCommission;
    data['promo_code'] = promoCode;
    data['payment_method'] = paymentMethod;
    return data;
  }
}

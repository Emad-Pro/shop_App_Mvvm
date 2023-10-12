class PaymentKeyRequestModel {
  String? token;

  PaymentKeyRequestModel({this.token});

  PaymentKeyRequestModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['token'] = this.token;
    return data;
  }
}

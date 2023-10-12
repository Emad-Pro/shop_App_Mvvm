class SetOrderRegistrationApiModel {
  String? authToken;
  String? deliveryNeeded;
  String? amountCents;
  String? currency;
  String? merchantOrderId;
  List<Items>? items;
  ShippingData? shippingData;
  ShippingDetails? shippingDetails;

  SetOrderRegistrationApiModel(
      {this.authToken,
      this.deliveryNeeded,
      this.amountCents,
      this.currency,
      this.merchantOrderId,
      this.items,
      this.shippingData,
      this.shippingDetails});

  SetOrderRegistrationApiModel.fromJson(Map<String, dynamic> json) {
    authToken = json['auth_token'];
    deliveryNeeded = json['delivery_needed'];
    amountCents = json['amount_cents'];
    currency = json['currency'];
    merchantOrderId = json['merchant_order_id'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    shippingData =
        json['shipping_data'] != null ? new ShippingData.fromJson(json['shipping_data']) : null;
    shippingDetails = json['shipping_details'] != null
        ? new ShippingDetails.fromJson(json['shipping_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['auth_token'] = this.authToken;
    data['delivery_needed'] = this.deliveryNeeded;
    data['amount_cents'] = this.amountCents;
    data['currency'] = this.currency;
    data['merchant_order_id'] = this.merchantOrderId;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    if (this.shippingData != null) {
      data['shipping_data'] = this.shippingData!.toJson();
    }
    if (this.shippingDetails != null) {
      data['shipping_details'] = this.shippingDetails!.toJson();
    }
    return data;
  }
}

class Items {
  String? name;
  String? amountCents;
  String? description;
  String? quantity;

  Items({this.name, this.amountCents, this.description, this.quantity});

  Items.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    amountCents = json['amount_cents'];
    description = json['description'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['amount_cents'] = this.amountCents;
    data['description'] = this.description;
    data['quantity'] = this.quantity;
    return data;
  }
}

class ShippingData {
  String? apartment;
  String? email;
  String? floor;
  String? firstName;
  String? street;
  String? building;
  String? phoneNumber;
  String? postalCode;
  String? extraDescription;
  String? city;
  String? country;
  String? lastName;
  String? state;

  ShippingData(
      {this.apartment,
      this.email,
      this.floor,
      this.firstName,
      this.street,
      this.building,
      this.phoneNumber,
      this.postalCode,
      this.extraDescription,
      this.city,
      this.country,
      this.lastName,
      this.state});

  ShippingData.fromJson(Map<String, dynamic> json) {
    apartment = json['apartment'];
    email = json['email'];
    floor = json['floor'];
    firstName = json['first_name'];
    street = json['street'];
    building = json['building'];
    phoneNumber = json['phone_number'];
    postalCode = json['postal_code'];
    extraDescription = json['extra_description'];
    city = json['city'];
    country = json['country'];
    lastName = json['last_name'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['apartment'] = this.apartment;
    data['email'] = this.email;
    data['floor'] = this.floor;
    data['first_name'] = this.firstName;
    data['street'] = this.street;
    data['building'] = this.building;
    data['phone_number'] = this.phoneNumber;
    data['postal_code'] = this.postalCode;
    data['extra_description'] = this.extraDescription;
    data['city'] = this.city;
    data['country'] = this.country;
    data['last_name'] = this.lastName;
    data['state'] = this.state;
    return data;
  }
}

class ShippingDetails {
  String? notes;
  int? numberOfPackages;
  int? weight;
  String? weightUnit;
  int? length;
  int? width;
  int? height;
  String? contents;

  ShippingDetails(
      {this.notes,
      this.numberOfPackages,
      this.weight,
      this.weightUnit,
      this.length,
      this.width,
      this.height,
      this.contents});

  ShippingDetails.fromJson(Map<String, dynamic> json) {
    notes = json['notes'];
    numberOfPackages = json['number_of_packages'];
    weight = json['weight'];
    weightUnit = json['weight_unit'];
    length = json['length'];
    width = json['width'];
    height = json['height'];
    contents = json['contents'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notes'] = this.notes;
    data['number_of_packages'] = this.numberOfPackages;
    data['weight'] = this.weight;
    data['weight_unit'] = this.weightUnit;
    data['length'] = this.length;
    data['width'] = this.width;
    data['height'] = this.height;
    data['contents'] = this.contents;
    return data;
  }
}

import 'dart:convert';

class OrderRequestModel {
    final int? addressId;
    final String? paymentMethod;
    final String? shippingService;
    final int? subtotal;
    final int? totalCost;
    final int? shippingCost;
    final String? paymentVaName;
    final List<Item>? items;

    OrderRequestModel({
        this.addressId,
        this.paymentMethod,
        this.shippingService,
        this.subtotal,
        this.totalCost,
        this.shippingCost,
        this.paymentVaName,
        this.items,
    });

    factory OrderRequestModel.fromJson(String str) => OrderRequestModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory OrderRequestModel.fromMap(Map<String, dynamic> json) => OrderRequestModel(
        addressId: json["address_id"],
        paymentMethod: json["payment_method"],
        shippingService: json["shipping_service"],
        subtotal: json["subtotal"],
        totalCost: json["total_cost"],
        shippingCost: json["shipping_cost"],
        paymentVaName: json["payment_va_name"],
        items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "address_id": addressId,
        "payment_method": paymentMethod,
        "shipping_service": shippingService,
        "subtotal": subtotal,
        "total_cost": totalCost,
        "shipping_cost": shippingCost,
        "payment_va_name": paymentVaName,
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toMap())),
    };
}

class Item {
    final int? productId;
    final int? quantity;

    Item({
        this.productId,
        this.quantity,
    });

    factory Item.fromJson(String str) => Item.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Item.fromMap(Map<String, dynamic> json) => Item(
        productId: json["product_id"],
        quantity: json["quantity"],
    );

    Map<String, dynamic> toMap() => {
        "product_id": productId,
        "quantity": quantity,
    };
}

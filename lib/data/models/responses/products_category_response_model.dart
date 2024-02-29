import 'dart:convert';

class ProductsCategoryResponseModel {
    final String? status;
    final List<Product>? products;

    ProductsCategoryResponseModel({
        this.status,
        this.products,
    });

    factory ProductsCategoryResponseModel.fromJson(String str) => ProductsCategoryResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ProductsCategoryResponseModel.fromMap(Map<String, dynamic> json) => ProductsCategoryResponseModel(
        status: json["status"],
        products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "status": status,
        "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toMap())),
    };
}

class Product {
    final int? id;
    final int? categoryId;
    final String? name;
    final String? description;
    final String? image;
    final int? price;
    final int? stock;
    final int? isAvailable;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final Category? category;

    Product({
        this.id,
        this.categoryId,
        this.name,
        this.description,
        this.image,
        this.price,
        this.stock,
        this.isAvailable,
        this.createdAt,
        this.updatedAt,
        this.category,
    });

    factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"],
        categoryId: json["category_id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        price: json["price"],
        stock: json["stock"],
        isAvailable: json["is_available"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        category: json["category"] == null ? null : Category.fromMap(json["category"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "category_id": categoryId,
        "name": name,
        "description": description,
        "image": image,
        "price": price,
        "stock": stock,
        "is_available": isAvailable,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "category": category?.toMap(),
    };
}

class Category {
    final int? id;
    final String? name;
    final String? description;
    final String? image;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    Category({
        this.id,
        this.name,
        this.description,
        this.image,
        this.createdAt,
        this.updatedAt,
    });

    factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Category.fromMap(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

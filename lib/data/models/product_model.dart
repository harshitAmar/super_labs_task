class ProductModel {
  int? statusCode;
  bool? success;
  Data? data;
  String? path;
  String? message;
  Meta? meta;

  ProductModel(
      {this.statusCode,
      this.success,
      this.data,
      this.path,
      this.message,
      this.meta});

  ProductModel.fromJson(Map<String, dynamic> json) {
    if (json["statusCode"] is int) {
      statusCode = json["statusCode"];
    }
    if (json["success"] is bool) {
      success = json["success"];
    }
    if (json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
    if (json["path"] is String) {
      path = json["path"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["meta"] is Map) {
      meta = json["meta"] == null ? null : Meta.fromJson(json["meta"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = <String, dynamic>{};
    jsonData["statusCode"] = statusCode;
    jsonData["success"] = success;
    if (data != null) {
      jsonData["data"] = data?.toJson();
    }
    jsonData["path"] = path;
    jsonData["message"] = message;
    if (meta != null) {
      jsonData["meta"] = meta?.toJson();
    }
    return jsonData;
  }
}

class Meta {
  int? total;
  int? items;
  int? perPage;
  int? currentPage;
  int? lastPage;

  Meta({this.total, this.items, this.perPage, this.currentPage, this.lastPage});

  Meta.fromJson(Map<String, dynamic> json) {
    if (json["total"] is int) {
      total = json["total"];
    }
    if (json["items"] is int) {
      items = json["items"];
    }
    if (json["perPage"] is int) {
      perPage = json["perPage"];
    }
    if (json["currentPage"] is int) {
      currentPage = json["currentPage"];
    }
    if (json["lastPage"] is int) {
      lastPage = json["lastPage"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["total"] = total;
    data["items"] = items;
    data["perPage"] = perPage;
    data["currentPage"] = currentPage;
    data["lastPage"] = lastPage;
    return data;
  }
}

class Data {
  List<Products>? products;
  List<Brands>? brands;
  List<Attributes>? attributes;
  RatingCounts? ratingsCounts;

  Data({this.products, this.brands, this.attributes, this.ratingsCounts});

  Data.fromJson(Map<String, dynamic> json) {
    if (json["products"] is List) {
      products = json["products"] == null
          ? null
          : (json["products"] as List)
              .map((e) => Products.fromJson(e))
              .toList();
    }
    if (json["brands"] is List) {
      brands = json["brands"] == null
          ? null
          : (json["brands"] as List).map((e) => Brands.fromJson(e)).toList();
    }
    if (json["attributes"] is List) {
      attributes = json["attributes"] == null
          ? null
          : (json["attributes"] as List)
              .map((e) => Attributes.fromJson(e))
              .toList();
    }
    if (json["ratingsCounts"] is Map) {
      ratingsCounts = json["ratingsCounts"] == null
          ? null
          : RatingCounts.fromJson(json["ratingsCounts"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (products != null) {
      data["products"] = products?.map((e) => e.toJson()).toList();
    }
    if (brands != null) {
      data["brands"] = brands?.map((e) => e.toJson()).toList();
    }
    if (attributes != null) {
      data["attributes"] = attributes?.map((e) => e.toJson()).toList();
    }
    if (ratingsCounts != null) {
      data["ratingsCounts"] = ratingsCounts?.toJson();
    }
    return data;
  }
}

class RatingCounts {
  int? one;
  int? two;
  int? three;
  int? four;
  int? five;

  RatingCounts({this.one, this.two, this.three, this.four, this.five});

  RatingCounts.fromJson(Map<String, dynamic> json) {
    if (json["1"] is int) {
      one = json["1"];
    }
    if (json["2"] is int) {
      two = json["2"];
    }
    if (json["3"] is int) {
      three = json["3"];
    }
    if (json["4"] is int) {
      four = json["4"];
    }
    if (json["5"] is int) {
      five = json["5"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["1"] = one;
    data["2"] = two;
    data["3"] = three;
    data["4"] = four;
    data["5"] = five;
    return data;
  }
}

class Attributes {
  String? title;
  String? code;
  List<Brands>? values;

  Attributes({this.title, this.code, this.values});

  Attributes.fromJson(Map<String, dynamic> json) {
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["code"] is String) {
      code = json["code"];
    }
    if (json["values"] is List) {
      values = json["values"] == null
          ? null
          : (json["values"] as List).map((e) => Brands.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["title"] = title;
    data["code"] = code;
    if (values != null) {
      data["values"] = values?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

// class Values {
//   int? productCount;
//   bool? selected;

//   Values({this.selected = false, this.productCount});

//   Values.fromJson(Map<String, dynamic> json) {
//     if (json["productCount"] is int) {
//       productCount = json["productCount"];
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data["productCount"] = productCount;
//     return data;
//   }
// }

class Brands {
  String? id;
  String? value;

  String? handle;
  String? name;
  int? productCount;
  bool? selected;

  Brands(
      {this.id,
      this.handle,
      this.selected = false,
      this.name,
      this.value,
      this.productCount});

  Brands.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["value"] is String) {
      value = json["value"];
    }
    if (json["handle"] is String) {
      handle = json["handle"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["productCount"] is int) {
      productCount = json["productCount"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["value"] = value;

    data["handle"] = handle;
    data["name"] = name;
    data["productCount"] = productCount;
    return data;
  }
}

class Products {
  String? id;
  String? title;
  dynamic subtitle;
  String? description;
  String? handle;
  dynamic weight;
  dynamic height;
  dynamic width;
  dynamic length;
  dynamic hsCode;
  dynamic originCountry;
  dynamic midCode;
  dynamic material;
  Metadata? metadata;
  String? createdAt;
  String? updatedAt;
  List<dynamic>? tags;
  String? brandId;
  String? status;
  dynamic createdById;
  dynamic productCategoryId;
  String? thumbnail;
  String? productAttributeGroupId;
  dynamic metaTitle;
  dynamic metaDescription;
  Brand? brand;
  dynamic productCategory;
  List<dynamic>? productCollections;
  List<ProductValuesForAttribute>? productValuesForAttribute;
  List<Variants>? variants;
  List<ProductImages>? productImages;
  List<Reviews>? reviews;
  Count? count;
  double? averageRating;
  int? priceStart;
  dynamic priceEnd;

  Products(
      {this.id,
      this.title,
      this.subtitle,
      this.description,
      this.handle,
      this.weight,
      this.height,
      this.width,
      this.length,
      this.hsCode,
      this.originCountry,
      this.midCode,
      this.material,
      this.metadata,
      this.createdAt,
      this.updatedAt,
      this.tags,
      this.brandId,
      this.status,
      this.createdById,
      this.productCategoryId,
      this.thumbnail,
      this.productAttributeGroupId,
      this.metaTitle,
      this.metaDescription,
      this.brand,
      this.productCategory,
      this.productCollections,
      this.productValuesForAttribute,
      this.variants,
      this.productImages,
      this.reviews,
      this.count,
      this.averageRating,
      this.priceStart,
      this.priceEnd});

  Products.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["title"] is String) {
      title = json["title"];
    }
    subtitle = json["subtitle"];
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["handle"] is String) {
      handle = json["handle"];
    }
    weight = json["weight"];
    height = json["height"];
    width = json["width"];
    length = json["length"];
    hsCode = json["hs_code"];
    originCountry = json["origin_country"];
    midCode = json["mid_code"];
    material = json["material"];
    if (json["metadata"] is Map) {
      metadata =
          json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]);
    }
    if (json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if (json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if (json["tags"] is List) {
      tags = json["tags"] ?? [];
    }
    if (json["brandId"] is String) {
      brandId = json["brandId"];
    }
    if (json["status"] is String) {
      status = json["status"];
    }
    createdById = json["createdById"];
    productCategoryId = json["productCategoryId"];
    if (json["thumbnail"] is String) {
      thumbnail = json["thumbnail"];
    }
    if (json["productAttributeGroupId"] is String) {
      productAttributeGroupId = json["productAttributeGroupId"];
    }
    metaTitle = json["metaTitle"];
    metaDescription = json["metaDescription"];
    if (json["brand"] is Map) {
      brand = json["brand"] == null ? null : Brand.fromJson(json["brand"]);
    }
    productCategory = json["productCategory"];
    if (json["productCollections"] is List) {
      productCollections = json["productCollections"] ?? [];
    }
    if (json["productValuesForAttribute"] is List) {
      productValuesForAttribute = json["productValuesForAttribute"] == null
          ? null
          : (json["productValuesForAttribute"] as List)
              .map((e) => ProductValuesForAttribute.fromJson(e))
              .toList();
    }
    if (json["variants"] is List) {
      variants = json["variants"] == null
          ? null
          : (json["variants"] as List)
              .map((e) => Variants.fromJson(e))
              .toList();
    }
    if (json["productImages"] is List) {
      productImages = json["productImages"] == null
          ? null
          : (json["productImages"] as List)
              .map((e) => ProductImages.fromJson(e))
              .toList();
    }
    if (json["reviews"] is List) {
      reviews = json["reviews"] == null
          ? null
          : (json["reviews"] as List).map((e) => Reviews.fromJson(e)).toList();
    }
    if (json["_count"] is Map) {
      count = json["_count"] == null ? null : Count.fromJson(json["_count"]);
    }
    if (json["averageRating"] is double) {
      averageRating = json["averageRating"];
    }
    if (json["priceStart"] is int) {
      priceStart = json["priceStart"];
    }
    priceEnd = json["priceEnd"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["title"] = title;
    data["subtitle"] = subtitle;
    data["description"] = description;
    data["handle"] = handle;
    data["weight"] = weight;
    data["height"] = height;
    data["width"] = width;
    data["length"] = length;
    data["hs_code"] = hsCode;
    data["origin_country"] = originCountry;
    data["mid_code"] = midCode;
    data["material"] = material;
    if (metadata != null) {
      data["metadata"] = metadata?.toJson();
    }
    data["createdAt"] = createdAt;
    data["updatedAt"] = updatedAt;
    if (tags != null) {
      data["tags"] = tags;
    }
    data["brandId"] = brandId;
    data["status"] = status;
    data["createdById"] = createdById;
    data["productCategoryId"] = productCategoryId;
    data["thumbnail"] = thumbnail;
    data["productAttributeGroupId"] = productAttributeGroupId;
    data["metaTitle"] = metaTitle;
    data["metaDescription"] = metaDescription;
    if (brand != null) {
      data["brand"] = brand?.toJson();
    }
    data["productCategory"] = productCategory;
    if (productCollections != null) {
      data["productCollections"] = productCollections;
    }
    if (productValuesForAttribute != null) {
      data["productValuesForAttribute"] =
          productValuesForAttribute?.map((e) => e.toJson()).toList();
    }
    if (variants != null) {
      data["variants"] = variants?.map((e) => e.toJson()).toList();
    }
    if (productImages != null) {
      data["productImages"] = productImages?.map((e) => e.toJson()).toList();
    }
    if (reviews != null) {
      data["reviews"] = reviews?.map((e) => e.toJson()).toList();
    }
    if (count != null) {
      data["_count"] = count?.toJson();
    }
    data["averageRating"] = averageRating;
    data["priceStart"] = priceStart;
    data["priceEnd"] = priceEnd;
    return data;
  }
}

class Count {
  int? lineItems;

  Count({this.lineItems});

  Count.fromJson(Map<String, dynamic> json) {
    if (json["lineItems"] is int) {
      lineItems = json["lineItems"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["lineItems"] = lineItems;
    return data;
  }
}

class Reviews {
  int? rating;

  Reviews({this.rating});

  Reviews.fromJson(Map<String, dynamic> json) {
    if (json["rating"] is int) {
      rating = json["rating"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["rating"] = rating;
    return data;
  }
}

class ProductImages {
  String? id;
  String? productId;
  String? image;
  int? order;
  String? createdAt;
  String? updatedAt;
  dynamic createdById;
  dynamic productVariantId;

  ProductImages(
      {this.id,
      this.productId,
      this.image,
      this.order,
      this.createdAt,
      this.updatedAt,
      this.createdById,
      this.productVariantId});

  ProductImages.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["productId"] is String) {
      productId = json["productId"];
    }
    if (json["image"] is String) {
      image = json["image"];
    }
    if (json["order"] is int) {
      order = json["order"];
    }
    if (json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if (json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    createdById = json["createdById"];
    productVariantId = json["productVariantId"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["productId"] = productId;
    data["image"] = image;
    data["order"] = order;
    data["createdAt"] = createdAt;
    data["updatedAt"] = updatedAt;
    data["createdById"] = createdById;
    data["productVariantId"] = productVariantId;
    return data;
  }
}

class Variants {
  String? id;
  String? productId;
  String? title;
  String? sku;
  dynamic barcode;
  dynamic ean;
  dynamic upc;
  int? inventoryQuantity;
  bool? allowBackOrder;
  bool? manageInventory;
  dynamic hsCode;
  dynamic originCountry;
  dynamic midCode;
  dynamic material;
  dynamic weight;
  dynamic height;
  dynamic length;
  dynamic width;
  int? variantRank;
  int? price;
  int? specialPrice;
  dynamic specialPriceStartDate;
  dynamic specialPriceEndDate;
  int? inventory;
  dynamic metadata;
  String? createdAt;
  dynamic deletedAt;
  String? updatedAt;
  String? thumbnail;
  dynamic createdById;
  List<dynamic>? prices;
  int? originalPrice;
  int? currentPrice;
  SalePrices? salePrices;

  Variants(
      {this.id,
      this.productId,
      this.title,
      this.sku,
      this.barcode,
      this.ean,
      this.upc,
      this.inventoryQuantity,
      this.allowBackOrder,
      this.manageInventory,
      this.hsCode,
      this.originCountry,
      this.midCode,
      this.material,
      this.weight,
      this.height,
      this.length,
      this.width,
      this.variantRank,
      this.price,
      this.specialPrice,
      this.specialPriceStartDate,
      this.specialPriceEndDate,
      this.inventory,
      this.metadata,
      this.createdAt,
      this.deletedAt,
      this.updatedAt,
      this.thumbnail,
      this.createdById,
      this.prices,
      this.originalPrice,
      this.currentPrice,
      this.salePrices});

  Variants.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["productId"] is String) {
      productId = json["productId"];
    }
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["sku"] is String) {
      sku = json["sku"];
    }
    barcode = json["barcode"];
    ean = json["ean"];
    upc = json["upc"];
    if (json["inventoryQuantity"] is int) {
      inventoryQuantity = json["inventoryQuantity"];
    }
    if (json["allowBackOrder"] is bool) {
      allowBackOrder = json["allowBackOrder"];
    }
    if (json["manageInventory"] is bool) {
      manageInventory = json["manageInventory"];
    }
    hsCode = json["hsCode"];
    originCountry = json["originCountry"];
    midCode = json["midCode"];
    material = json["material"];
    weight = json["weight"];
    height = json["height"];
    length = json["length"];
    width = json["width"];
    if (json["variantRank"] is int) {
      variantRank = json["variantRank"];
    }
    if (json["price"] is int) {
      price = json["price"];
    }
    if (json["specialPrice"] is int) {
      specialPrice = json["specialPrice"];
    }
    specialPriceStartDate = json["specialPriceStartDate"];
    specialPriceEndDate = json["specialPriceEndDate"];
    if (json["inventory"] is int) {
      inventory = json["inventory"];
    }
    metadata = json["metadata"];
    if (json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    deletedAt = json["deletedAt"];
    if (json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if (json["thumbnail"] is String) {
      thumbnail = json["thumbnail"];
    }
    createdById = json["createdById"];
    if (json["prices"] is List) {
      prices = json["prices"] ?? [];
    }
    if (json["originalPrice"] is int) {
      originalPrice = json["originalPrice"];
    }
    if (json["currentPrice"] is int) {
      currentPrice = json["currentPrice"];
    }
    if (json["salePrices"] is Map) {
      salePrices = json["salePrices"] == null
          ? null
          : SalePrices.fromJson(json["salePrices"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["productId"] = productId;
    data["title"] = title;
    data["sku"] = sku;
    data["barcode"] = barcode;
    data["ean"] = ean;
    data["upc"] = upc;
    data["inventoryQuantity"] = inventoryQuantity;
    data["allowBackOrder"] = allowBackOrder;
    data["manageInventory"] = manageInventory;
    data["hsCode"] = hsCode;
    data["originCountry"] = originCountry;
    data["midCode"] = midCode;
    data["material"] = material;
    data["weight"] = weight;
    data["height"] = height;
    data["length"] = length;
    data["width"] = width;
    data["variantRank"] = variantRank;
    data["price"] = price;
    data["specialPrice"] = specialPrice;
    data["specialPriceStartDate"] = specialPriceStartDate;
    data["specialPriceEndDate"] = specialPriceEndDate;
    data["inventory"] = inventory;
    data["metadata"] = metadata;
    data["createdAt"] = createdAt;
    data["deletedAt"] = deletedAt;
    data["updatedAt"] = updatedAt;
    data["thumbnail"] = thumbnail;
    data["createdById"] = createdById;
    if (prices != null) {
      data["prices"] = prices;
    }
    data["originalPrice"] = originalPrice;
    data["currentPrice"] = currentPrice;
    if (salePrices != null) {
      data["salePrices"] = salePrices?.toJson();
    }
    return data;
  }
}

class SalePrices {
  SalePrices();

  SalePrices.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    return data;
  }
}

class ProductValuesForAttribute {
  String? id;
  String? productId;
  String? productAttributeId;
  String? productAttributeValueId;
  dynamic value;
  ProductAttribute? productAttribute;
  ProductAttributeValue? productAttributeValue;

  ProductValuesForAttribute(
      {this.id,
      this.productId,
      this.productAttributeId,
      this.productAttributeValueId,
      this.value,
      this.productAttribute,
      this.productAttributeValue});

  ProductValuesForAttribute.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["productId"] is String) {
      productId = json["productId"];
    }
    if (json["productAttributeId"] is String) {
      productAttributeId = json["productAttributeId"];
    }
    if (json["productAttributeValueId"] is String) {
      productAttributeValueId = json["productAttributeValueId"];
    }
    value = json["value"];
    if (json["productAttribute"] is Map) {
      productAttribute = json["productAttribute"] == null
          ? null
          : ProductAttribute.fromJson(json["productAttribute"]);
    }
    if (json["productAttributeValue"] is Map) {
      productAttributeValue = json["productAttributeValue"] == null
          ? null
          : ProductAttributeValue.fromJson(json["productAttributeValue"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["productId"] = productId;
    data["productAttributeId"] = productAttributeId;
    data["productAttributeValueId"] = productAttributeValueId;
    data["value"] = value;
    if (productAttribute != null) {
      data["productAttribute"] = productAttribute?.toJson();
    }
    if (productAttributeValue != null) {
      data["productAttributeValue"] = productAttributeValue?.toJson();
    }
    return data;
  }
}

class ProductAttributeValue {
  String? id;
  String? productAttributeId;
  String? value;
  int? position;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  dynamic metadata;

  ProductAttributeValue(
      {this.id,
      this.productAttributeId,
      this.value,
      this.position,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.metadata});

  ProductAttributeValue.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["productAttributeId"] is String) {
      productAttributeId = json["productAttributeId"];
    }
    if (json["value"] is String) {
      value = json["value"];
    }
    if (json["position"] is int) {
      position = json["position"];
    }
    if (json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if (json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    deletedAt = json["deletedAt"];
    metadata = json["metadata"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["productAttributeId"] = productAttributeId;
    data["value"] = value;
    data["position"] = position;
    data["createdAt"] = createdAt;
    data["updatedAt"] = updatedAt;
    data["deletedAt"] = deletedAt;
    data["metadata"] = metadata;
    return data;
  }
}

class ProductAttribute {
  String? id;
  String? title;
  String? type;
  String? code;
  bool? isRequired;
  bool? isUnique;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  dynamic metadata;
  String? createdById;

  ProductAttribute(
      {this.id,
      this.title,
      this.type,
      this.code,
      this.isRequired,
      this.isUnique,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.metadata,
      this.createdById});

  ProductAttribute.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["type"] is String) {
      type = json["type"];
    }
    if (json["code"] is String) {
      code = json["code"];
    }
    if (json["isRequired"] is bool) {
      isRequired = json["isRequired"];
    }
    if (json["isUnique"] is bool) {
      isUnique = json["isUnique"];
    }
    if (json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if (json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    deletedAt = json["deletedAt"];
    metadata = json["metadata"];
    if (json["createdById"] is String) {
      createdById = json["createdById"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["title"] = title;
    data["type"] = type;
    data["code"] = code;
    data["isRequired"] = isRequired;
    data["isUnique"] = isUnique;
    data["createdAt"] = createdAt;
    data["updatedAt"] = updatedAt;
    data["deletedAt"] = deletedAt;
    data["metadata"] = metadata;
    data["createdById"] = createdById;
    return data;
  }
}

class Brand {
  String? id;
  String? title;
  String? description;
  String? handle;
  String? image;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? status;
  dynamic metadata;
  dynamic createdById;
  bool? selected;

  Brand(
      {this.id,
      this.title,
      this.selected = false,
      this.description,
      this.handle,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.status,
      this.metadata,
      this.createdById});

  Brand.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["handle"] is String) {
      handle = json["handle"];
    }
    if (json["image"] is String) {
      image = json["image"];
    }
    if (json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if (json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    deletedAt = json["deletedAt"];
    if (json["status"] is String) {
      status = json["status"];
    }
    metadata = json["metadata"];
    createdById = json["createdById"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["title"] = title;
    data["description"] = description;
    data["handle"] = handle;
    data["image"] = image;
    data["createdAt"] = createdAt;
    data["updatedAt"] = updatedAt;
    data["deletedAt"] = deletedAt;
    data["status"] = status;
    data["metadata"] = metadata;
    data["createdById"] = createdById;
    return data;
  }
}

class Metadata {
  String? excerpt;

  Metadata({this.excerpt});

  Metadata.fromJson(Map<String, dynamic> json) {
    if (json["excerpt"] is String) {
      excerpt = json["excerpt"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["excerpt"] = excerpt;
    return data;
  }
}

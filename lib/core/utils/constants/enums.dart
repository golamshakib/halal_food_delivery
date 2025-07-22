enum TextSizes { small, medium, large }

enum OrderStatus { processing, shipped, delivered }

enum PaymentSystem { stripe }

enum PaymentMethod { creditCard, applePay }

// ignore: constant_identifier_names
enum Role { CUSTOMER, RESTAURANT_OWNER, DELIVERY_PARTNER }

enum Screen { singUp, forgetPassword }

enum Category {
  // ignore: constant_identifier_names
  APPETIZERS,
  // ignore: constant_identifier_names
  DESSERTS,
  // ignore: constant_identifier_names
  BURGER,
  // ignore: constant_identifier_names
  DRINK,
  // ignore: constant_identifier_names
  SALAD,
  // ignore: constant_identifier_names
  FRIES,
  // ignore: constant_identifier_names
  OTHER,
}

extension CategoryExtension on Category {
  String get displayText {
    switch (this) {
      case Category.APPETIZERS:
        return 'Appetizers';
      case Category.DESSERTS:
        return 'Desserts';
      case Category.BURGER:
        return 'Burger';
      case Category.DRINK:
        return 'Drink';
      case Category.SALAD:
        return 'Salad';
      case Category.FRIES:
        return 'Fries';
      case Category.OTHER:
        return 'Other';
    }
  }
}

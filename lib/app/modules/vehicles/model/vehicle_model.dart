class Vehicles {
  List<Cars>? cars;

  Vehicles({this.cars});

  Vehicles.fromJson(Map<String, dynamic> json) {
    if (json['cars'] != null) {
      cars = <Cars>[];
      json['cars'].forEach((v) {
        cars!.add(Cars.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cars != null) {
      data['cars'] = cars!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cars {
  int? id;
  String? car;
  String? carModel;
  String? carColor;
  String? carModelYear;
  String? carVin;
  String? price;
  String? availability;

  Cars(
      {this.id,
        this.car,
        this.carModel,
        this.carColor,
        this.carModelYear,
        this.carVin,
        this.price,
        this.availability});

  Cars.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    car = json['car'];
    carModel = json['car_model'];
    carColor = json['car_color'];
    carModelYear = json['car_model_year'].toString();
    carVin = json['car_vin'];
    price = json['price'];
    availability = json['availability'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['car'] = car;
    data['car_model'] = carModel;
    data['car_color'] = carColor;
    data['car_model_year'] = carModelYear;
    data['car_vin'] = carVin;
    data['price'] = price;
    data['availability'] = availability;
    return data;
  }
}
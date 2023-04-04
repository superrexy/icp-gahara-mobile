import 'package:get/get.dart';
import 'package:icp_gahara_mobile/app/data/cars_provider.dart';
import 'package:icp_gahara_mobile/app/model/response/cars_response.dart';

class DetailRentCarController extends GetxController {
  // Provider
  final CarsProvider carsProvider = CarsProvider();

  // Observable
  final car = CarsDataResponse().obs;

  // Function
  Future<void> getCar() async {
    try {
      final response = await carsProvider.getCarByID(Get.arguments['carId']);

      if (response != null) {
        car.update((val) {
          val?.id = response.id;
          val?.name = response.name;
          val?.image = response.image;
          val?.seats = response.seats;
          val?.description = response.description;
          val?.transmision = response.transmision;
          val?.typeCar = response.typeCar;
          val?.typeFuel = response.typeFuel;
          val?.createdAt = response.createdAt;
          val?.updatedAt = response.updatedAt;
          val?.priceDay = response.priceDay;
          val?.pricesHour = response.pricesHour;
          val?.carDayPrice = response.carDayPrice;
          val?.carHourPrice = response.carHourPrice;
          val?.carImages = response.carImages;
        });
      }
    } catch (e) {
      Get.printError(info: e.toString());
    }
  }

  @override
  void onInit() {
    getCar();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

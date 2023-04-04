import 'package:get/get.dart';
import 'package:icp_gahara_mobile/app/data/users_provider.dart';
import 'package:icp_gahara_mobile/app/model/response/users_response.dart';

class DashboardController extends GetxController {
  // Users Provider
  final UsersProvider usersProvider = UsersProvider();

  // Observable
  final selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
    update();
  }

  final user = UsersDataResponse(
          id: 0,
          fullName: '',
          noKtp: '',
          email: '',
          role: '',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now())
      .obs;

  Future<void> getProfile() async {
    try {
      final response = await usersProvider.profile();

      if (response != null) {
        user.update((val) {
          val?.fullName = response.fullName;
          val?.noKtp = response.noKtp;
          val?.address = response.address;
          val?.phone = response.phone;
          val?.email = response.email;
          val?.role = response.role;
          val?.userImage = response.userImage;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    getProfile();
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

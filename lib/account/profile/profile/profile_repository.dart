import 'package:mystore_project/account/profile/profile/index.dart';

class ProfileRepository {
  final ProfileProvider _profileProvider = ProfileProvider();

  ProfileRepository();

  void test(bool isError) {
    _profileProvider.test(isError);
  }
}
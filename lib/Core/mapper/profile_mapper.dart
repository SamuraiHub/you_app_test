import '../Api/profile/model/profile.dart';
import '../model/profile_data.dart';
import 'mapper.dart';

class ProfileMapper extends Mapper<Profile, ProfileData> {

  @override
  Profile from(ProfileData? output) {
    return Profile(
      name: output?.name ?? "",
      email: output?.email ?? "",
      username: output?.username ?? "",
      birthday: output?.birthday ?? "",
      height: output?.height ?? 0,
      weight: output?.weight ?? 0,
      interests: output?.interests ?? [],
    );
  }

  @override
  ProfileData to(Profile? input) {
    return ProfileData(
      name: input?.name ?? "",
      email: input?.email ?? "",
      username: input?.username ?? "",
      birthday: input?.birthday ?? "",
      height: input?.height ?? 0,
      weight: input?.weight ?? 0,
      interests: input?.interests ?? [],
    );
  }
}
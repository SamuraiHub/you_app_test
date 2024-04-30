import 'package:bloc/bloc.dart';
import 'package:you_app_test/Presentation/bloc/profile/profile_event.dart';
import 'package:you_app_test/Presentation/bloc/profile/profile_state.dart';

import '../../../Core/model/profile_data.dart';
import '../../../Core/repository/i_profile_repository.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final IProfileRepository profileRepo;

  ProfileBloc(this.profileRepo) : super(ProfileLoading());

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is ProfileInitialLoad) {
      yield ProfileLoading();
      yield await _proceedToLoad(event.acessToken);
    } else if (event is ProfileReload) {
      yield ProfileLoading();
      yield await _proceedToLoad(event.acessToken);
    } else if (event is ProfileUpdate) {
      yield ProfileLoading();
      yield await _proceedToUpdate(event.acessToken, event.profileData);
    }
  }

  Future<ProfileState> _proceedToLoad(String access_token) async {
    var result = await profileRepo.getProfile(access_token);

    return result.fold((exception) => ProfileError(exception), (profileData) {
      return ProfileLoaded(profileData);
    });
  }

  Future<ProfileState> _proceedToUpdate(String access_token, ProfileData profileData) async {
    var result = await profileRepo.updateProfile(access_token, profileData);

    return result.fold((exception) => ProfileError(exception), (message) {
      return ProfileLoaded(profileData);
    });
  }
}
import 'package:equatable/equatable.dart';

import '../../../Core/model/profile_data.dart';

class ProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfileInitialLoad extends ProfileEvent {
  String acessToken;
  ProfileInitialLoad(this.acessToken);
}

class ProfileReload extends ProfileEvent {
  String acessToken;
  ProfileReload(this.acessToken);
}

class ProfileUpdate extends ProfileEvent {
  final ProfileData profileData;
  final String acessToken;

  ProfileUpdate(this.acessToken, this.profileData);

  @override
  List<Object?> get props => [profileData];
}
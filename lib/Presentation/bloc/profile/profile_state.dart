import 'package:equatable/equatable.dart';

import '../../../Core/model/profile_data.dart';

class ProfileState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final ProfileData profileData;

  ProfileLoaded(this.profileData);

  @override
  List<Object?> get props => [profileData];
}

class ProfileError extends ProfileState {
  final Exception exception;

  ProfileError(this.exception);

  @override
  List<Object?> get props => [exception];
}
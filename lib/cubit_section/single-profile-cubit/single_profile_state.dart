part of 'single_profile_cubit.dart';

@immutable
abstract class SingleProfileState extends Equatable{
  SingleProfileState();
}

class SingleProfileInitial extends SingleProfileState {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class SingleProfileCubitLoading extends SingleProfileState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class SingleProfileCubitDataLoaded extends SingleProfileState{
  ProfileModel profile;
  SingleProfileCubitDataLoaded({required this.profile});
  @override
  // TODO: implement props
  List<Object?> get props => [profile];

}

class SingleProfileCubitError extends SingleProfileState{

  String message;
  SingleProfileCubitError({required this.message});
  @override
  // TODO: implement props
  List<Object?> get props => [message];

}

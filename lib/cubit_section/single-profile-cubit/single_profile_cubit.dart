import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/single_profile_model.dart';
import '../../service/api_service.dart';

part 'single_profile_state.dart';

class SingleProfileCubit extends Cubit<SingleProfileState> {


  SingleProfileCubit() : super(SingleProfileInitial());

  void getAllUserList() async {
    emit(SingleProfileCubitLoading());
    ProfileModel profile = await ApiService().getSingleProfile();
    emit(SingleProfileCubitDataLoaded(profile: profile));
  }
}
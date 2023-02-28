
import 'package:bloc_larning/cubit_section/user-cubit-section/user_cubit_state.dart';
import 'package:bloc_larning/service/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user_model.dart';

class UserCubit extends Cubit<UserCubitState> {
  List<UserModel> userList = [];
  UserCubit(): super(UserCubitInit());

  void getAllUserList() async{
    emit(UserCubitLoading());
    userList = await ApiService().getUserList();
    emit(UserCubitDataLoaded(userList: userList));

  }

}
import 'package:bloc_larning/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit_section/user-cubit-section/user_cubit.dart';
import '../cubit_section/user-cubit-section/user_cubit_state.dart';
class ApiCallingPage extends StatefulWidget {
  const ApiCallingPage({Key? key}) : super(key: key);

  @override
  State<ApiCallingPage> createState() => _ApiCallingPageState();
}

class _ApiCallingPageState extends State<ApiCallingPage> {
  @override
  void initState(){
    super.initState();
    context.read<UserCubit>().getAllUserList();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title:  const Text('Api Calling page'),
          centerTitle: true,
        ),
          body: BlocBuilder<UserCubit, UserCubitState>(
        builder: (context, state){
          if(state is UserCubitLoading){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else if(state is UserCubitDataLoaded){
            return ListView.builder(
              itemCount: state.userList.length,
                itemBuilder: (context, itemIndex){
                  UserModel userModel = state.userList[itemIndex];

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                        leading:  Text(userModel.id.toString(), style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 25
                        ),),
                        title: Text(userModel.name.toString(),style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20
                        ),),
                        // textColor: Colors.black45,
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(userModel.username.toString(),style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17
                            ),),
                            Text("Email: ${userModel.email}",style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17
                            ),),
                          ],
                        ),
                      ),
                    ),
                  );
                }
            );
          }
          else{
          return Text("data");
          }
        }
          )
    );
  }
}

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
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title:  const Text('Api Calling page'),
          centerTitle: true,
        ),
          body: BlocBuilder<UserCubit, UserCubitState>(
        builder: (context, state){
          return Column(
            children: [],
          );
        }
          )
    );
  }
}

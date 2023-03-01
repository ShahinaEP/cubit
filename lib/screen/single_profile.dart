import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit_section/single-profile-cubit/single_profile_cubit.dart';
import '../models/single_profile_model.dart';

class SingleProfile extends StatefulWidget {
  const SingleProfile({Key? key}) : super(key: key);

  @override
  State<SingleProfile> createState() => _SingleProfileState();
}

class _SingleProfileState extends State<SingleProfile> {

  @override
  void initState(){
    super.initState();
    context.read<SingleProfileCubit>().getAllUserList();

  }
  final style =  const TextStyle(fontSize: 20,fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Single Profile"),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),

      body:  BlocBuilder<SingleProfileCubit, SingleProfileState>(
          builder: (context, state){
            if(state is SingleProfileCubitLoading){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }else if(state is SingleProfileCubitDataLoaded){
              ProfileModel profileModel = state.profile;
              return  SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                        Card(
                          color: Colors.grey.shade300,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(15, 4, 15, 4),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Page: ${profileModel.page}",
                                    style: style,
                                  ),
                                  Text(
                                    "Per Page: ${profileModel.perPage}",
                                    style: style,
                                  ),
                                  Text(
                                    "Total Pages: ${profileModel.totalPages}",
                                    style: style,
                                  ),
                                  Text(
                                    "Total Data: ${profileModel.total}",
                                    style: style,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),


                    ListView.builder(
                      primary: true,
                      shrinkWrap: true,
                      itemCount: profileModel.data?.length,
                      itemBuilder: (context, itemIndex){

                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              leading: Container(
                                // decoration: BoxDecoration(
                                //   borderRadius: \
                                // ),
                                  // constraints: BoxConstraints(minWidth: 50, minHeight: 50),
                                  child: Image.network(
                                    profileModel.data![itemIndex].avatar.toString(),
                                    width: 50,
                                    height: 50,
                                  )),
                              // Text(profileModel.data![itemIndex].id.toString(), style: const TextStyle(
                              // fontWeight: FontWeight.w500,
                              // fontSize: 25
                              // ),),
                              title: Text(profileModel.data![itemIndex].firstName.toString(),style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20
                                ),),

                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  Text(profileModel.data![itemIndex].lastName.toString(),style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17
                                  ),),
                                  Text("Email: ${profileModel.data![itemIndex].email.toString()}",style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17
                                 ),),
                                ]),
                            ),
                          ),
                        ),
                      );
                    }),


                    Card(
                      color: Colors.grey.shade300,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 4, 15, 4),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Text: ${profileModel.support!.text}",
                                style: style,
                              ),
                              Text(
                                "Url: ${profileModel.support!.url}",
                                style: style,
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              );
            }
            else{
              return const Text("some error");
            }
          }
      ),

    );
  }
}

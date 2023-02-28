import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit_section/counter-cubit/counter_cubit.dart';
import '../cubit_section/counter-cubit/counter_cubit_state.dart';
import 'api_calling_page.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final txtstyle =  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cubit Counter"),
        backgroundColor: Colors.brown,
        centerTitle: true,
      ),
      body: BlocBuilder<CounterCubit, CounterCubitState>(
        builder: (context, state){
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                (state is CounterValueUpdated) 
                    ? Text(state.counter.toString(), style: txtstyle,)
                    :  Text("0", style: txtstyle,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FloatingActionButton(
                        onPressed: (){
                          context.read<CounterCubit>().counterIncrease();
                        },
                        child: const Icon(Icons.add),
                    ),
                    FloatingActionButton(
                      onPressed: (){
                        context.read<CounterCubit>().counterDecrease();
                      },
                      child: const Icon(Icons.remove),
                    ),
                    ],
                ),
                // ApiCallingPage()
                // ElevatedButton(onPressed:(){
                //   Navigator.of(context)
                //       .push(MaterialPageRoute(builder: (context) => ApiCallingPage()));
                // } , child: const Text('Api calling page'))
              ],
            ),
          );
        }
      ),
    );
  }
}

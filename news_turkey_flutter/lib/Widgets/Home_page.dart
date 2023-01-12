import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/cubit/cubit.dart';
import 'package:untitled/cubit/states.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getBusiness(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('Haberler'),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                ),
                IconButton(
                  onPressed: () {
                    NewsCubit.get(context).Chngtheme();
                    cubit.changebtn(true);
                  },
                  icon: Icon(Icons.brightness_4_rounded),
                ),
              ],
            ),

            body: cubit.Screens[cubit.currentindex],
          );
        },
      ),
    );
  }
}

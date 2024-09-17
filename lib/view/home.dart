import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/cubit/posts_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostsCubit, PostsState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = context.read<PostsCubit>();
        return Scaffold(
          body:  state is DataReach ?
          ListView.builder(
            itemCount: cubit.posts!.length  ,
            itemBuilder: (context, index) {
              return Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(19),
                ),
                color: Colors.amber,
                child: ListTile(
                  title: Text(cubit.posts![index].title.toString()),
                  subtitle: Text(cubit.posts![index].body.toString()),
                  leading: Text(cubit.posts![index].id.toString()),
                ),
              );
            },
            ):
            Center(
              child: CircularProgressIndicator(),
            )
        );
      },
    );
  }
}
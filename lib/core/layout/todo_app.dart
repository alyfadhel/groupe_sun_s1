import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_sun_s1/core/layout/controller/cubit/cubit.dart';
import 'package:group_sun_s1/core/layout/controller/cubit/state.dart';
import 'package:group_sun_s1/core/share/widgets/my_text_form_field.dart';
import 'package:group_sun_s1/features/modules/todo/archive/archive_screen.dart';
import 'package:group_sun_s1/features/modules/todo/done/done_screen.dart';
import 'package:group_sun_s1/features/modules/todo/new/new_screen.dart';
import 'package:intl/intl.dart';

import 'package:sqflite/sqflite.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDataFromDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if(state is AppInsertDataFromDatabaseState){
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            key: cubit.scaffoldKey,
            appBar: AppBar(
              backgroundColor: Colors.blue,
              automaticallyImplyLeading: false,
              title: Text(
                cubit.titles[cubit.currentIndex],
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                // try{
                //   var name = await getName();
                //   print(name);
                //   throw('Error is !!!!!!');
                // }catch(error){
                //   print(error.toString());
                // }
                // getName()
                //     .then(
                //       (value) {
                //         print(value);
                //         throw('error is!!!!!!');
                //       },
                //     )
                //     .catchError(
                //       (error) {
                //         print(error.toString());
                //       },
                //     );
                if (cubit.isShowBottom) {
                  if(cubit.formKey.currentState!.validate()){
                    if (context.mounted) {
                      cubit.insertDataFromDatabase(
                        title: cubit.titleController.text,
                        time: cubit.timeController.text,
                        date: cubit.dateController.text,
                      );
                      cubit.changeFabIcon(
                        isShow: false,
                        icon: Icons.edit,
                      );
                    }
                  }
                } else {
                  cubit.scaffoldKey.currentState!
                      .showBottomSheet(
                        (context) => Container(
                          color: Colors.grey[300],
                          child: Padding(
                            padding: const EdgeInsets.all(
                              20.0,
                            ),
                            child: Form(
                              key: cubit.formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  MyTextFormField(
                                    controller: cubit.titleController,
                                    type: TextInputType.text,
                                    text: 'title',
                                    prefix: Icons.title,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Title must be not empty';
                                      }
                                      return null;
                                    },
                                    radius: 15.0,
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  MyTextFormField(
                                    controller: cubit.timeController,
                                    type: TextInputType.datetime,
                                    text: 'time',
                                    prefix: Icons.watch_later_outlined,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Time must be not empty';
                                      }
                                      return null;
                                    },
                                    radius: 15.0,
                                    onTap: () {
                                      FocusScope.of(context)
                                          .requestFocus(FocusNode());
                                      showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                      ).then(
                                        (value) {
                                          if (value != null) {
                                            if (context.mounted) {
                                              cubit.timeController.text =
                                                  value.format(context);
                                              print(value.format(context));
                                            }
                                          }
                                        },
                                      );
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  MyTextFormField(
                                    controller: cubit.dateController,
                                    type: TextInputType.datetime,
                                    text: 'date',
                                    prefix: Icons.calendar_month,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Date must be not empty';
                                      }
                                      return null;
                                    },
                                    radius: 15.0,
                                    onTap: () {
                                      FocusScope.of(context)
                                          .requestFocus(FocusNode());
                                      showDatePicker(
                                        context: context,
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.parse('2024-12-31'),
                                      ).then(
                                        (value) {
                                          if (value != null) {
                                            cubit.dateController.text =
                                                DateFormat.yMMMd().format(value);
                                            print(DateFormat.yMMMd()
                                                .format(value)
                                                .toString());
                                          }
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                      .closed
                      .then(
                    (value) {
                      cubit.changeFabIcon(
                        isShow: false,
                        icon: Icons.edit,
                      );
                    },
                  );
                  // setState(() {
                  cubit.changeFabIcon(
                    isShow: true,
                    icon: Icons.add,
                  );
                }
              },
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  30.0,
                ),
              ),
              child: Icon(
                cubit.fabIcon,
                color: Colors.white,
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.items,
              currentIndex: cubit.currentIndex,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              onTap: (index) {
                cubit.changeBottomNav(index);
              },
              type: BottomNavigationBarType.fixed,
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}

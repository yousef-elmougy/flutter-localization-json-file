import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/locale_cubit.dart';
import 'model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localeCubit = BlocProvider.of<LocaleCubit>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('${'app_name'.tr(context)}'),
        actions: <Widget>[
          BlocBuilder<LocaleCubit, LocaleState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.only(right: 20),
                child: DropdownButton(
                  icon: const Icon(
                    Icons.language,
                    color: Colors.black,
                    size: 30,
                  ),
                  onChanged: (LocaleModel ?language)  {
                    localeCubit.saveLocale(
                        codeLange: language!.languageCode);
                  },
                  items: LocaleModel.languages
                      .map(
                        (e) => DropdownMenuItem(
                      value: e,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(e.flag,
                              style: const TextStyle(fontSize: 30)),
                          Text(e.name)
                        ],
                      ),
                    ),
                  )
                      .toList(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

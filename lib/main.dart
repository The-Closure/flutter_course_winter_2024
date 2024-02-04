import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:service_layer_clean/app_string.dart';
import 'package:service_layer_clean/config/config.dart';
import 'package:service_layer_clean/model/error_mode.dart';
import 'package:service_layer_clean/model/result_model.dart';
import 'package:service_layer_clean/model/user_model.dart';
import 'package:service_layer_clean/model/user_model_two_model.dart';
import 'package:service_layer_clean/service/user_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  setup();
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('ar'), Locale('en')],
        path:
            'assets/translate', // <-- change the path of the translation files
        fallbackLocale: Locale('en'),
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: HomePage()
    );
  }
}

class ServiceUIExample extends StatelessWidget {
  const ServiceUIExample({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: UserServiceImpelment().getOneUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            ResultModel temp = snapshot.data as ResultModel;
            if (temp is UserModel) {
              return ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text((index + 1).toString()),
                    ),
                    title: Text(temp.name),
                    subtitle: Text(temp.email),
                  );
                },
              );
            } else {
              temp as ErrorModel;
              return Center(child: Text(temp.message));
            }
          } else {
            return Center(
              child: LinearProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello1").tr(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(core.get<DateTime>().minute.toString()),
            Text(AppString.HELLOWOLRD).tr(),
            ElevatedButton(onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) {
                return HomePage2();
              },));
              if(context.locale.languageCode == 'ar'){
                context.setLocale(Locale('en'));
              }else {
                   context.setLocale(Locale('ar'));
              }
            }, child: Text("translate").tr())
          ],
        ),
      ),
    );
  }
}



class HomePage2 extends StatelessWidget {
  const HomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello1").tr(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(core.get<DateTime>().minute.toString()),
            Text(AppString.HELLOWOLRD).tr(),
            ElevatedButton(onPressed: () {
              if(context.locale.languageCode == 'ar'){
                context.setLocale(Locale('en'));
              }else {
                   context.setLocale(Locale('ar'));
              }
            }, child: Text("translate").tr())
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:month_picker_dialog_example/font_tyoes.dart';

void main() => runApp(MyApp(
      initialDate: DateTime.now(),
    ));

class MyApp extends StatefulWidget {
  final DateTime initialDate;

  const MyApp({Key? key, required this.initialDate}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'),
        Locale('zh'),
        Locale('fr'),
        Locale('es'),
        Locale('de'),
        Locale('ru'),
        Locale('ja'),
        Locale('ar'),
        Locale('fa'),
        Locale("es"),
      ],
      theme: ThemeData.light().copyWith(
        backgroundColor: Colors.white,
        primaryColor: Colors.blue,
        accentColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        textTheme: ThemeData.light().textTheme.copyWith(
            // for head lines and the same app color
            headline1: ThemeData.light().textTheme.headline1?.copyWith(
                color: Colors.blue,
                fontSize: 23,
                fontWeight: FontWeight.w700,
                fontFamily: FontType.BahijBold),
            // for headlines with black
            headline2: ThemeData.light().textTheme.headline1?.copyWith(
                color: Colors.grey,
                fontSize: 20,
                fontWeight: FontWeight.w300,
                fontFamily: FontType.BahijBold),

            /// for rose texts
            bodyText1: ThemeData.light()
                .textTheme
                .subtitle2
                ?.copyWith(color: Colors.blue, fontSize: 20),

            /// for black texts
            bodyText2: ThemeData.light().textTheme.subtitle2?.copyWith(
                color: Colors.blue, fontSize: 17, fontFamily: FontType.Bahij),

            /// for white texts
            subtitle1: ThemeData.light().textTheme.subtitle2?.copyWith(
                color: Colors.blue, fontSize: 19, fontFamily: FontType.Bahij),
            button: ThemeData.light()
                .textTheme
                .button
                ?.copyWith(color: Colors.blue, fontSize: 20)),
        buttonTheme: ThemeData.light().buttonTheme.copyWith(
            buttonColor: Colors.blue, textTheme: ButtonTextTheme.primary),
        colorScheme: ColorScheme.light(
          onPrimary: Colors.white,
          secondary: Colors.blue,
        ),
        inputDecorationTheme: ThemeData.dark().inputDecorationTheme.copyWith(
              enabledBorder: new OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  borderSide: new BorderSide(color: Colors.blue)),
              focusedBorder: new OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  borderSide: new BorderSide(color: Colors.blue)),
              errorBorder: new OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  borderSide: new BorderSide(color: Colors.red)),
              disabledBorder: new OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  borderSide: new BorderSide(color: Colors.blue)),
              focusedErrorBorder: new OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  borderSide: new BorderSide(color: Colors.blue)),
              hintStyle: TextStyle(
                  color: Color(0XFF0C0C0C),
                  fontSize: ThemeData.dark().textTheme.caption?.fontSize),
              labelStyle: TextStyle(color: Color(0XFF0C0C0C)),
              errorStyle: ThemeData.dark().inputDecorationTheme.errorStyle,
              contentPadding: EdgeInsets.all(8.0),
              focusColor: Colors.white,
              hoverColor: Colors.white,
              fillColor: Color(0XFF0C0C0C),
            ),
        appBarTheme: ThemeData.light().appBarTheme.copyWith(
            backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle.light,
            // color: Colors.white,
            backgroundColor: Colors.white,
            titleTextStyle: TextStyle(
                color: Colors.blue, fontSize: 20, fontFamily: FontType.Bahij),
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.white)),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Month Picker Example App'),
        ),
        body: Center(
          child: Text(
            'Year: ${selectedDate?.year}\nMonth: ${selectedDate?.month}',
            style: Theme.of(context).textTheme.headline4,
            textAlign: TextAlign.center,
          ),
        ),
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            onPressed: () {
              showMonthPicker(
                context: context,
                firstDate: DateTime(DateTime.now().year - 1, 5),
                lastDate: DateTime(DateTime.now().year + 1, 9),
                initialDate: selectedDate ?? widget.initialDate,
                locale: Locale("ar"),
              ).then((date) {
                if (date != null) {
                  setState(() {
                    selectedDate = date;
                  });
                }
              });
            },
            child: Icon(Icons.calendar_today),
          ),
        ),
      ),
    );
  }
}

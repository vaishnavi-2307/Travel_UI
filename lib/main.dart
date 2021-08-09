import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:device_preview/device_preview.dart';
import 'package:travel_app/models/travel.dart';

void main() {
  // ignore: non_constant_identifier_names
  runApp(DevicePreview(
    // ignore: non_constant_identifier_names
    builder: (Context) => MyApp(),
    enabled: !kReleaseMode,
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        locale: DevicePreview.locale(context), // Add the locale here
        builder: DevicePreview.appBuilder,
        home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: VxResponsive(
        xsmall: Column(
          children: [
            ImageContainer(),
            Category(),
            City(),
          ],
        ).scrollVertical(),
        small: Column(
          children: [
            ImageContainer(),
            Category(),
            City(),
          ],
        ).scrollVertical(),
        medium: Column(
          children: [
            ImageContainer(),
            Category(),
            City(),
          ],
        ).scrollVertical(),
        large: Column(
          children: [
            ImageContainer(),
            40.heightBox,
            Category(),
            City(),
          ],
        ).scrollVertical(),
        xlarge: Column(
          children: [
            ImageContainer(),
            Category(),
            City(),
          ],
        ).scrollVertical(),
        fallback: Column(
          children: [
            ImageContainer(),
            Category(),
            City(),
          ],
        ).scrollVertical(),
      )),
    );
  }
}

class ImageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://tse3.mm.bing.net/th?id=OIP.WIFu3pJsQGx3WNBX0qPlFwHaD2&pid=Api&P=0&w=355&h=185",
      width: context.percentWidth * 100,
      fit: BoxFit.cover,
    );
  }
}

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: context.isMobile ? 50 : 90,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: cities.length,
            itemBuilder: (context, index) {
              return VxBox(
                      child: cities[index]
                          .countryName
                          .text
                          .size(context.isMobile ? 15 : 40)
                          .semiBold
                          .white
                          .makeCentered())
                  .size(
                      context.isMobile
                          ? context.percentWidth * 25
                          : context.percentWidth * 30,
                      context.percentHeight * 20)
                  .blue800
                  .roundedSM
                  .make()
                  .p4();
            }));
  }
}

class City extends StatefulWidget {
  @override
  _CityState createState() => _CityState();
}

class _CityState extends State<City> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: cities.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: context.isMobile ? 2 : 3),
        itemBuilder: (context, index) {
          return Stack(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    cities[index].cityImage,
                    height: context.isMobile
                        ? context.percentHeight * 30
                        : context.percentHeight * 50,
                    width: context.percentWidth * 50,
                    fit: BoxFit.cover,
                  )),
              Align(
                alignment: Alignment.bottomCenter,
                child: VxBox(
                        child: cities[index]
                            .cityName
                            .text
                            .semiBold
                            .black
                            .size(context.isMobile ? 20 : 40)
                            .bold
                            .makeCentered())
                    .height(context.isMobile ? 30 : 70)
                    .color(Colors.white.withOpacity(0.5))
                    .roundedSM
                    .alignBottomCenter
                    .make(),
              ),
            ],
          ).p4();
        });
  }
}

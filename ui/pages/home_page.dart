import 'package:animals_app/models/animal_model.dart';
import 'package:animals_app/models/category_model.dart';
import 'package:animals_app/ui/bloc/animal/animal_cubit.dart';
import 'package:animals_app/ui/bloc/category/category_cubit.dart';
import 'package:animals_app/ui/components/bottom_nav_item.dart';
import 'package:animals_app/ui/components/category_item.dart';
import 'package:animals_app/ui/constants.dart';
import 'package:animals_app/ui/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];

  @override
  void initState() {
    BlocProvider.of<CategoryCubit>(context).getAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: 75,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BottomNavItem(
              title: "Kategoriler",
              svgUrl: "assets/icons/menu.svg",
              onTap: () {},
              isActive: true,
            ),
            BottomNavItem(
              title: "Hayvanlar",
              svgUrl: "assets/icons/menu.svg",
              onTap: () {},
            ),
            BottomNavItem(
              title: "Takip Ettiklerin",
              svgUrl: "assets/icons/menu.svg",
              onTap: () {},
            )
          ],
        ),
      ),
      body: buildContent(),
    );
  }

  Widget buildContent() {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: size.height * 0.47,
          decoration: BoxDecoration(
              color: headerBgColor,
              image: DecorationImage(
                  alignment: Alignment.centerLeft,
                  image: AssetImage("assets/images/headerBg.png"))),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    alignment: Alignment.center,
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                        color: Color(0xFFF2BEA1), shape: BoxShape.circle),
                    child: SvgPicture.asset("assets/icons/menu.svg"),
                  ),
                ),
                Text(
                  "Hayvanlar Alemine \nHoşgeldin",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                      color: textColor),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Arama...",
                        icon: SvgPicture.asset("assets/icons/search.svg"),
                        border: InputBorder.none),
                  ),
                ),
                BlocConsumer<CategoryCubit, CategoryState>(
                  builder: (context, state) {
                    if (state is AnimalInitial) {
                      return Text("...");
                    } else if (state is CategoryLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is CategoriesLoaded) {
                      categories.addAll(state.categories);
                      return Expanded(
                        child: GridView.builder(
                            itemCount: categories.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 20,
                                    crossAxisSpacing: 20,
                                    childAspectRatio: .85),
                            itemBuilder: (context, index) {
                              return CategoryItem(
                                title: categories[index].title,
                                svgUrl: categories[index].image,
                                onPress: () {},
                              );
                            }),
                      );
                    } else {
                      return SizedBox(width: 10);
                    }
                  },
                  listener: (context, state) {
                    if (state is CategoryError) {
                      return Text(state.message);
                    }
                  },
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  /*Widget buildContent() {
    return Container(
      child: FutureBuilder<List<AnimalModel>>(
          future: widget._animalManager.getAll(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Text(snapshot.data[index].title);
                  });
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }*/
}

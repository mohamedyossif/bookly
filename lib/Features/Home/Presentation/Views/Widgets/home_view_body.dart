import 'package:bookly_app/Core/Utilities/app_styles.dart';
import 'package:bookly_app/Core/Widgets/custom_error.dart';
import 'package:bookly_app/Features/Home/Presentation/Views/Widgets/custom_home_book_app_bar.dart';
import 'package:bookly_app/Features/Home/Presentation/Views/Widgets/featured_list_view.dart';
import 'package:bookly_app/Features/Home/Presentation/Views/Widgets/newest_sliver_list.dart';
import 'package:bookly_app/Features/Home/Presentation/manger/NewestBookCubit/newest_book_cubit.dart';
import 'package:bookly_app/Features/Home/Presentation/manger/NewestBookCubit/newest_book_state.dart';
import 'package:bookly_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CutomHomBookAppBar(),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: const FeaturedListView()),
              const SizedBox(
                height: 50,
              ),
              const Padding(
                padding: EdgeInsets.only(left: kPaddingV),
                child: Text(
                  'Newest Books',
                  style: AppStyles.textStyle18,
                ),
              ),
            ],
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.only(
            top: 21.5,
            left: kPaddingV,
          ),
          sliver: NewestSliverList(),
        )
      ],
    );
  }
}

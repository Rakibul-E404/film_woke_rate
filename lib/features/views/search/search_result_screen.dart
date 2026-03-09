import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:woke_movie_rating/features/utils/app_colors.dart';
import 'package:woke_movie_rating/features/utils/app_text_styles.dart';
import 'package:woke_movie_rating/features/widgets/home_widget/custom_search_bar.dart';
import 'package:woke_movie_rating/features/widgets/home_widget/search_card.dart';
import 'package:woke_movie_rating/features/widgets/custom_background.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({super.key});

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode(); // <-- Add FocusNode

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose(); // <-- Clean up FocusNode
    super.dispose();
  }

  // Helper method to hide keyboard
  void _hideKeyboard() {
    FocusScope.of(context).unfocus();
    _searchFocusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // 👇 Wrap body with GestureDetector to detect taps outside search
        body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: _hideKeyboard, // Hide keyboard when tapping anywhere
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              /// 🔍 CUSTOM SLIVER APPBAR
              SliverAppBar(
                pinned: true,
                elevation: 0,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                flexibleSpace: CustomBackground(
                  child: SafeArea(
                    child: Stack(
                      children: [
                        Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/star_with_background_shade.svg",
                              ),
                              const SizedBox(width: 6),
                              Text(
                                "Search Result",
                                style: AppTextStyle.largeHeadingFranchise.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 6),
                              SvgPicture.asset(
                                "assets/icons/star_with_background_shade.svg",
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 0,
                          bottom: 0,
                          child: IconButton(
                            onPressed: () {
                              _hideKeyboard(); // Hide keyboard before navigating back
                              Get.back();
                            },
                            icon: Icon(
                              Icons.arrow_back_outlined,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                expandedHeight: 80,
              ),

              /// 🔍 SEARCH BOX
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: CustomSearchBar(
                    isEditable: true,
                    isTappable: false,
                    controller: _searchController,
                    focusNode: _searchFocusNode, // <-- Pass FocusNode
                    textInputAction: TextInputAction.search, // <-- Keyboard action button
                    onSubmitted: (value) {
                      // Handle search submission here
                      _hideKeyboard(); // Hide keyboard after search
                      // TODO: Add your search logic
                    },
                    onEditingComplete: _hideKeyboard, // Hide keyboard on "Done"
                  ),
                ),
              ),

              /// 🎯 RECOMMENDED SECTION HEADER
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/star_with_background_shade.svg",
                      ),
                      const SizedBox(width: 20),
                      Text(
                        "Recommended",
                        style: AppTextStyle.largeHeadingFranchise,
                      ),
                      const SizedBox(width: 20),
                      SvgPicture.asset(
                        "assets/icons/star_with_background_shade.svg",
                      ),
                    ],
                  ),
                ),
              ),

              /// 🎬 RECOMMENDED MOVIES GRID
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.58,
                  ),
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      return SearchCard(
                        addSvgPath: "assets/icons/bookmark_add.svg",
                        removeSvgPath: "assets/icons/bookmark_remove.svg",
                        title: 'Stranger Things',
                        series: 'TV Series',
                        years: '2016-2025',
                        duration: '1h',
                        rating: '8.5',
                        imagePath: 'assets/images/movie_poster.png',
                        onTap: () {
                          _hideKeyboard(); // Optional: hide keyboard when tapping a card
                        },
                      );
                    },
                    childCount: 6,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
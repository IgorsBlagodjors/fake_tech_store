import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fake_tech_store/design_system/app_colors.dart';
import 'package:fake_tech_store/design_system/text_style.dart';
import 'package:fake_tech_store/domain/electronics_class.dart';
import 'package:fake_tech_store/presentation/widgets/carousel_indicator.dart';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  final List<Electronics> items;
  const Carousel({super.key, required this.items});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final CarouselController _carouselController = CarouselController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: _carouselController,
          itemCount: widget.items.length,
          options: CarouselOptions(
            height: 110,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentPage = index;
              });
            },
            scrollDirection: Axis.horizontal,
          ),
          itemBuilder: (context, index, realIndex) {
            return Container(
              height: 110,
              decoration: BoxDecoration(
                color: AppColors.darkBlue,
                borderRadius: BorderRadius.circular(6),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 8),
                    blurRadius: 40,
                    color: Color.fromRGBO(0, 0, 0, 0.04),
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 36, left: 24),
                          child: Text(
                            widget.items[index].title,
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.body2BlackText.copyWith(
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4, left: 24),
                          child: Text(
                            '${widget.items[index].currency} ${widget.items[index].priceValue}',
                            style: AppStyles.font12Weight500.copyWith(
                              color: AppColors.lightBlue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 40,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 78,
                          width: 57,
                          child: Center(
                            child: CachedNetworkImage(
                              imageUrl: widget.items[index].imageUrl,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        const SizedBox(
          height: 12,
        ),
        CarouselIndicator(
          currentPage: _currentPage,
          enableShadow: true,
        ),
      ],
    );
  }
}

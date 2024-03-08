import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_it/common/widgets/common_widgets.dart';
import 'package:learn_it/pages/product/bloc/product_blocs.dart';
import 'package:learn_it/pages/product/bloc/product_states.dart';
import 'package:learn_it/pages/product/product_controller.dart';
import 'package:learn_it/pages/product/widgets/product_widgets.dart';
import 'package:readmore/readmore.dart';

import '../../common/values/constants.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late ProductController _productController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _productController = ProductController(context: context);
    _productController.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: buildProductAppBar(),
        body: BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
          // print(state.courseItem!.name.toString());
          return state.courseItem == null
              ? const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.black,
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 2,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(AppConstant.SERVER_UPLOAD +
                                state.courseItem!.thumbnail!),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 22.0.w, right: 22.0.w),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                buildText(
                                  text: state.courseItem!.name!,
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                Row(
                                  children: [
                                    buildText(
                                      text: '\$',
                                      color: Colors.green,
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    buildText(
                                      text: state.courseItem!.price!,
                                      color: Colors.green,
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            const ReadMoreText(
                              'Flutter is mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                              trimLines: 2,
                              colorClickableText: Colors.pink,
                              trimMode: TrimMode.Line,
                              trimCollapsedText: 'Show more',
                              trimExpandedText: 'Show less',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                              moreStyle: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                reuseableSizeText(
                                    text: 'XS',
                                    textColor: Colors.white,
                                    backgroundColor: Colors.black),
                                reuseableSizeText(
                                  text: 'S',
                                ),
                                reuseableSizeText(
                                  text: 'M',
                                ),
                                reuseableSizeText(
                                  text: 'L',
                                ),
                                reuseableSizeText(
                                  text: 'XL',
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                _productController.goBuy(
                                    context, state.courseItem!.id);
                              },
                              child: Container(
                                height: 50.h,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                        offset: const Offset(0, 1),
                                      )
                                    ]),
                                child: Center(
                                    child: buildText(
                                  text: 'Buy now',
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.normal,
                                )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
        }));
  }
}

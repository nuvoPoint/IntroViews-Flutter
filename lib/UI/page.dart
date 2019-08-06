import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';

/// This is the class which contains the Page UI.
class Page extends StatelessWidget {
  ///page details
  final PageViewModel pageViewModel;

  ///percent visible of page
  final double percentVisible;

  /// [MainAxisAligment]
  final MainAxisAlignment columnMainAxisAlignment;

  //Constructor
  Page({
    this.pageViewModel,
    this.percentVisible = 1.0,
    this.columnMainAxisAlignment = MainAxisAlignment.spaceAround,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: double.infinity,
      color: pageViewModel.pageColor,
      child: Opacity(
        //Opacity is used to create fade in effect
        opacity: percentVisible,
        child: OrientationBuilder(builder: (context, orientation) {
          return orientation == Orientation.portrait || pageViewModel.singleColumn
              ? _buildPortraitPage()
              : _buildLandscapePage();
        }), //OrientationBuilder
      ),
    );
  }

  /// when device is Portrait place title, image and body in a column
  Widget _buildPortraitPage() {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: columnMainAxisAlignment,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: _ImagePageTransform(
                percentVisible: percentVisible,
                pageViewModel: pageViewModel,
              ),
            ), //Transform
            Flexible(
              child: _BodyPageTransform(
                percentVisible: percentVisible,
                pageViewModel: pageViewModel,
              ),
            ), //Transform
          ],
        ),
      ),
    );
  }

  /// if Device is Landscape reorder with row and column
  Widget _buildLandscapePage() {
    return Center(
      child: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: _ImagePageTransform(
                percentVisible: percentVisible,
                pageViewModel: pageViewModel,
              ),
            ), //Transform
            Expanded(
              child: _BodyPageTransform(
                percentVisible: percentVisible,
                pageViewModel: pageViewModel,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Body for the Page.
class _BodyPageTransform extends StatelessWidget {
  final double percentVisible;

  final PageViewModel pageViewModel;

  const _BodyPageTransform({
    Key key,
    @required this.percentVisible,
    @required this.pageViewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      //Used for vertical transformation
      transform: Matrix4.translationValues(0.0, 30.0 * (1 - percentVisible), 0.0),
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 75.0,
          left: 10.0,
          right: 10.0,
        ),
        child: DefaultTextStyle.merge(
          style: pageViewModel.bodyTextStyle,
          textAlign: TextAlign.center,
          child: pageViewModel.body,
        ),
      ), //Padding
    );
  }
}

/// Main Image of the Page
class _ImagePageTransform extends StatelessWidget {
  final double percentVisible;

  final PageViewModel pageViewModel;

  const _ImagePageTransform({
    Key key,
    @required this.percentVisible,
    @required this.pageViewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      //Used for vertical transformation
      transform: Matrix4.translationValues(0.0, 50.0 * (1 - percentVisible), 0.0),
      child: Container(child: pageViewModel.mainImage), //Padding
    );
  }
}

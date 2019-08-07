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
      color: pageViewModel.pageColor,
      child: Opacity(
        opacity: percentVisible,
        child: LayoutBuilder(builder: (context, _) {
          // We use MediaQuery because OrientationBuilder is buggy.
          final portrait = MediaQuery.of(context).orientation == Orientation.portrait || pageViewModel.singleColumn;

          return portrait ? _buildPortraitPage() : _buildLandscapePage();
        }),
      ),
    );
  }

  Widget _buildPortraitPage() {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: columnMainAxisAlignment,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: _ImagePageTransform(
                  percentVisible: percentVisible,
                  pageViewModel: pageViewModel,
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 64),
                child: _BodyPageTransform(
                  percentVisible: percentVisible,
                  pageViewModel: pageViewModel,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLandscapePage() {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 64),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: _ImagePageTransform(
                  percentVisible: percentVisible,
                  pageViewModel: pageViewModel,
                ),
              ),
              Expanded(
                child: _BodyPageTransform(
                  percentVisible: percentVisible,
                  pageViewModel: pageViewModel,
                ),
              ),
            ],
          ),
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
          // bottom: 75.0,
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

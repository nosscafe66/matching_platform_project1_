// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:fluttery_dart2/layout.dart';
//
// @override
// Widget build(BuildContext context)
// {
//   final cardSet = StackedCardSet(
//     cards: [
//       StackedCard(
//         photos: [
//           'images/profile1.jpg',
//           'images/profile2.jpg',
//           'images/profile3.jpg',
//         ],
//         title: 'Your Name',
//         subTitle: 'And Biography',
//       ),
//       StackedCard(
//         photos: [
//           'images/profile4.jpg',
//           'images/profile5.jpg',
//           'images/profile6.jpg',
//         ],
//         title: '名前',
//         subTitle: '自己紹介',
//       ),
//       StackedCard(
//         photos: [
//           'images/profile7.jpg',
//           'images/profile8.jpg',
//           'images/profile9.jpg',
//         ],
//         title: 'Text here',
//         subTitle: 'Text here',
//       ),
//     ],
//   );
//
//   return StackedCardView(
//     cardSet: cardSet,
//   );
// }
//
// /// カードがスワイプされる際の方向を定義しておきます。
// enum SlideDirection {
//   Left,
//   Right,
//   Up,
// }
//
// class StackedCard extends ChangeNotifier
// {
//   final List<String> photos;
//   final String title;
//   final String subTitle;
//
//   SlideDirection direction;
//
//   StackedCard({
//     required this.photos,
//     required this.title,
//     required this.subTitle,
//   });
//
//   void slideLeft()
//   {
//     direction = SlideDirection.Left;
//     notifyListeners();
//   }
//
//   void slideRight()
//   {
//     direction = SlideDirection.Right;
//     notifyListeners();
//   }
//
//   void slideUp()
//   {
//     direction = SlideDirection.Up;
//     notifyListeners();
//   }
// }
//
// class StackedCardSet
// {
//   final List<StackedCard> cards;
//
//   int _currentCardIndex = 0;
//
//   /// `StackedCard`のリストを受け取ります
//   StackedCardSet({
//     required this.cards,
//   });
//
//   /// 現在参照しているカードのインデックス（先頭のカード）を変更します
//   /// 次のカードがあれば次へ、なければ先頭へ戻します
//   void incrementCardIndex()
//   {
//     _currentCardIndex = _currentCardIndex < cards.length - 1 ? _currentCardIndex + 1 : 0;
//   }
//
//   /// 先頭のカードを返却します
//   StackedCard getFirstCard()
//   {
//     return cards[_currentCardIndex];
//   }
//
//   /// 2番目のカードを返却します
//   StackedCard getNextCard()
//   {
//     return _currentCardIndex < cards.length - 1 ? cards[_currentCardIndex + 1] : cards[0];
//   }
//
//   /// 先頭のカードの識別子となる文字列を返却します
//   /// ここではtitleを返却するようにしています
//   String getKey()
//   {
//     return getFirstCard().title;
//   }
// }
//
// class StackedCardView extends StatefulWidget
// {
//   final StackedCardSet cardSet;
//
//   StackedCardView({
//     required this.cardSet,
//   });
//
//   @override
//   _StackedCardViewState createState() => _StackedCardViewState();
// }
//
// class _StackedCardViewState extends State<StackedCardView>
// {
//   /// 後ろに描写されるカードのスケールを操作するための変数
//   double _nextCardScale = 0.0;
//
//   late Key _frontItemKey;
//
//   @override
//   void initState()
//   {
//     super.initState();
//
//     _setItemKey();
//   }
//
//   @override
//   Widget build(BuildContext context)
//   {
//     return Column(
//       children: <Widget>[
//         Expanded(
//           child: getChild(),
//         )
//       ],
//     );
//   }
//
//   /// 先頭カードのWidgetに設定するキーを更新します
//   void _setItemKey()
//   {
//     _frontItemKey = Key(widget.cardSet.getKey());
//   }
//
//   /// 先頭のカードがスワイプされた際、移動距離に応じてバックに配置されているカードのスケールを変更します
//   void _onSlideUpdate(double distance)
//   {
//     setState(() {
//       _nextCardScale = 0.9 + (0.1 * (distance / 100.0)).clamp(0.0, 0.1);
//     });
//   }
//
//   /// スワイプ操作が完了した際に呼び出されます
//   void _onSlideComplete(SlideDirection direction)
//   {
//     // TODO: アクションに応じて適宜実装
//     switch (direction) {
//       case SlideDirection.Left:
//       // nope
//         break;
//       case SlideDirection.Right:
//       // like
//         break;
//       case SlideDirection.Up:
//       // super like
//         break;
//     }
//
//     /// カードのインデックスを次の番号へ変更
//     /// 確実に再レンダリングさせるため`Key`を更新して状態変更を通知
//     setState(() {
//       widget.cardSet.incrementCardIndex();
//       _setItemKey();
//     });
//   }
//
//   /// 後ろのカード（2枚目）を生成します
//   /// 後ろのカードはドラッグが出来ないように制御します
//   Widget _buildBackItem()
//   {
//     return StackedCardViewItem(
//         isDraggable: false,
//         card: widget.cardSet.getNextCard(),
//         scale: _nextCardScale
//     );
//   }
//
//   /// 先頭のカード（1枚目）を生成します
//   /// Widgetが再レンダリングされる際に確実に更新されるよう、`key`を渡します
//   Widget _buildFrontItem()
//   {
//     return StackedCardViewItem(
//       key: _frontItemKey,
//       onSlideUpdate: _onSlideUpdate,
//       onSlideComplete: _onSlideComplete,
//       card: widget.cardSet.getFirstCard(),
//     );
//   }
//
//   /// 先頭のカード（1枚目）とその背後のカード（2枚目）を生成します
//   Widget getChild()
//   {
//     return Stack(
//       children: <Widget>[
//         _buildBackItem(),
//         _buildFrontItem(),
//       ],
//     );
//   }
// }
//
// class StackedCardViewItem extends StatefulWidget
// {
//   final bool isDraggable;
//   final StackedCard card;
//   final Function(double) onSlideUpdate;
//   final Function(SlideDirection) onSlideComplete;
//   final double scale;
//
//   StackedCardViewItem({
//     required Key key,
//     this.isDraggable: true,
//     required this.card,
//     required this.onSlideUpdate,
//     required this.onSlideComplete,
//     this.scale: 1.0,
//   }) : super(key: key);
//
//   @override
//   _StackedCardViewItemState createState() => _StackedCardViewItemState();
// }
//
// class _StackedCardViewItemState extends State<StackedCardViewItem> with TickerProviderStateMixin
// {
//   GlobalKey itemKey = GlobalKey(debugLabel: 'item_key');
//
//   /// カード（以下、コンテナと呼びます）の現在位置を保持するための変数
//   Offset containerOffset = const Offset(0.0, 0.0);
//   late Offset dragStartPosition;
//   late Offset dragCurrentPosition;
//   late Offset slideBackStartPosition;
//
//   late AnimationController slideBackAnimation;
//   late AnimationController slideOutAnimation;
//   late Tween<Offset> slideOutTween;
//   late SlideDirection slideOutDirection;
//
//   @override
//   void initState()
//   {
//     super.initState();
//
//     /// コンテナのドラッグを途中で解除した場合のアニメーション処理を設定します
//     slideBackAnimation = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1000),
//     )
//     /// `slideBackAnimation.forward()`がコールされた際に実行されるリスナーを設定します
//       ..addListener(() => setState(() {
//         /// コンテナのドラッグが解除された座標(slideBackStart)から 初期位置(Offset(0, 0))までの座標を Curves.elasticOut（振動曲線） にて補完します
//         containerOffset = Offset.lerp(
//             slideBackStartPosition,
//             const Offset(0.0, 0.0),
//             Curves.elasticOut.transform(slideBackAnimation.value)
//         )!;
//
//         /// リスナーが設定されている場合、移動した距離（対角距離）を渡して実行します
//         if (widget.onSlideUpdate != null) {
//           widget.onSlideUpdate(containerOffset.distance);
//         }
//       }))
//     /// アニメーションの実行状態を受信するリスナーを設定します
//       ..addStatusListener((AnimationStatus status) {
//         /// アニメーションの完了通知を受信した際に実行します
//         if (status == AnimationStatus.completed) {
//           setState(() {
//             /// 各種ポジション情報をクリアします
//             /// ドラッグ開始位置をクリアします
//             dragStartPosition != null;
//             /// ドラッグ中の位置をクリアします
//             dragCurrentPosition != null;
//             /// ドラッグが解除された座標をクリアします
//             slideBackStartPosition != null;
//           });
//         }
//       });
//
//     /// 一定距離コンテナがドラッグされた際のスライドアウト用のアニメーション処理を設定します
//     slideOutAnimation = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 500),
//     )
//     /// `slideOutAnimation.forward()`がコールされた際に実行されるリスナーを設定します
//       ..addListener(() => setState(() {
//         /// 時間経過とともに変化するコンテナのポジション(Offset)をslideOutTweenを用いて計算し更新します
//         containerOffset = slideOutTween.evaluate(slideOutAnimation);
//
//         /// リスナーが設定されている場合、移動した距離（対角距離）を渡して実行します
//         if (widget.onSlideUpdate != null) {
//           widget.onSlideUpdate(containerOffset.distance);
//         }
//       }))
//     /// アニメーションの実行状態を受信するリスナーを設定します
//       ..addStatusListener((AnimationStatus status) {
//         /// アニメーションの完了通知を受信した際に実行します
//         if (status == AnimationStatus.completed) {
//           setState(() {
//             /// 各種ポジション情報をクリアします
//             /// ドラッグ開始位置をクリアします
//             dragStartPosition != null;
//             /// ドラッグ中の位置をクリアします
//             dragCurrentPosition != null;
//             /// スライドアウトアニメーションの設定情報（軌道、距離等）をクリアします
//             slideOutTween != null;
//
//             /// リスナーが設定されている場合、スライドされた方向を渡して実行します
//             if (widget.onSlideComplete != null) {
//               widget.onSlideComplete(slideOutDirection);
//             }
//           });
//         }
//       });
//
//     if (widget.isDraggable) {
//       widget.card.addListener(_slideFromExternal);
//     }
//   }
//
//   void _slideFromExternal()
//   {
//     switch (widget.card.direction) {
//       case SlideDirection.Left:
//         _slideLeft();
//         break;
//       case SlideDirection.Right:
//         _slideRight();
//         break;
//       case SlideDirection.Up:
//         _slideUp();
//         break;
//     }
//   }
//
//   /// 左にスワイプされた際の処理です
//   void _slideLeft()
//   {
//     if (slideOutAnimation.isAnimating) {
//       return;
//     }
//
//     final screenSize = MediaQuery.of(context).size;
//     dragStartPosition = _randomDragStartPosition();
//     slideOutTween = Tween(begin: const Offset(0.0, 0.0), end: Offset(screenSize.width * -2, 0.0));
//     slideOutAnimation.forward(from: 0.0);
//     slideOutDirection = SlideDirection.Left;
//   }
//
//   /// 右にスワイプされた際の処理です
//   void _slideRight()
//   {
//     if (slideOutAnimation.isAnimating) {
//       return;
//     }
//
//     final screenSize = MediaQuery.of(context).size;
//     dragStartPosition = _randomDragStartPosition();
//     slideOutTween = Tween(begin: const Offset(0.0, 0.0), end: Offset(screenSize.width * 2, 0.0));
//     slideOutAnimation.forward(from: 0.0);
//     slideOutDirection = SlideDirection.Right;
//   }
//
//   /// 上にスワイプされた際の処理です
//   void _slideUp()
//   {
//     if (slideOutAnimation.isAnimating) {
//       return;
//     }
//
//     final screenSize = MediaQuery.of(context).size;
//     dragStartPosition = _randomDragStartPosition();
//     slideOutTween = Tween(begin: const Offset(0.0, 0.0), end: Offset(0.0, screenSize.height * -2));
//     slideOutAnimation.forward(from: 0.0);
//     slideOutDirection = SlideDirection.Up;
//   }
//
//   Offset _randomDragStartPosition()
//   {
//     final screenSize = MediaQuery.of(context).size;
//
//     final itemContext = itemKey.currentContext;
//     final itemTopLeft = (itemContext?.findRenderObject() as RenderBox).localToGlobal(const Offset(0.0, 0.0));
//     final dragStartY = screenSize.height * (new Random().nextDouble() < 0.5 ? 0.25 : 0.75) + itemTopLeft.dy;
//     final dragStartX = screenSize.width / 2 + itemTopLeft.dx;
//
//     return Offset(dragStartX, dragStartY);
//   }
//
//   @override
//   void dispose()
//   {
//     slideBackAnimation.dispose();
//     slideOutAnimation.dispose();
//
//     widget.card.removeListener(_slideFromExternal);
//
//     super.dispose();
//   }
//
//   /// ドラッグが開始された際の処理です
//   /// ドラッグが開始された画面上の絶対位置(x, y)を保持します
//   void _onPanStart(DragStartDetails details)
//   {
//     if (!widget.isDraggable) {
//       return;
//     }
//
//     /// details.globalPosition はデバイス上の絶対位置です
//     dragStartPosition = details.globalPosition;
//
//     if (slideBackAnimation.isAnimating) {
//       slideBackAnimation.stop();
//     }
//   }
//
//   /// ドラッグ中の処理です
//   /// ドラッグ開始位置から現在のドラッグ位置を減算し、ドラッグ開始位置からの移動量を計算します
//   /// setState にて常に値を更新します
//   void _onPanUpdate(DragUpdateDetails details)
//   {
//     if (!widget.isDraggable) {
//       return;
//     }
//
//     setState(() {
//       /// details.globalPosition はデバイス上の絶対位置です
//       dragCurrentPosition = details.globalPosition;
//       /// 現在のドラッグ位置からドラッグ開始位置を減算して、コンテナの移動量を計算します
//       containerOffset = dragCurrentPosition - dragStartPosition;
//
//       /// リスナーが設定されている場合、移動した距離（対角距離）を渡して実行します
//       if (widget.onSlideUpdate != null) {
//         widget.onSlideUpdate(containerOffset.distance);
//       }
//     });
//   }
//
//   /// ドラッグの終了処理です
//   /// コンテナのドラッグが解除された際に実行します
//   void _onPanEnd(DragEndDetails details)
//   {
//     if (!widget.isDraggable) {
//       return;
//     }
//
//     /// ドラッグされた方向をベクトル成分(x, y)として計算します
//     /// Offset.distance は(0, 0)から現在位置の対角距離です
//     /// Offset(xの移動量, yの移動量) / 移動した距離（対角距離）、なので
//     /// 右下ベクトルの場合、xy共に正    (e.g. (0.5, 0.5)
//     /// 右上ベクトルの場合、xが正、yが負 (e.g. (0.5, -0.5)
//     /// 左下ベクトルの場合、xが負、yが正 (e.g. (-0.5, 0.5)
//     /// 左上ベクトルの場合、xy共に負    (e.g. (-0.5, -0.5)
//     final dragVector = containerOffset / containerOffset.distance;
//
//     /// コンテナサイズと移動量を用いてどのエリアにドラッグされたかを判定します
//     /// xの移動量(cardOffset.dx)がコンテナサイズの45%を超えたら右、-45%を下回ったら左
//     /// yの移動量(cardOffset.dy)がコンテナサイズの-40%を下回ったら上
//     final isInLeftRegion = (containerOffset.dx / context.size!.width) < -0.45;
//     final isInRightRegion = (containerOffset.dx / context.size!.width) > 0.45;
//     final isInTopRegion = (containerOffset.dy / context.size!.height) < -0.40;
//
//     setState(() {
//       if (isInLeftRegion || isInRightRegion) {
//         /// 左か右エリアの場合の処理です
//         /// Tweenの開始位置は現在のコンテナのドラッグ位置を設定します
//         /// 終了位置は、コンテナ幅 x 2 * ドラッグされたベクトル成分で算出します（方向ベクトルを増幅させる形）
//         /// ドラッグした方向（軌道）を維持し、その移動量を加味した点を終点に置くことで、コンテナを投げ飛ばす感覚を表現します
//         slideOutTween = Tween(begin: containerOffset, end: dragVector * (2 * context.size!.width));
//
//         /// スライドアウトアニメーションを先頭フレームから実行します
//         slideOutAnimation.forward(from: 0.0);
//
//         /// 最終的にスライドされた方向を通知用にセットします
//         slideOutDirection = isInLeftRegion ? SlideDirection.Left : SlideDirection.Right;
//
//       } else if (isInTopRegion) {
//         /// 上エリアの場合の処理です
//         /// 終了位置は、コンテナの高さ x 2 * ドラッグされたベクトル成分で算出します
//         slideOutTween = Tween(begin: containerOffset, end: dragVector * (2 * context.size!.height));
//
//         /// スライドアウトアニメーションを先頭フレームから実行します
//         slideOutAnimation.forward(from: 0.0);
//
//         /// 最終的にスライドされた方向を通知用にセットします
//         slideOutDirection = SlideDirection.Up;
//
//       } else {
//         /// どのエリアにも該当しない場合の処理です
//         /// スライドバックアニメーションの開始点を現在のドラッグ位置に設定します
//         slideBackStartPosition = containerOffset;
//
//         /// スライドバックアニメーションを先頭フレームから実行します
//         slideBackAnimation.forward(from: 0.0);
//       }
//     });
//   }
//
//   /// ドラッグした際の回転角を計算します
//   double _rotation(Rect dragBounds)
//   {
//     if (dragStartPosition != null) {
//       /// コンテナの中央より上の場合は時計回り(1)、下の場合は半時計回り(-1)に設定します
//       final rotationCornerMultiplier = dragStartPosition.dy >= dragBounds.top + (dragBounds.height / 2) ? -1 : 1;
//
//       /// ドラッグされた移動量に応じて回転角を増減させます
//       /// 最大で pi / 8 = 22.5 radian の傾きを返却します
//       final angle = (pi / 8) * (containerOffset.dx / dragBounds.width);
//
//       /// 回転角を返却します
//       return angle * rotationCornerMultiplier;
//     } else {
//       /// ドラッグが開始されていない場合は 0 radian を返却します
//       return 0.0;
//     }
//   }
//
//   /// ドラッグした際の回転角の起点となるポジションを計算します
//   /// ドラッグが開始されていない場合は x, y 共に0を返却します
//   /// ドラッグ開始位置からドラッグ可能エリア左上の位置を減算し、ドラッグ可能エリア内におけるオフセットを計算します
//   Offset _rotationOrigin(Rect dragBounds)
//   {
//     if (dragStartPosition != null) {
//       return dragStartPosition - dragBounds.topLeft;
//     } else {
//       return const Offset(0.0, 0.0);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context)
//   {
//     return getChild();
//   }
//
//   Widget getChild()
//   {
//     return AnchoredOverlay(
//       showOverlay: true,
//       child: Center(),
//       overlayBuilder: (BuildContext context, Rect anchorBounds, Offset anchor) {
//         return CenterAbout(
//           position: anchor,
//           child: Transform(
//             transform:
//             /// xy 軸の移動を設定します
//             Matrix4.translationValues(containerOffset.dx, containerOffset.dy, 0.0)
//             /// z 軸方向の回転を制御します
//               ..rotateZ(_rotation(anchorBounds))
//             /// コンテナのスケールを設定します
//               ..scale(widget.scale, widget.scale),
//             /// Transform 処理の原点となる座標を設定します
//             origin: _rotationOrigin(anchorBounds),
//             /// scale が 1.0 でない場合のみ（背後のカードのみ）、 alignment を center に設定します
//             alignment: widget.scale != 1.0 ? Alignment.center : null,
//             child: Container(
//               key: itemKey,
//               width: anchorBounds.width,
//               height: anchorBounds.height,
//               padding: const EdgeInsets.only(top: 0, left: 16, right: 16, bottom: 8),
//               child: GestureDetector(
//                 onPanStart: _onPanStart,
//                 onPanUpdate: _onPanUpdate,
//                 onPanEnd: _onPanEnd,
//                 child: StackedCardViewItemContent(
//                   card: widget.card,
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
//
// class StackedCardViewItemContent extends StatelessWidget
// {
//   final StackedCard card;
//
//   StackedCardViewItemContent({
//     Key? key,
//     required this.card,
//   }): super(key: key);
//
//   @override
//   Widget build(BuildContext context)
//   {
//     return getChild();
//   }
//
//   Widget getChild()
//   {
//     return Container(
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10.0),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black12,
//               blurRadius: 5.0,
//               spreadRadius: 2.0,
//             )
//           ]
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(10.0),
//         child: Material(
//           child: Stack(
//             fit: StackFit.expand,
//             children: <Widget>[
//               _buildBackground(),
//               _buildProfile(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildBackground()
//   {
//     /// プロフィール写真の表示、切り替え動作に関しては`PhotoView`クラスへ委託します
//     return PhotoView(
//       photoAssetPaths: card.photos,
//       visiblePhotoIndex: 0,
//     );
//   }
//
//   /// 名前、プロフィール文の配置を行います
//   Widget _buildProfile()
//   {
//     return Positioned(
//       left: 0.0,
//       right: 0.0,
//       bottom: 0.0,
//       child: Container(
//         decoration: BoxDecoration(
//             gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [
//                   Colors.transparent,
//                   Colors.black.withOpacity(0.8),
//                 ]
//             )
//         ),
//         padding: const EdgeInsets.all(24.0),
//         child: Row(
//           mainAxisSize: MainAxisSize.max,
//           children: <Widget>[
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   Text(
//                       card.title,
//                       style: TextStyle(color: Colors.white, fontSize: 24.0)
//                   ),
//                   Text(
//                       card.subTitle,
//                       style: TextStyle(color: Colors.white, fontSize: 18.0)
//                   )
//                 ],
//               ),
//             ),
//             Icon(
//               Icons.info,
//               color: Colors.white,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class PhotoView extends StatefulWidget
// {
//   final List<String> photoAssetPaths;
//   final int visiblePhotoIndex;
//
//   PhotoView({
//     required this.photoAssetPaths,
//     required this.visiblePhotoIndex
//   });
//
//   @override
//   _PhotoViewState createState() => _PhotoViewState();
// }
//
// class _PhotoViewState extends State<PhotoView>
// {
//   /// 現在表示している写真のインデックスを保持する変数
//   late int visiblePhotoIndex;
//
//   @override
//   void initState()
//   {
//     super.initState();
//
//     /// 初期表示される写真をセットします
//     visiblePhotoIndex = widget.visiblePhotoIndex;
//   }
//
//   /// 前の写真を表示します
//   void _prevImage()
//   {
//     setState(() {
//       visiblePhotoIndex = visiblePhotoIndex > 0
//           ? visiblePhotoIndex - 1
//           : widget.photoAssetPaths.length - 1;
//     });
//   }
//
//   /// 次の写真を表示します
//   void _nextImage()
//   {
//     setState(() {
//       visiblePhotoIndex = visiblePhotoIndex < widget.photoAssetPaths.length - 1
//           ? visiblePhotoIndex + 1
//           : 0;
//     });
//   }
//
//   /// 設定されている画像インデックスを元に`Image`ウィジェットを生成します
//   Widget _buildBackground()
//   {
//     return Image.asset(
//       widget.photoAssetPaths[visiblePhotoIndex],
//       fit: BoxFit.cover,
//     );
//   }
//
//   /// 現在表示している写真のインデックスを表すためのインジケーターUIを生成します
//   /// 具体的なUIの生成処理に関しては更に`PhotoIndicator`に委託します
//   Widget _buildIndicator()
//   {
//     return Positioned(
//       top: 0.0,
//       left: 0.0,
//       right: 0.0,
//       child: PhotoIndicator(
//         photoCount: widget.photoAssetPaths.length,
//         visiblePhotoIndex: visiblePhotoIndex,
//       ),
//     );
//   }
//
//   /// 写真エリア左、右を50%ずつ覆う透明な操作ボックスを生成します
//   Widget _buildControls()
//   {
//     return Stack(
//       fit: StackFit.expand,
//       children: <Widget>[
//         GestureDetector(
//           onTap: _prevImage,
//           child: FractionallySizedBox(
//             widthFactor: 0.5,
//             heightFactor: 1.0,
//             alignment: Alignment.topLeft,
//             child: Container(
//               color: Colors.transparent,
//             ),
//           ),
//         ),
//         GestureDetector(
//           onTap: _nextImage,
//           child: FractionallySizedBox(
//             widthFactor: 0.5,
//             heightFactor: 1.0,
//             alignment: Alignment.topRight,
//             child: Container(
//               color: Colors.transparent,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   @override
//   Widget build(BuildContext context)
//   {
//     /// 画像の表示速度を短縮させるために画像をプリキャッシュします
//     widget.photoAssetPaths.forEach((path) {
//       precacheImage(AssetImage(path), context);
//     });
//
//     return Stack(
//       fit: StackFit.expand,
//       children: <Widget>[
//         _buildBackground(),
//         _buildIndicator(),
//         _buildControls(),
//       ],
//     );
//   }
// }
//
// class PhotoIndicator extends StatelessWidget
// {
//   final int photoCount;
//   final int visiblePhotoIndex;
//
//   PhotoIndicator({
//     required this.visiblePhotoIndex,
//     required this.photoCount
//   });
//
//   /// 非アクティブ時のインジケーターUIを生成します
//   Widget _buildInactiveIndicator()
//   {
//     return Expanded(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 2.0),
//         child: Container(
//           height: 3.0,
//           decoration: BoxDecoration(
//               color: Colors.black38,
//               borderRadius: BorderRadius.circular(2.5)
//           ),
//         ),
//       ),
//     );
//   }
//
//   /// アクティブ時のインジケーターUIを生成します
//   Widget _buildActiveIndicator()
//   {
//     return Expanded(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 2.0),
//         child: Container(
//           height: 3.0,
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(2.5),
//               boxShadow: [
//                 BoxShadow(
//                     color: Colors.black12,
//                     blurRadius: 2.0,
//                     spreadRadius: 0.0,
//                     offset: const Offset(0.0, 1.0)
//                 )
//               ]
//           ),
//         ),
//       ),
//     );
//   }
//
//   List<Widget> _buildIndicators()
//   {
//     final List<Widget> indicators = [];
//
//     for (int i = 0; i < photoCount; i++) {
//       indicators.add(i == visiblePhotoIndex ? _buildActiveIndicator() : _buildInactiveIndicator());
//     }
//
//     return indicators;
//   }
//
//   @override
//   Widget build(BuildContext context)
//   {
//     return Padding(
//       padding: const EdgeInsets.all(0.0),
//       child: Row(
//         children: _buildIndicators(),
//       ),
//     );
//   }
// }
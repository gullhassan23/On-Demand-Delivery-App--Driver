import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'chat_messege_service.dart';
import 'chatspersons.dart';
import 'contact_model.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class UserChatListScreen extends StatelessWidget {
  ChatMessageService chatMessageService = ChatMessageService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        "Chats",
        textColor: white,
        showBack: Navigator.canPop(context),
        elevation: 3.0,
        backWidget: BackWidget(),
        color: context.primaryColor,
      ),
      body: StreamBuilder(
        stream: chatMessageService
            .fetchChatListQuery(userId: _auth.currentUser!.uid)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoaderWidget(); // Show loader while fetching data
          } else if (snapshot.hasError) {
            return BackgroundComponent(); // Show error component if there's an error
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return BackgroundComponent(); // Show empty component if no data
          } else {
            // print("contact ${snapshot.data!.docs.length}");
            // Process the data retrieved
            return ListView.builder(
              padding: EdgeInsets.only(left: 0, top: 8, right: 0, bottom: 0),
              itemCount: snapshot.data!.docs.length,
              
              itemBuilder: (BuildContext context, int index) {

                ContactModel contact = ContactModel.fromJson(
                    snapshot.data!.docs[index].data() as Map<String, dynamic>);

            // print("contact uid ${contact.uid!}");

                return UserItemBuilder(userUid: contact.uid.validate());
              },
             
            );
          }
        },
      ),

      //  PaginateFirestore(
      //   itemBuilder: (context, snap, index) {
      //     ContactModel contact =
      //         ContactModel.fromJson(snap[index].data() as Map<String, dynamic>);
      //     return UserItemBuilder(userUid: contact.uid.validate());
      //   },
      //   options: GetOptions(source: Source.serverAndCache),
      //   isLive: false,
      //   padding: EdgeInsets.only(left: 0, top: 8, right: 0, bottom: 0),
      //   itemsPerPage: 10,
      //   separator: Divider(height: 0, indent: 82),
      //   shrinkWrap: true,
      //   query: chatMessageService.fetchChatListQuery(
      //       userId: _auth.currentUser!.uid),
      //   onEmpty: BackgroundComponent(),
      //   initialLoader: LoaderWidget(),
      //   itemBuilderType: PaginateBuilderType.listView,
      //   onError: (e) => BackgroundComponent(),
      // ),
    );
  }
}

class BackgroundComponent extends StatelessWidget {
  final String? image;
  final String? text;
  final double? size;

  BackgroundComponent({this.image, this.text, this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height(),
      width: context.width(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image.asset(
          //   image ?? "No Found",
          //   height: size ?? 100,
          // ),
          30.height,
          Text(text ?? "No Data Found",
              style: boldTextStyle(size: 20), textAlign: TextAlign.center),
        ],
      ),
    ).center();
  }
}

class LoaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpinKitChasingDots(color: Colors.pink);
  }
}

class SpinKitChasingDots extends StatefulWidget {
  const SpinKitChasingDots({
    Key? key,
    this.color,
    this.size = 50.0,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 2000),
  })  : assert(
            !(itemBuilder is IndexedWidgetBuilder && color is Color) &&
                !(itemBuilder == null && color == null),
            'You should specify either a itemBuilder or a color'),
        super(key: key);

  final Color? color;
  final double size;
  final IndexedWidgetBuilder? itemBuilder;
  final Duration duration;

  @override
  _SpinKitChasingDotsState createState() => _SpinKitChasingDotsState();
}

class _SpinKitChasingDotsState extends State<SpinKitChasingDots>
    with TickerProviderStateMixin {
  late AnimationController _scaleCtrl;
  late AnimationController _rotateCtrl;
  late Animation<double> _scale;
  late Animation<double> _rotate;

  @override
  void initState() {
    super.initState();

    _scaleCtrl = AnimationController(vsync: this, duration: widget.duration)
      ..addListener(() => setState(() {}))
      ..repeat(reverse: true);
    _scale = Tween(begin: -1.0, end: 1.0)
        .animate(CurvedAnimation(parent: _scaleCtrl, curve: Curves.easeInOut));

    _rotateCtrl = AnimationController(vsync: this, duration: widget.duration)
      ..addListener(() => setState(() {}))
      ..repeat();
    _rotate = Tween(begin: 0.0, end: 360.0)
        .animate(CurvedAnimation(parent: _rotateCtrl, curve: Curves.linear));
  }

  @override
  void dispose() {
    _scaleCtrl.dispose();
    _rotateCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.fromSize(
        size: Size.square(widget.size),
        child: Transform.rotate(
          angle: _rotate.value * 0.0174533,
          child: Stack(
            children: <Widget>[
              Positioned(top: 0.0, child: _circle(1.0 - _scale.value.abs(), 0)),
              Positioned(bottom: 0.0, child: _circle(_scale.value.abs(), 1)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _circle(double scale, int index) {
    return Transform.scale(
      scale: scale,
      child: SizedBox.fromSize(
        size: Size.square(widget.size * 0.6),
        child: widget.itemBuilder != null
            ? widget.itemBuilder!(context, index)
            : DecoratedBox(
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: widget.color)),
      ),
    );
  }
}

class BackWidget extends StatelessWidget {
  final Color? color;
  final VoidCallback? onPressed;
  final double? iconSize;

  BackWidget({this.color, this.onPressed, this.iconSize});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (onPressed != null) {
          onPressed?.call();
        } else {
          pop();
        }
      },
      alignment: Alignment.center,
      icon: Icon(Icons.arrow_back_ios,
          color: color ?? Colors.white, size: iconSize ?? 20),
    );
  }
}

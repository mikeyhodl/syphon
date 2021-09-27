import 'dart:io';
import 'dart:ui' as ui show Codec, FrameInfo, Image;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/svg.dart';
import 'package:redux/redux.dart';
import 'package:syphon/global/assets.dart';
import 'package:syphon/global/dimensions.dart';
import 'package:syphon/global/print.dart';
import 'package:syphon/global/strings.dart';
import 'package:syphon/global/values.dart';

import 'package:syphon/store/index.dart';
import 'package:syphon/store/rooms/room/model.dart';
import 'package:syphon/store/rooms/selectors.dart';
import 'package:syphon/views/widgets/appbars/appbar-normal.dart';
import 'package:syphon/views/widgets/lifecycle.dart';

class MediaPreviewArguments {
  final String? roomId;
  final List<File> mediaList;
  final Function onConfirmSend;

  MediaPreviewArguments({
    this.roomId,
    this.mediaList = const [],
    required this.onConfirmSend,
  });
}

class MediaPreviewScreen extends StatefulWidget {
  const MediaPreviewScreen({
    Key? key,
  }) : super(key: key);

  @override
  MediaPreviewState createState() => MediaPreviewState();
}

class MediaPreviewState extends State<MediaPreviewScreen> with Lifecycle<MediaPreviewScreen> {
  MediaPreviewState() : super();

  File? currentImage;

  @override
  onMounted() async {
    final params = ModalRoute.of(context)?.settings.arguments as MediaPreviewArguments;

    try {
      final firstImage = params.mediaList.first;

      setState(() {
        currentImage = firstImage;
      });
    } catch (error) {
      printError(error.toString());
    }
  }

  @protected
  onConfirm(_Props props) async {
    final params = ModalRoute.of(context)?.settings.arguments as MediaPreviewArguments;

    await params.onConfirmSend();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, _Props>(
        distinct: true,
        converter: (Store<AppState> store) => _Props.mapStateToProps(
          store,
          (ModalRoute.of(context)?.settings.arguments as MediaPreviewArguments).roomId,
        ),
        builder: (context, props) {
          return Scaffold(
            appBar: AppBarNormal(
              title: 'Draft Preview',
              actions: [
                IconButton(
                  icon: Icon(Icons.close, color: Colors.white),
                  onPressed: () => Navigator.pop(context, false),
                  tooltip: Strings.buttonCancel.capitalize(),
                ),
              ],
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                // ignore: prefer_if_elements_to_conditional_expressions
                currentImage == null
                    ? Container()
                    : Image.file(
                        currentImage!,
                        fit: BoxFit.contain,
                      ),
                Padding(
                  padding: EdgeInsets.only(top: 24, right: 12, bottom: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: Text(
                          'Send Media Message',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle2?.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                      ),
                      Container(
                        width: Dimensions.buttonSendSize * 1.15,
                        height: Dimensions.buttonSendSize * 1.15,
                        padding: EdgeInsets.symmetric(vertical: 4),
                        child: Semantics(
                          button: true,
                          enabled: true,
                          label: Strings.labelSendEncrypted,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(48),
                            onTap: () => onConfirm(props),
                            child: CircleAvatar(
                              backgroundColor: Theme.of(context).primaryColor,
                              child: Container(
                                margin: EdgeInsets.only(left: 2, top: 3),
                                child: SvgPicture.asset(
                                  Assets.iconSendLockSolidBeing,
                                  color: Colors.white,
                                  semanticsLabel: Strings.labelSendEncrypted,
                                ),
                              ),
                            ),
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
      );
}

class _Props extends Equatable {
  final Room room;

  const _Props({
    required this.room,
  });

  @override
  List<Object> get props => [
        room,
      ];

  static _Props mapStateToProps(Store<AppState> store, String? roomId) => _Props(
        room: selectRoom(id: roomId, state: store.state),
      );
}

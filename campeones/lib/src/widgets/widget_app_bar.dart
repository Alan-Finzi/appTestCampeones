import 'package:campeones/src/widgets/widget_text_scale_factor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class CampeonesAppBar extends StatefulWidget {

    final BuildContext context;
    final String title;
    final String fontFamily;
    final bool showNotifications;
    final Widget leading;
    final List<Widget> actionsAvailables;
    final bool showHelp;
    final Color color;
    final bool shadow;

    CampeonesAppBar({required this.context,  required this.title, required this.actionsAvailables, required this.showNotifications, required this.fontFamily, required this.leading, required this.showHelp, required this.color, this.shadow = true});

    @override
    _CampeonesAppBarState createState() => _CampeonesAppBarState();
}

class _CampeonesAppBarState extends State<CampeonesAppBar> {
    @override
    Widget build(BuildContext context) {
        return AppBar(
            title: Text(widget.title, style: TextStyle(fontFamily: widget.fontFamily, fontSize: 20.0)),
            backgroundColor: widget.color,
            centerTitle: false,
            actions: _actionsAvailables(showNotifications: widget.showNotifications, actions: widget.actionsAvailables, showHelp: widget.showHelp),
            leading: widget.leading,
            shadowColor: widget.shadow ? Colors.black : Colors.transparent,
        );
    }

    List<Widget> _actionsAvailables({required bool showNotifications, required List<Widget> actions, required bool showHelp} ){
        if (showNotifications){
            if(showHelp==true){
                actions.add(_help());
            }
            actions.add(_notifications(actions));
        } return actions;
    }

    GestureDetector _notifications(List<Widget> actions){
        return GestureDetector(
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
                child: Stack(
                    children: <Widget>[
                        Icon(Icons.notifications),
                      Container()
                    ],
                ),
            ),
            onTap: () async {
                actions.clear();
                setState(() {});
            },
        );
    }

    Widget _help(){
        return GestureDetector(
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Icon(Icons.help_outline),
            ),
            //onTap: (){
            // },
        );
    }



}




Widget campeonesAppBar({required BuildContext context, required bool showHelp, required String title, required bool showNotifications, required String fontFamily,  required List<Widget> actionsAvailables, required Widget leading, required Color color, bool shadow = false}){
    if (fontFamily.isEmpty){ fontFamily = "Poppins";}
    return PreferredSize(
        preferredSize: Size.fromHeight(60.0), // here the desired height
        child: TextScaleFactorClamper(
            child: CampeonesAppBar(
                context: context,
                title: title,
                color: color,
                actionsAvailables: actionsAvailables,
                fontFamily: fontFamily,
                showNotifications: showNotifications,
                leading: leading,
                showHelp: showHelp ,
                shadow: shadow,
            ),
        )
    );
}





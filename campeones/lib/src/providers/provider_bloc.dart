import 'package:flutter/material.dart';
import 'package:campeones/src/bloc/blocs.dart';
export 'package:campeones/src/bloc/blocs.dart';




class ProviderBloc extends InheritedWidget{
    final loginBloc = Bloc();

    ProviderBloc({required Key key, required Widget child}) : super (key : key,child:child);

    @override
    bool updateShouldNotify(InheritedWidget oldWidget)=>true;

    static Bloc of ( BuildContext context ){
        return context.dependOnInheritedWidgetOfExactType<ProviderBloc>()!.loginBloc;
    }

}
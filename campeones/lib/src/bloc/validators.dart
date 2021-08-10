import 'dart:async';



class Validators{

    final validatorsDate = StreamTransformer<Map<String,dynamic>, Map<String,dynamic>>.fromHandlers(
        handleData: (date,sink){
            // ignore: unnecessary_null_comparison
            if(date  != null ){
                sink.add(date);
            }else{
                sink.addError("error");
            }
        }
    );


}



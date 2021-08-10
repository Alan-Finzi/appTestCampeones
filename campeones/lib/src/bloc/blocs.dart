
import 'package:campeones/src/bloc/validators.dart';



class Bloc with Validators{
   // final _priceController           = BehaviorSubject<double>();


    // obtener el ultimo valor ingresado
   // Map<String,dynamic> get date         =>_dateController.value;


    //get value to Stream
    //Stream<Map<String,dynamic>> get dateStream                   => _dateController.stream.transform( validatorsDate);



   // Stream<bool> get  formValidStreamSigup                  => Rx.combineLatest9(cuitStream,comboBoxStream, firstNameStream, lastNameStream,cityStream,addressStream,birthdateStream,emaiStream,passwordStream,(a,d,p,e,h,b,c,f,g) => true);

    //insert value to Stream
   // Function(Map<String,dynamic>) get changeDate                         => _dateController.sink.add;


    dispose(){
       // _priceController?.close();
    }
}

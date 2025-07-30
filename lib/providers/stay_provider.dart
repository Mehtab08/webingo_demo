import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webingo_demo/model/stay_model.dart';
import 'package:webingo_demo/services/stay_service.dart';

final stayServiceProvider = Provider<StayService>((ref) => StayService());

final stayListProvider = StreamProvider<List<Stay>>((ref){
  final stays = ref.watch(stayServiceProvider);
  return stays.getStayList();
});
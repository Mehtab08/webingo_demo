

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:webingo_demo/model/stay_model.dart';

class StayService{
  final _collection = FirebaseFirestore.instance.collection('stays');

  Stream<List<Stay>> getStayList(){
    return _collection.snapshots().map((snapshot){
      return snapshot.docs.map((doc){
        return Stay.fromJson(doc.data(), doc.reference.id);
      }).toList();
    });
  }

  Future<void> favouriteStay(String id) async {
    await _collection.doc(id).update({
      'isFavorite': true
    });
  }

  Future<void> unFavouriteStay(String id) async {
    await _collection.doc(id).update({
      'isFavorite': false
    });
  }

}
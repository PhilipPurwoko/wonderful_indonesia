import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wonderful_indonesia/models/attraction/attraction_model.dart';

class AttractionRepostitory {
  final Stream<QuerySnapshot<Map<String, dynamic>>> attractionStream =
      FirebaseFirestore.instance.collection('attractions').snapshots();

  Stream<List<AttractionModel>> get attractions {
    return attractionStream.map((QuerySnapshot<Map<String, dynamic>> snapshot) {
      return snapshot.docs
          .map((QueryDocumentSnapshot<Map<String, dynamic>> doc) =>
              AttractionModel.fromJson(doc.data()))
          .toList();
    });
  }
}

import 'dart:developer';

import 'package:anopolly/Data/Models/poll_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PollService {
  final collectionRef = FirebaseFirestore.instance.collection("users");

  Future<bool> addPoll(PollModel pollModel) async {
    final docId = pollModel.pollId;
    try {
      log("trying to add poll...");
      await collectionRef.doc(docId).set(pollModel.toMap());
      log("added the poll");

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<PollModel>> getPolls() async {
    List<PollModel> polls = [];
    try {
      log("trying to get polls list");
      final querySnapshot = await collectionRef.get();

      final docSnapshot = querySnapshot.docs;

      final List<PollModel> extractedPolls = docSnapshot
          .map((e) => PollModel.fromMap(e.data()))
          .toList();

      polls = extractedPolls;

      log("got the list of polls : ${polls.toString()}");
      return polls;
    } catch (e) {
      return polls;
    }
  }
}

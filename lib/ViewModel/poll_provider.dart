// ignore_for_file: empty_catches

import 'package:anopolly/Data/Models/poll_model.dart';
import 'package:anopolly/Data/Repositories/poll_service.dart';
import 'package:flutter/material.dart';

class PollProvider extends ChangeNotifier {
  final pollService = PollService();

  bool isLoading = false;
  String? error;

  bool isAdded = false;
  List<PollModel> polls = [];
  PollModel? poll;

  Future<void> addPoll(PollModel pollModel) async {
    isLoading = true;
    error = null;
    notifyListeners();
    try {
      final result = await pollService.addPoll(pollModel);
      isAdded = result;
      isLoading = false;
      notifyListeners();
    } catch (e) {
      error = e.toString();
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getPolls() async {
    isLoading = true;
    error = null;
    notifyListeners();
    try {
      final result = await pollService.getPolls();

      polls = result;
      isLoading = false;
      notifyListeners();
    } catch (e) {
      error = e.toString();
      isLoading = false;
      notifyListeners();
    }
  }
}

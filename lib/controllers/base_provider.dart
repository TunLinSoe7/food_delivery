import 'package:flutter/material.dart';

import '../utils/enums.dart';

class BaseBloc extends ChangeNotifier {
  bool _isDispose = false;
  LoadingState _loadingState = LoadingState.loading;
  String? _errorMessage;

  set setLoadingState(LoadingState loadingState) => _loadingState = loadingState;

  set setErrorMessage(String message) => _errorMessage = message;

  LoadingState get getLoadingState => _loadingState;

  String? get getErrorMessage => _errorMessage;

  @override
  void notifyListeners() {
    if (!_isDispose) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    _isDispose = true;
    super.dispose();
  }
}

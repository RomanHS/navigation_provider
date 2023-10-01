import 'dart:developer';
import 'package:flutter/material.dart';

abstract class StateNotifier<T> extends ValueNotifier<T> {
  final Object key;

  int _count = 0;

  static final Map<Object, StateNotifier> _instances = {};

  StateNotifier(this.key, super.value) {
    log('init');
  }

  static T getOrCreate<T extends StateNotifier>({
    required Object key,
    required T Function() create,
  }) {
    final StateNotifier? res = _instances[key];

    if (res is T) {
      return res;
    }

    return _instances[key] = create();
  }

  @override
  void addListener(VoidCallback listener) {
    _count++;
    super.addListener(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    super.removeListener(listener);
    _count--;
  }

  @override
  void dispose() {
    if (_count > 0) {
      return;
    }
    _instances.remove(key);
    log('dispose');
    super.dispose();
  }
}

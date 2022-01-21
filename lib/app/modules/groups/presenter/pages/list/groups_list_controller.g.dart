// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'groups_list_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $GroupsListController = BindInject(
  (i) => GroupsListController(),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GroupsListController on _GroupsListControllerBase, Store {
  final _$loadingAtom = Atom(name: '_GroupsListControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$_GroupsListControllerBaseActionController =
      ActionController(name: '_GroupsListControllerBase');

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_GroupsListControllerBaseActionController
        .startAction(name: '_GroupsListControllerBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_GroupsListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading}
    ''';
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $NotificationController = BindInject(
  (i) => NotificationController(i<AuthStore>(), i<ListNotifiactions>()),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NotificationController on _NotificationControllerBase, Store {
  Computed<bool>? _$isNotificationsComputed;

  @override
  bool get isNotifications =>
      (_$isNotificationsComputed ??= Computed<bool>(() => super.isNotifications,
              name: '_NotificationControllerBase.isNotifications'))
          .value;
  Computed<int>? _$countNotificationsComputed;

  @override
  int get countNotifications => (_$countNotificationsComputed ??= Computed<int>(
          () => super.countNotifications,
          name: '_NotificationControllerBase.countNotifications'))
      .value;
  Computed<List<NotificationModel>>? _$allNotificationsComputed;

  @override
  List<NotificationModel> get allNotifications =>
      (_$allNotificationsComputed ??= Computed<List<NotificationModel>>(
              () => super.allNotifications,
              name: '_NotificationControllerBase.allNotifications'))
          .value;

  final _$_listNotificationsAtom =
      Atom(name: '_NotificationControllerBase._listNotifications');

  @override
  ObservableList<NotificationModel> get _listNotifications {
    _$_listNotificationsAtom.reportRead();
    return super._listNotifications;
  }

  @override
  set _listNotifications(ObservableList<NotificationModel> value) {
    _$_listNotificationsAtom.reportWrite(value, super._listNotifications, () {
      super._listNotifications = value;
    });
  }

  final _$_NotificationControllerBaseActionController =
      ActionController(name: '_NotificationControllerBase');

  @override
  void add(NotificationModel value) {
    final _$actionInfo = _$_NotificationControllerBaseActionController
        .startAction(name: '_NotificationControllerBase.add');
    try {
      return super.add(value);
    } finally {
      _$_NotificationControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addAll(Iterable<NotificationModel> notifications) {
    final _$actionInfo = _$_NotificationControllerBaseActionController
        .startAction(name: '_NotificationControllerBase.addAll');
    try {
      return super.addAll(notifications);
    } finally {
      _$_NotificationControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isNotifications: ${isNotifications},
countNotifications: ${countNotifications},
allNotifications: ${allNotifications}
    ''';
  }
}

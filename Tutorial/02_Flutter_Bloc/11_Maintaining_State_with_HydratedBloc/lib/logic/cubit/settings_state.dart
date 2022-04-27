part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  final bool appNotifications;
  final bool emailNotifications;

  const SettingsState({
    required this.appNotifications,
    required this.emailNotifications,
  });

  SettingsState copyWith({
    required bool appNotifications,
    required bool emailNotifications,
  }) {
    return SettingsState(
      appNotifications: appNotifications,
      emailNotifications: emailNotifications,
    );
  }

  @override
  List<Object> get props => [
        emailNotifications,
        appNotifications,
      ];
}

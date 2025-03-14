import 'package:permission_handler/permission_handler.dart';

class PermissionManager {
  // 요청할 권한 목록(필요한 권한 목록에 따라 수정해서 사용하세요)
  static final List<Permission> _permissions = [
    Permission.camera,
    Permission.photos,
    Permission.notification,
  ];

  /// 모든 권한 요청
  static Future<Map<Permission, PermissionStatus>> requestAllPermissions() async {
    return await _permissions.request();
  }

  /// 특정 권한 요청
  static Future<PermissionStatus> requestPermission(Permission permission) async {
    return await permission.request();
  }

  /// 특정 권한 상태 확인
  static Future<bool> isPermissionGranted(Permission permission) async {
    return await permission.status.isGranted;
  }

  /// 권한 상태 확인 후 요청 (허용되지 않았을 경우만 요청)
  static Future<bool> checkAndRequestPermission(Permission permission) async {
    if (await isPermissionGranted(permission)) {
      return true;
    }
    return (await requestPermission(permission)).isGranted;
  }

  /// 영구적으로 거부된 권한이 있는지 확인
  static Future<bool> isPermissionPermanentlyDenied(Permission permission) async {
    return await permission.status.isPermanentlyDenied;
  }

  /// 앱 설정으로 이동
  static Future<void> openAppSettingsPage() async {
    await openAppSettings();
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'two_factor_setup_account_settings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(acountTwoFactorSettings)
final acountTwoFactorSettingsProvider = AcountTwoFactorSettingsProvider._();

final class AcountTwoFactorSettingsProvider
    extends
        $FunctionalProvider<
          AsyncValue<AccountTwoFaSettings?>,
          AccountTwoFaSettings?,
          FutureOr<AccountTwoFaSettings?>
        >
    with
        $FutureModifier<AccountTwoFaSettings?>,
        $FutureProvider<AccountTwoFaSettings?> {
  AcountTwoFactorSettingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'acountTwoFactorSettingsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$acountTwoFactorSettingsHash();

  @$internal
  @override
  $FutureProviderElement<AccountTwoFaSettings?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AccountTwoFaSettings?> create(Ref ref) {
    return acountTwoFactorSettings(ref);
  }
}

String _$acountTwoFactorSettingsHash() =>
    r'0a9e643aa0941c600edd5b452b60bf1cd6fdaf1c';

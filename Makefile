.PHONY: run build-apk build-appbundle build-ipa clean

run:
	flutter run --dart-define-from-file configs.json

build-apk:
	flutter build apk --dart-define-from-file configs.json

build-appbundle:
	flutter build appbundle --dart-define-from-file configs.json

build-ipa:
	flutter build ipa --dart-define-from-file configs.json

clean:
	flutter clean

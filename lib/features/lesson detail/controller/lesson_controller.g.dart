// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$lessonDetailControllerHash() =>
    r'f1e2cefb5cdf1109d207b152c8d35bd1332c00e6';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [lessonDetailController].
@ProviderFor(lessonDetailController)
const lessonDetailControllerProvider = LessonDetailControllerFamily();

/// See also [lessonDetailController].
class LessonDetailControllerFamily extends Family<AsyncValue<void>> {
  /// See also [lessonDetailController].
  const LessonDetailControllerFamily();

  /// See also [lessonDetailController].
  LessonDetailControllerProvider call({required int index}) {
    return LessonDetailControllerProvider(index: index);
  }

  @override
  LessonDetailControllerProvider getProviderOverride(
    covariant LessonDetailControllerProvider provider,
  ) {
    return call(index: provider.index);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'lessonDetailControllerProvider';
}

/// See also [lessonDetailController].
class LessonDetailControllerProvider extends AutoDisposeFutureProvider<void> {
  /// See also [lessonDetailController].
  LessonDetailControllerProvider({required int index})
    : this._internal(
        (ref) => lessonDetailController(
          ref as LessonDetailControllerRef,
          index: index,
        ),
        from: lessonDetailControllerProvider,
        name: r'lessonDetailControllerProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$lessonDetailControllerHash,
        dependencies: LessonDetailControllerFamily._dependencies,
        allTransitiveDependencies:
            LessonDetailControllerFamily._allTransitiveDependencies,
        index: index,
      );

  LessonDetailControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.index,
  }) : super.internal();

  final int index;

  @override
  Override overrideWith(
    FutureOr<void> Function(LessonDetailControllerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LessonDetailControllerProvider._internal(
        (ref) => create(ref as LessonDetailControllerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        index: index,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _LessonDetailControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LessonDetailControllerProvider && other.index == index;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, index.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin LessonDetailControllerRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `index` of this provider.
  int get index;
}

class _LessonDetailControllerProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with LessonDetailControllerRef {
  _LessonDetailControllerProviderElement(super.provider);

  @override
  int get index => (origin as LessonDetailControllerProvider).index;
}

String _$lessonDataControllerHash() =>
    r'f0315db9271a1fea5f2f7369e1d59faba1a05143';

/// See also [LessonDataController].
@ProviderFor(LessonDataController)
final lessonDataControllerProvider = AutoDisposeAsyncNotifierProvider<
  LessonDataController,
  LessonVideo
>.internal(
  LessonDataController.new,
  name: r'lessonDataControllerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$lessonDataControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LessonDataController = AutoDisposeAsyncNotifier<LessonVideo>;
String _$videoIndexControllerHash() =>
    r'88b85a54e4409666b76d0cbddd1763191b0ef00d';

/// See also [VideoIndexController].
@ProviderFor(VideoIndexController)
final videoIndexControllerProvider =
    AutoDisposeNotifierProvider<VideoIndexController, int>.internal(
      VideoIndexController.new,
      name: r'videoIndexControllerProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$videoIndexControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$VideoIndexController = AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/product/utility/firebase/firebase_collections.dart';

class SplashProvider extends StateNotifier<SplashState> {
  SplashProvider() : super(const SplashState());

  void checkApplicationVersion(String clientVersion) {
    
  }
// if user come from browser we dont need to check version control
  String? getVersionNumberFromDatabase() {
    if (kIsWeb) return null;
  

    FirebaseCollections.version.reference.doc();
    return null;
  }
}

class SplashState extends Equatable {
  const SplashState({
    this.isRequiredForceUpdate,
    this.isRedirectHome,
  });

  final bool? isRequiredForceUpdate;
  final bool? isRedirectHome;

  @override
  List<Object?> get props => [isRequiredForceUpdate, isRedirectHome];

  SplashState copyWith({
    bool? isRequiredForceUpdate,
    bool? isRedirectHome,
  }) {
    return SplashState(
      isRequiredForceUpdate:
          isRequiredForceUpdate ?? this.isRequiredForceUpdate,

      isRedirectHome: isRedirectHome ?? this.isRedirectHome,    
    );
  }
}

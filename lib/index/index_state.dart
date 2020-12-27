import 'package:equatable/equatable.dart';

abstract class IndexState extends Equatable {
  /// notify change state without deep clone state
  final int version;

  final List propss;
  IndexState(this.version, [this.propss]);

  /// Copy object for use in action
  /// if need use deep clone
  IndexState getStateCopy();

  IndexState getNewVersion();

  @override
  List<Object> get props => ([version, ...propss ?? []]);
}

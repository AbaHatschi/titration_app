// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'line_one_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LineOneEntity {

 int get id; double get pLye1; double get mLye1; double get pLye2; double get mLye2; double get lyeConcentration1; double get lyeSoda1; double get lyeConcentration2; double get lyeSoda2; DateTime get timeStamp;
/// Create a copy of LineOneEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LineOneEntityCopyWith<LineOneEntity> get copyWith => _$LineOneEntityCopyWithImpl<LineOneEntity>(this as LineOneEntity, _$identity);

  /// Serializes this LineOneEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LineOneEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.pLye1, pLye1) || other.pLye1 == pLye1)&&(identical(other.mLye1, mLye1) || other.mLye1 == mLye1)&&(identical(other.pLye2, pLye2) || other.pLye2 == pLye2)&&(identical(other.mLye2, mLye2) || other.mLye2 == mLye2)&&(identical(other.lyeConcentration1, lyeConcentration1) || other.lyeConcentration1 == lyeConcentration1)&&(identical(other.lyeSoda1, lyeSoda1) || other.lyeSoda1 == lyeSoda1)&&(identical(other.lyeConcentration2, lyeConcentration2) || other.lyeConcentration2 == lyeConcentration2)&&(identical(other.lyeSoda2, lyeSoda2) || other.lyeSoda2 == lyeSoda2)&&(identical(other.timeStamp, timeStamp) || other.timeStamp == timeStamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,pLye1,mLye1,pLye2,mLye2,lyeConcentration1,lyeSoda1,lyeConcentration2,lyeSoda2,timeStamp);

@override
String toString() {
  return 'LineOneEntity(id: $id, pLye1: $pLye1, mLye1: $mLye1, pLye2: $pLye2, mLye2: $mLye2, lyeConcentration1: $lyeConcentration1, lyeSoda1: $lyeSoda1, lyeConcentration2: $lyeConcentration2, lyeSoda2: $lyeSoda2, timeStamp: $timeStamp)';
}


}

/// @nodoc
abstract mixin class $LineOneEntityCopyWith<$Res>  {
  factory $LineOneEntityCopyWith(LineOneEntity value, $Res Function(LineOneEntity) _then) = _$LineOneEntityCopyWithImpl;
@useResult
$Res call({
 int id, double pLye1, double mLye1, double pLye2, double mLye2, double lyeConcentration1, double lyeSoda1, double lyeConcentration2, double lyeSoda2, DateTime timeStamp
});




}
/// @nodoc
class _$LineOneEntityCopyWithImpl<$Res>
    implements $LineOneEntityCopyWith<$Res> {
  _$LineOneEntityCopyWithImpl(this._self, this._then);

  final LineOneEntity _self;
  final $Res Function(LineOneEntity) _then;

/// Create a copy of LineOneEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? pLye1 = null,Object? mLye1 = null,Object? pLye2 = null,Object? mLye2 = null,Object? lyeConcentration1 = null,Object? lyeSoda1 = null,Object? lyeConcentration2 = null,Object? lyeSoda2 = null,Object? timeStamp = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,pLye1: null == pLye1 ? _self.pLye1 : pLye1 // ignore: cast_nullable_to_non_nullable
as double,mLye1: null == mLye1 ? _self.mLye1 : mLye1 // ignore: cast_nullable_to_non_nullable
as double,pLye2: null == pLye2 ? _self.pLye2 : pLye2 // ignore: cast_nullable_to_non_nullable
as double,mLye2: null == mLye2 ? _self.mLye2 : mLye2 // ignore: cast_nullable_to_non_nullable
as double,lyeConcentration1: null == lyeConcentration1 ? _self.lyeConcentration1 : lyeConcentration1 // ignore: cast_nullable_to_non_nullable
as double,lyeSoda1: null == lyeSoda1 ? _self.lyeSoda1 : lyeSoda1 // ignore: cast_nullable_to_non_nullable
as double,lyeConcentration2: null == lyeConcentration2 ? _self.lyeConcentration2 : lyeConcentration2 // ignore: cast_nullable_to_non_nullable
as double,lyeSoda2: null == lyeSoda2 ? _self.lyeSoda2 : lyeSoda2 // ignore: cast_nullable_to_non_nullable
as double,timeStamp: null == timeStamp ? _self.timeStamp : timeStamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [LineOneEntity].
extension LineOneEntityPatterns on LineOneEntity {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LineOneEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LineOneEntity() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LineOneEntity value)  $default,){
final _that = this;
switch (_that) {
case _LineOneEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LineOneEntity value)?  $default,){
final _that = this;
switch (_that) {
case _LineOneEntity() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  double pLye1,  double mLye1,  double pLye2,  double mLye2,  double lyeConcentration1,  double lyeSoda1,  double lyeConcentration2,  double lyeSoda2,  DateTime timeStamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LineOneEntity() when $default != null:
return $default(_that.id,_that.pLye1,_that.mLye1,_that.pLye2,_that.mLye2,_that.lyeConcentration1,_that.lyeSoda1,_that.lyeConcentration2,_that.lyeSoda2,_that.timeStamp);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  double pLye1,  double mLye1,  double pLye2,  double mLye2,  double lyeConcentration1,  double lyeSoda1,  double lyeConcentration2,  double lyeSoda2,  DateTime timeStamp)  $default,) {final _that = this;
switch (_that) {
case _LineOneEntity():
return $default(_that.id,_that.pLye1,_that.mLye1,_that.pLye2,_that.mLye2,_that.lyeConcentration1,_that.lyeSoda1,_that.lyeConcentration2,_that.lyeSoda2,_that.timeStamp);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  double pLye1,  double mLye1,  double pLye2,  double mLye2,  double lyeConcentration1,  double lyeSoda1,  double lyeConcentration2,  double lyeSoda2,  DateTime timeStamp)?  $default,) {final _that = this;
switch (_that) {
case _LineOneEntity() when $default != null:
return $default(_that.id,_that.pLye1,_that.mLye1,_that.pLye2,_that.mLye2,_that.lyeConcentration1,_that.lyeSoda1,_that.lyeConcentration2,_that.lyeSoda2,_that.timeStamp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LineOneEntity implements LineOneEntity {
   _LineOneEntity({required this.id, required this.pLye1, required this.mLye1, required this.pLye2, required this.mLye2, required this.lyeConcentration1, required this.lyeSoda1, required this.lyeConcentration2, required this.lyeSoda2, required this.timeStamp});
  factory _LineOneEntity.fromJson(Map<String, dynamic> json) => _$LineOneEntityFromJson(json);

@override final  int id;
@override final  double pLye1;
@override final  double mLye1;
@override final  double pLye2;
@override final  double mLye2;
@override final  double lyeConcentration1;
@override final  double lyeSoda1;
@override final  double lyeConcentration2;
@override final  double lyeSoda2;
@override final  DateTime timeStamp;

/// Create a copy of LineOneEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LineOneEntityCopyWith<_LineOneEntity> get copyWith => __$LineOneEntityCopyWithImpl<_LineOneEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LineOneEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LineOneEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.pLye1, pLye1) || other.pLye1 == pLye1)&&(identical(other.mLye1, mLye1) || other.mLye1 == mLye1)&&(identical(other.pLye2, pLye2) || other.pLye2 == pLye2)&&(identical(other.mLye2, mLye2) || other.mLye2 == mLye2)&&(identical(other.lyeConcentration1, lyeConcentration1) || other.lyeConcentration1 == lyeConcentration1)&&(identical(other.lyeSoda1, lyeSoda1) || other.lyeSoda1 == lyeSoda1)&&(identical(other.lyeConcentration2, lyeConcentration2) || other.lyeConcentration2 == lyeConcentration2)&&(identical(other.lyeSoda2, lyeSoda2) || other.lyeSoda2 == lyeSoda2)&&(identical(other.timeStamp, timeStamp) || other.timeStamp == timeStamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,pLye1,mLye1,pLye2,mLye2,lyeConcentration1,lyeSoda1,lyeConcentration2,lyeSoda2,timeStamp);

@override
String toString() {
  return 'LineOneEntity(id: $id, pLye1: $pLye1, mLye1: $mLye1, pLye2: $pLye2, mLye2: $mLye2, lyeConcentration1: $lyeConcentration1, lyeSoda1: $lyeSoda1, lyeConcentration2: $lyeConcentration2, lyeSoda2: $lyeSoda2, timeStamp: $timeStamp)';
}


}

/// @nodoc
abstract mixin class _$LineOneEntityCopyWith<$Res> implements $LineOneEntityCopyWith<$Res> {
  factory _$LineOneEntityCopyWith(_LineOneEntity value, $Res Function(_LineOneEntity) _then) = __$LineOneEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, double pLye1, double mLye1, double pLye2, double mLye2, double lyeConcentration1, double lyeSoda1, double lyeConcentration2, double lyeSoda2, DateTime timeStamp
});




}
/// @nodoc
class __$LineOneEntityCopyWithImpl<$Res>
    implements _$LineOneEntityCopyWith<$Res> {
  __$LineOneEntityCopyWithImpl(this._self, this._then);

  final _LineOneEntity _self;
  final $Res Function(_LineOneEntity) _then;

/// Create a copy of LineOneEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? pLye1 = null,Object? mLye1 = null,Object? pLye2 = null,Object? mLye2 = null,Object? lyeConcentration1 = null,Object? lyeSoda1 = null,Object? lyeConcentration2 = null,Object? lyeSoda2 = null,Object? timeStamp = null,}) {
  return _then(_LineOneEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,pLye1: null == pLye1 ? _self.pLye1 : pLye1 // ignore: cast_nullable_to_non_nullable
as double,mLye1: null == mLye1 ? _self.mLye1 : mLye1 // ignore: cast_nullable_to_non_nullable
as double,pLye2: null == pLye2 ? _self.pLye2 : pLye2 // ignore: cast_nullable_to_non_nullable
as double,mLye2: null == mLye2 ? _self.mLye2 : mLye2 // ignore: cast_nullable_to_non_nullable
as double,lyeConcentration1: null == lyeConcentration1 ? _self.lyeConcentration1 : lyeConcentration1 // ignore: cast_nullable_to_non_nullable
as double,lyeSoda1: null == lyeSoda1 ? _self.lyeSoda1 : lyeSoda1 // ignore: cast_nullable_to_non_nullable
as double,lyeConcentration2: null == lyeConcentration2 ? _self.lyeConcentration2 : lyeConcentration2 // ignore: cast_nullable_to_non_nullable
as double,lyeSoda2: null == lyeSoda2 ? _self.lyeSoda2 : lyeSoda2 // ignore: cast_nullable_to_non_nullable
as double,timeStamp: null == timeStamp ? _self.timeStamp : timeStamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on

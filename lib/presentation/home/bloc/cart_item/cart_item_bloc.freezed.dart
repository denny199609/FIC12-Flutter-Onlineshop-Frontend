// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_item_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CartItemEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Product product) AddCartItem,
    required TResult Function(Product product) RemoveCartItem,
    required TResult Function(int addressId) AddAddressId,
    required TResult Function(String paymentMethod) AddPaymentMethod,
    required TResult Function(String shippingService, int shippingCost)
        AddShippingService,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Product product)? AddCartItem,
    TResult? Function(Product product)? RemoveCartItem,
    TResult? Function(int addressId)? AddAddressId,
    TResult? Function(String paymentMethod)? AddPaymentMethod,
    TResult? Function(String shippingService, int shippingCost)?
        AddShippingService,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Product product)? AddCartItem,
    TResult Function(Product product)? RemoveCartItem,
    TResult Function(int addressId)? AddAddressId,
    TResult Function(String paymentMethod)? AddPaymentMethod,
    TResult Function(String shippingService, int shippingCost)?
        AddShippingService,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_AddCartItem value) AddCartItem,
    required TResult Function(_RemoveCartItem value) RemoveCartItem,
    required TResult Function(_AddAddressId value) AddAddressId,
    required TResult Function(_AddPaymentMethod value) AddPaymentMethod,
    required TResult Function(_AddShippingService value) AddShippingService,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_AddCartItem value)? AddCartItem,
    TResult? Function(_RemoveCartItem value)? RemoveCartItem,
    TResult? Function(_AddAddressId value)? AddAddressId,
    TResult? Function(_AddPaymentMethod value)? AddPaymentMethod,
    TResult? Function(_AddShippingService value)? AddShippingService,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddCartItem value)? AddCartItem,
    TResult Function(_RemoveCartItem value)? RemoveCartItem,
    TResult Function(_AddAddressId value)? AddAddressId,
    TResult Function(_AddPaymentMethod value)? AddPaymentMethod,
    TResult Function(_AddShippingService value)? AddShippingService,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemEventCopyWith<$Res> {
  factory $CartItemEventCopyWith(
          CartItemEvent value, $Res Function(CartItemEvent) then) =
      _$CartItemEventCopyWithImpl<$Res, CartItemEvent>;
}

/// @nodoc
class _$CartItemEventCopyWithImpl<$Res, $Val extends CartItemEvent>
    implements $CartItemEventCopyWith<$Res> {
  _$CartItemEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$CartItemEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'CartItemEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Product product) AddCartItem,
    required TResult Function(Product product) RemoveCartItem,
    required TResult Function(int addressId) AddAddressId,
    required TResult Function(String paymentMethod) AddPaymentMethod,
    required TResult Function(String shippingService, int shippingCost)
        AddShippingService,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Product product)? AddCartItem,
    TResult? Function(Product product)? RemoveCartItem,
    TResult? Function(int addressId)? AddAddressId,
    TResult? Function(String paymentMethod)? AddPaymentMethod,
    TResult? Function(String shippingService, int shippingCost)?
        AddShippingService,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Product product)? AddCartItem,
    TResult Function(Product product)? RemoveCartItem,
    TResult Function(int addressId)? AddAddressId,
    TResult Function(String paymentMethod)? AddPaymentMethod,
    TResult Function(String shippingService, int shippingCost)?
        AddShippingService,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_AddCartItem value) AddCartItem,
    required TResult Function(_RemoveCartItem value) RemoveCartItem,
    required TResult Function(_AddAddressId value) AddAddressId,
    required TResult Function(_AddPaymentMethod value) AddPaymentMethod,
    required TResult Function(_AddShippingService value) AddShippingService,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_AddCartItem value)? AddCartItem,
    TResult? Function(_RemoveCartItem value)? RemoveCartItem,
    TResult? Function(_AddAddressId value)? AddAddressId,
    TResult? Function(_AddPaymentMethod value)? AddPaymentMethod,
    TResult? Function(_AddShippingService value)? AddShippingService,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddCartItem value)? AddCartItem,
    TResult Function(_RemoveCartItem value)? RemoveCartItem,
    TResult Function(_AddAddressId value)? AddAddressId,
    TResult Function(_AddPaymentMethod value)? AddPaymentMethod,
    TResult Function(_AddShippingService value)? AddShippingService,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements CartItemEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$AddCartItemImplCopyWith<$Res> {
  factory _$$AddCartItemImplCopyWith(
          _$AddCartItemImpl value, $Res Function(_$AddCartItemImpl) then) =
      __$$AddCartItemImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Product product});
}

/// @nodoc
class __$$AddCartItemImplCopyWithImpl<$Res>
    extends _$CartItemEventCopyWithImpl<$Res, _$AddCartItemImpl>
    implements _$$AddCartItemImplCopyWith<$Res> {
  __$$AddCartItemImplCopyWithImpl(
      _$AddCartItemImpl _value, $Res Function(_$AddCartItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
  }) {
    return _then(_$AddCartItemImpl(
      null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
    ));
  }
}

/// @nodoc

class _$AddCartItemImpl implements _AddCartItem {
  const _$AddCartItemImpl(this.product);

  @override
  final Product product;

  @override
  String toString() {
    return 'CartItemEvent.AddCartItem(product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddCartItemImpl &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddCartItemImplCopyWith<_$AddCartItemImpl> get copyWith =>
      __$$AddCartItemImplCopyWithImpl<_$AddCartItemImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Product product) AddCartItem,
    required TResult Function(Product product) RemoveCartItem,
    required TResult Function(int addressId) AddAddressId,
    required TResult Function(String paymentMethod) AddPaymentMethod,
    required TResult Function(String shippingService, int shippingCost)
        AddShippingService,
  }) {
    return AddCartItem(product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Product product)? AddCartItem,
    TResult? Function(Product product)? RemoveCartItem,
    TResult? Function(int addressId)? AddAddressId,
    TResult? Function(String paymentMethod)? AddPaymentMethod,
    TResult? Function(String shippingService, int shippingCost)?
        AddShippingService,
  }) {
    return AddCartItem?.call(product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Product product)? AddCartItem,
    TResult Function(Product product)? RemoveCartItem,
    TResult Function(int addressId)? AddAddressId,
    TResult Function(String paymentMethod)? AddPaymentMethod,
    TResult Function(String shippingService, int shippingCost)?
        AddShippingService,
    required TResult orElse(),
  }) {
    if (AddCartItem != null) {
      return AddCartItem(product);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_AddCartItem value) AddCartItem,
    required TResult Function(_RemoveCartItem value) RemoveCartItem,
    required TResult Function(_AddAddressId value) AddAddressId,
    required TResult Function(_AddPaymentMethod value) AddPaymentMethod,
    required TResult Function(_AddShippingService value) AddShippingService,
  }) {
    return AddCartItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_AddCartItem value)? AddCartItem,
    TResult? Function(_RemoveCartItem value)? RemoveCartItem,
    TResult? Function(_AddAddressId value)? AddAddressId,
    TResult? Function(_AddPaymentMethod value)? AddPaymentMethod,
    TResult? Function(_AddShippingService value)? AddShippingService,
  }) {
    return AddCartItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddCartItem value)? AddCartItem,
    TResult Function(_RemoveCartItem value)? RemoveCartItem,
    TResult Function(_AddAddressId value)? AddAddressId,
    TResult Function(_AddPaymentMethod value)? AddPaymentMethod,
    TResult Function(_AddShippingService value)? AddShippingService,
    required TResult orElse(),
  }) {
    if (AddCartItem != null) {
      return AddCartItem(this);
    }
    return orElse();
  }
}

abstract class _AddCartItem implements CartItemEvent {
  const factory _AddCartItem(final Product product) = _$AddCartItemImpl;

  Product get product;
  @JsonKey(ignore: true)
  _$$AddCartItemImplCopyWith<_$AddCartItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveCartItemImplCopyWith<$Res> {
  factory _$$RemoveCartItemImplCopyWith(_$RemoveCartItemImpl value,
          $Res Function(_$RemoveCartItemImpl) then) =
      __$$RemoveCartItemImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Product product});
}

/// @nodoc
class __$$RemoveCartItemImplCopyWithImpl<$Res>
    extends _$CartItemEventCopyWithImpl<$Res, _$RemoveCartItemImpl>
    implements _$$RemoveCartItemImplCopyWith<$Res> {
  __$$RemoveCartItemImplCopyWithImpl(
      _$RemoveCartItemImpl _value, $Res Function(_$RemoveCartItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
  }) {
    return _then(_$RemoveCartItemImpl(
      null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
    ));
  }
}

/// @nodoc

class _$RemoveCartItemImpl implements _RemoveCartItem {
  const _$RemoveCartItemImpl(this.product);

  @override
  final Product product;

  @override
  String toString() {
    return 'CartItemEvent.RemoveCartItem(product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveCartItemImpl &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveCartItemImplCopyWith<_$RemoveCartItemImpl> get copyWith =>
      __$$RemoveCartItemImplCopyWithImpl<_$RemoveCartItemImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Product product) AddCartItem,
    required TResult Function(Product product) RemoveCartItem,
    required TResult Function(int addressId) AddAddressId,
    required TResult Function(String paymentMethod) AddPaymentMethod,
    required TResult Function(String shippingService, int shippingCost)
        AddShippingService,
  }) {
    return RemoveCartItem(product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Product product)? AddCartItem,
    TResult? Function(Product product)? RemoveCartItem,
    TResult? Function(int addressId)? AddAddressId,
    TResult? Function(String paymentMethod)? AddPaymentMethod,
    TResult? Function(String shippingService, int shippingCost)?
        AddShippingService,
  }) {
    return RemoveCartItem?.call(product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Product product)? AddCartItem,
    TResult Function(Product product)? RemoveCartItem,
    TResult Function(int addressId)? AddAddressId,
    TResult Function(String paymentMethod)? AddPaymentMethod,
    TResult Function(String shippingService, int shippingCost)?
        AddShippingService,
    required TResult orElse(),
  }) {
    if (RemoveCartItem != null) {
      return RemoveCartItem(product);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_AddCartItem value) AddCartItem,
    required TResult Function(_RemoveCartItem value) RemoveCartItem,
    required TResult Function(_AddAddressId value) AddAddressId,
    required TResult Function(_AddPaymentMethod value) AddPaymentMethod,
    required TResult Function(_AddShippingService value) AddShippingService,
  }) {
    return RemoveCartItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_AddCartItem value)? AddCartItem,
    TResult? Function(_RemoveCartItem value)? RemoveCartItem,
    TResult? Function(_AddAddressId value)? AddAddressId,
    TResult? Function(_AddPaymentMethod value)? AddPaymentMethod,
    TResult? Function(_AddShippingService value)? AddShippingService,
  }) {
    return RemoveCartItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddCartItem value)? AddCartItem,
    TResult Function(_RemoveCartItem value)? RemoveCartItem,
    TResult Function(_AddAddressId value)? AddAddressId,
    TResult Function(_AddPaymentMethod value)? AddPaymentMethod,
    TResult Function(_AddShippingService value)? AddShippingService,
    required TResult orElse(),
  }) {
    if (RemoveCartItem != null) {
      return RemoveCartItem(this);
    }
    return orElse();
  }
}

abstract class _RemoveCartItem implements CartItemEvent {
  const factory _RemoveCartItem(final Product product) = _$RemoveCartItemImpl;

  Product get product;
  @JsonKey(ignore: true)
  _$$RemoveCartItemImplCopyWith<_$RemoveCartItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddAddressIdImplCopyWith<$Res> {
  factory _$$AddAddressIdImplCopyWith(
          _$AddAddressIdImpl value, $Res Function(_$AddAddressIdImpl) then) =
      __$$AddAddressIdImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int addressId});
}

/// @nodoc
class __$$AddAddressIdImplCopyWithImpl<$Res>
    extends _$CartItemEventCopyWithImpl<$Res, _$AddAddressIdImpl>
    implements _$$AddAddressIdImplCopyWith<$Res> {
  __$$AddAddressIdImplCopyWithImpl(
      _$AddAddressIdImpl _value, $Res Function(_$AddAddressIdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addressId = null,
  }) {
    return _then(_$AddAddressIdImpl(
      null == addressId
          ? _value.addressId
          : addressId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AddAddressIdImpl implements _AddAddressId {
  const _$AddAddressIdImpl(this.addressId);

  @override
  final int addressId;

  @override
  String toString() {
    return 'CartItemEvent.AddAddressId(addressId: $addressId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddAddressIdImpl &&
            (identical(other.addressId, addressId) ||
                other.addressId == addressId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, addressId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddAddressIdImplCopyWith<_$AddAddressIdImpl> get copyWith =>
      __$$AddAddressIdImplCopyWithImpl<_$AddAddressIdImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Product product) AddCartItem,
    required TResult Function(Product product) RemoveCartItem,
    required TResult Function(int addressId) AddAddressId,
    required TResult Function(String paymentMethod) AddPaymentMethod,
    required TResult Function(String shippingService, int shippingCost)
        AddShippingService,
  }) {
    return AddAddressId(addressId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Product product)? AddCartItem,
    TResult? Function(Product product)? RemoveCartItem,
    TResult? Function(int addressId)? AddAddressId,
    TResult? Function(String paymentMethod)? AddPaymentMethod,
    TResult? Function(String shippingService, int shippingCost)?
        AddShippingService,
  }) {
    return AddAddressId?.call(addressId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Product product)? AddCartItem,
    TResult Function(Product product)? RemoveCartItem,
    TResult Function(int addressId)? AddAddressId,
    TResult Function(String paymentMethod)? AddPaymentMethod,
    TResult Function(String shippingService, int shippingCost)?
        AddShippingService,
    required TResult orElse(),
  }) {
    if (AddAddressId != null) {
      return AddAddressId(addressId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_AddCartItem value) AddCartItem,
    required TResult Function(_RemoveCartItem value) RemoveCartItem,
    required TResult Function(_AddAddressId value) AddAddressId,
    required TResult Function(_AddPaymentMethod value) AddPaymentMethod,
    required TResult Function(_AddShippingService value) AddShippingService,
  }) {
    return AddAddressId(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_AddCartItem value)? AddCartItem,
    TResult? Function(_RemoveCartItem value)? RemoveCartItem,
    TResult? Function(_AddAddressId value)? AddAddressId,
    TResult? Function(_AddPaymentMethod value)? AddPaymentMethod,
    TResult? Function(_AddShippingService value)? AddShippingService,
  }) {
    return AddAddressId?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddCartItem value)? AddCartItem,
    TResult Function(_RemoveCartItem value)? RemoveCartItem,
    TResult Function(_AddAddressId value)? AddAddressId,
    TResult Function(_AddPaymentMethod value)? AddPaymentMethod,
    TResult Function(_AddShippingService value)? AddShippingService,
    required TResult orElse(),
  }) {
    if (AddAddressId != null) {
      return AddAddressId(this);
    }
    return orElse();
  }
}

abstract class _AddAddressId implements CartItemEvent {
  const factory _AddAddressId(final int addressId) = _$AddAddressIdImpl;

  int get addressId;
  @JsonKey(ignore: true)
  _$$AddAddressIdImplCopyWith<_$AddAddressIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddPaymentMethodImplCopyWith<$Res> {
  factory _$$AddPaymentMethodImplCopyWith(_$AddPaymentMethodImpl value,
          $Res Function(_$AddPaymentMethodImpl) then) =
      __$$AddPaymentMethodImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String paymentMethod});
}

/// @nodoc
class __$$AddPaymentMethodImplCopyWithImpl<$Res>
    extends _$CartItemEventCopyWithImpl<$Res, _$AddPaymentMethodImpl>
    implements _$$AddPaymentMethodImplCopyWith<$Res> {
  __$$AddPaymentMethodImplCopyWithImpl(_$AddPaymentMethodImpl _value,
      $Res Function(_$AddPaymentMethodImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentMethod = null,
  }) {
    return _then(_$AddPaymentMethodImpl(
      null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddPaymentMethodImpl implements _AddPaymentMethod {
  const _$AddPaymentMethodImpl(this.paymentMethod);

  @override
  final String paymentMethod;

  @override
  String toString() {
    return 'CartItemEvent.AddPaymentMethod(paymentMethod: $paymentMethod)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddPaymentMethodImpl &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paymentMethod);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddPaymentMethodImplCopyWith<_$AddPaymentMethodImpl> get copyWith =>
      __$$AddPaymentMethodImplCopyWithImpl<_$AddPaymentMethodImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Product product) AddCartItem,
    required TResult Function(Product product) RemoveCartItem,
    required TResult Function(int addressId) AddAddressId,
    required TResult Function(String paymentMethod) AddPaymentMethod,
    required TResult Function(String shippingService, int shippingCost)
        AddShippingService,
  }) {
    return AddPaymentMethod(paymentMethod);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Product product)? AddCartItem,
    TResult? Function(Product product)? RemoveCartItem,
    TResult? Function(int addressId)? AddAddressId,
    TResult? Function(String paymentMethod)? AddPaymentMethod,
    TResult? Function(String shippingService, int shippingCost)?
        AddShippingService,
  }) {
    return AddPaymentMethod?.call(paymentMethod);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Product product)? AddCartItem,
    TResult Function(Product product)? RemoveCartItem,
    TResult Function(int addressId)? AddAddressId,
    TResult Function(String paymentMethod)? AddPaymentMethod,
    TResult Function(String shippingService, int shippingCost)?
        AddShippingService,
    required TResult orElse(),
  }) {
    if (AddPaymentMethod != null) {
      return AddPaymentMethod(paymentMethod);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_AddCartItem value) AddCartItem,
    required TResult Function(_RemoveCartItem value) RemoveCartItem,
    required TResult Function(_AddAddressId value) AddAddressId,
    required TResult Function(_AddPaymentMethod value) AddPaymentMethod,
    required TResult Function(_AddShippingService value) AddShippingService,
  }) {
    return AddPaymentMethod(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_AddCartItem value)? AddCartItem,
    TResult? Function(_RemoveCartItem value)? RemoveCartItem,
    TResult? Function(_AddAddressId value)? AddAddressId,
    TResult? Function(_AddPaymentMethod value)? AddPaymentMethod,
    TResult? Function(_AddShippingService value)? AddShippingService,
  }) {
    return AddPaymentMethod?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddCartItem value)? AddCartItem,
    TResult Function(_RemoveCartItem value)? RemoveCartItem,
    TResult Function(_AddAddressId value)? AddAddressId,
    TResult Function(_AddPaymentMethod value)? AddPaymentMethod,
    TResult Function(_AddShippingService value)? AddShippingService,
    required TResult orElse(),
  }) {
    if (AddPaymentMethod != null) {
      return AddPaymentMethod(this);
    }
    return orElse();
  }
}

abstract class _AddPaymentMethod implements CartItemEvent {
  const factory _AddPaymentMethod(final String paymentMethod) =
      _$AddPaymentMethodImpl;

  String get paymentMethod;
  @JsonKey(ignore: true)
  _$$AddPaymentMethodImplCopyWith<_$AddPaymentMethodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddShippingServiceImplCopyWith<$Res> {
  factory _$$AddShippingServiceImplCopyWith(_$AddShippingServiceImpl value,
          $Res Function(_$AddShippingServiceImpl) then) =
      __$$AddShippingServiceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String shippingService, int shippingCost});
}

/// @nodoc
class __$$AddShippingServiceImplCopyWithImpl<$Res>
    extends _$CartItemEventCopyWithImpl<$Res, _$AddShippingServiceImpl>
    implements _$$AddShippingServiceImplCopyWith<$Res> {
  __$$AddShippingServiceImplCopyWithImpl(_$AddShippingServiceImpl _value,
      $Res Function(_$AddShippingServiceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shippingService = null,
    Object? shippingCost = null,
  }) {
    return _then(_$AddShippingServiceImpl(
      null == shippingService
          ? _value.shippingService
          : shippingService // ignore: cast_nullable_to_non_nullable
              as String,
      null == shippingCost
          ? _value.shippingCost
          : shippingCost // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AddShippingServiceImpl implements _AddShippingService {
  const _$AddShippingServiceImpl(this.shippingService, this.shippingCost);

  @override
  final String shippingService;
  @override
  final int shippingCost;

  @override
  String toString() {
    return 'CartItemEvent.AddShippingService(shippingService: $shippingService, shippingCost: $shippingCost)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddShippingServiceImpl &&
            (identical(other.shippingService, shippingService) ||
                other.shippingService == shippingService) &&
            (identical(other.shippingCost, shippingCost) ||
                other.shippingCost == shippingCost));
  }

  @override
  int get hashCode => Object.hash(runtimeType, shippingService, shippingCost);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddShippingServiceImplCopyWith<_$AddShippingServiceImpl> get copyWith =>
      __$$AddShippingServiceImplCopyWithImpl<_$AddShippingServiceImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Product product) AddCartItem,
    required TResult Function(Product product) RemoveCartItem,
    required TResult Function(int addressId) AddAddressId,
    required TResult Function(String paymentMethod) AddPaymentMethod,
    required TResult Function(String shippingService, int shippingCost)
        AddShippingService,
  }) {
    return AddShippingService(shippingService, shippingCost);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Product product)? AddCartItem,
    TResult? Function(Product product)? RemoveCartItem,
    TResult? Function(int addressId)? AddAddressId,
    TResult? Function(String paymentMethod)? AddPaymentMethod,
    TResult? Function(String shippingService, int shippingCost)?
        AddShippingService,
  }) {
    return AddShippingService?.call(shippingService, shippingCost);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Product product)? AddCartItem,
    TResult Function(Product product)? RemoveCartItem,
    TResult Function(int addressId)? AddAddressId,
    TResult Function(String paymentMethod)? AddPaymentMethod,
    TResult Function(String shippingService, int shippingCost)?
        AddShippingService,
    required TResult orElse(),
  }) {
    if (AddShippingService != null) {
      return AddShippingService(shippingService, shippingCost);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_AddCartItem value) AddCartItem,
    required TResult Function(_RemoveCartItem value) RemoveCartItem,
    required TResult Function(_AddAddressId value) AddAddressId,
    required TResult Function(_AddPaymentMethod value) AddPaymentMethod,
    required TResult Function(_AddShippingService value) AddShippingService,
  }) {
    return AddShippingService(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_AddCartItem value)? AddCartItem,
    TResult? Function(_RemoveCartItem value)? RemoveCartItem,
    TResult? Function(_AddAddressId value)? AddAddressId,
    TResult? Function(_AddPaymentMethod value)? AddPaymentMethod,
    TResult? Function(_AddShippingService value)? AddShippingService,
  }) {
    return AddShippingService?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddCartItem value)? AddCartItem,
    TResult Function(_RemoveCartItem value)? RemoveCartItem,
    TResult Function(_AddAddressId value)? AddAddressId,
    TResult Function(_AddPaymentMethod value)? AddPaymentMethod,
    TResult Function(_AddShippingService value)? AddShippingService,
    required TResult orElse(),
  }) {
    if (AddShippingService != null) {
      return AddShippingService(this);
    }
    return orElse();
  }
}

abstract class _AddShippingService implements CartItemEvent {
  const factory _AddShippingService(
          final String shippingService, final int shippingCost) =
      _$AddShippingServiceImpl;

  String get shippingService;
  int get shippingCost;
  @JsonKey(ignore: true)
  _$$AddShippingServiceImplCopyWith<_$AddShippingServiceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CartItemState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<CartItem> cartItems,
            int addressId,
            String paymentMethod,
            String shippingService,
            int shippingCost,
            String paymentVaName)
        loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<CartItem> cartItems,
            int addressId,
            String paymentMethod,
            String shippingService,
            int shippingCost,
            String paymentVaName)?
        loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<CartItem> cartItems,
            int addressId,
            String paymentMethod,
            String shippingService,
            int shippingCost,
            String paymentVaName)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemStateCopyWith<$Res> {
  factory $CartItemStateCopyWith(
          CartItemState value, $Res Function(CartItemState) then) =
      _$CartItemStateCopyWithImpl<$Res, CartItemState>;
}

/// @nodoc
class _$CartItemStateCopyWithImpl<$Res, $Val extends CartItemState>
    implements $CartItemStateCopyWith<$Res> {
  _$CartItemStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$CartItemStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'CartItemState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<CartItem> cartItems,
            int addressId,
            String paymentMethod,
            String shippingService,
            int shippingCost,
            String paymentVaName)
        loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<CartItem> cartItems,
            int addressId,
            String paymentMethod,
            String shippingService,
            int shippingCost,
            String paymentVaName)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<CartItem> cartItems,
            int addressId,
            String paymentMethod,
            String shippingService,
            int shippingCost,
            String paymentVaName)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CartItemState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$CartItemStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'CartItemState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<CartItem> cartItems,
            int addressId,
            String paymentMethod,
            String shippingService,
            int shippingCost,
            String paymentVaName)
        loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<CartItem> cartItems,
            int addressId,
            String paymentMethod,
            String shippingService,
            int shippingCost,
            String paymentVaName)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<CartItem> cartItems,
            int addressId,
            String paymentMethod,
            String shippingService,
            int shippingCost,
            String paymentVaName)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements CartItemState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<CartItem> cartItems,
      int addressId,
      String paymentMethod,
      String shippingService,
      int shippingCost,
      String paymentVaName});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$CartItemStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartItems = null,
    Object? addressId = null,
    Object? paymentMethod = null,
    Object? shippingService = null,
    Object? shippingCost = null,
    Object? paymentVaName = null,
  }) {
    return _then(_$LoadedImpl(
      null == cartItems
          ? _value._cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      null == addressId
          ? _value.addressId
          : addressId // ignore: cast_nullable_to_non_nullable
              as int,
      null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      null == shippingService
          ? _value.shippingService
          : shippingService // ignore: cast_nullable_to_non_nullable
              as String,
      null == shippingCost
          ? _value.shippingCost
          : shippingCost // ignore: cast_nullable_to_non_nullable
              as int,
      null == paymentVaName
          ? _value.paymentVaName
          : paymentVaName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(
      final List<CartItem> cartItems,
      this.addressId,
      this.paymentMethod,
      this.shippingService,
      this.shippingCost,
      this.paymentVaName)
      : _cartItems = cartItems;

  final List<CartItem> _cartItems;
  @override
  List<CartItem> get cartItems {
    if (_cartItems is EqualUnmodifiableListView) return _cartItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cartItems);
  }

  @override
  final int addressId;
  @override
  final String paymentMethod;
  @override
  final String shippingService;
  @override
  final int shippingCost;
  @override
  final String paymentVaName;

  @override
  String toString() {
    return 'CartItemState.loaded(cartItems: $cartItems, addressId: $addressId, paymentMethod: $paymentMethod, shippingService: $shippingService, shippingCost: $shippingCost, paymentVaName: $paymentVaName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality()
                .equals(other._cartItems, _cartItems) &&
            (identical(other.addressId, addressId) ||
                other.addressId == addressId) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.shippingService, shippingService) ||
                other.shippingService == shippingService) &&
            (identical(other.shippingCost, shippingCost) ||
                other.shippingCost == shippingCost) &&
            (identical(other.paymentVaName, paymentVaName) ||
                other.paymentVaName == paymentVaName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_cartItems),
      addressId,
      paymentMethod,
      shippingService,
      shippingCost,
      paymentVaName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<CartItem> cartItems,
            int addressId,
            String paymentMethod,
            String shippingService,
            int shippingCost,
            String paymentVaName)
        loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(cartItems, addressId, paymentMethod, shippingService,
        shippingCost, paymentVaName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<CartItem> cartItems,
            int addressId,
            String paymentMethod,
            String shippingService,
            int shippingCost,
            String paymentVaName)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(cartItems, addressId, paymentMethod, shippingService,
        shippingCost, paymentVaName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<CartItem> cartItems,
            int addressId,
            String paymentMethod,
            String shippingService,
            int shippingCost,
            String paymentVaName)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(cartItems, addressId, paymentMethod, shippingService,
          shippingCost, paymentVaName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements CartItemState {
  const factory _Loaded(
      final List<CartItem> cartItems,
      final int addressId,
      final String paymentMethod,
      final String shippingService,
      final int shippingCost,
      final String paymentVaName) = _$LoadedImpl;

  List<CartItem> get cartItems;
  int get addressId;
  String get paymentMethod;
  String get shippingService;
  int get shippingCost;
  String get paymentVaName;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$CartItemStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'CartItemState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<CartItem> cartItems,
            int addressId,
            String paymentMethod,
            String shippingService,
            int shippingCost,
            String paymentVaName)
        loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<CartItem> cartItems,
            int addressId,
            String paymentMethod,
            String shippingService,
            int shippingCost,
            String paymentVaName)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<CartItem> cartItems,
            int addressId,
            String paymentMethod,
            String shippingService,
            int shippingCost,
            String paymentVaName)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements CartItemState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// Mocks generated by Mockito 5.4.2 from annotations
// in softdesign_marvel/test/unit/external/datasource/comics_datasource_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:softdesign_marvel/src/data/data/http_data_request.dart' as _i4;
import 'package:softdesign_marvel/src/external/driver/http_driver.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [HttpDriver].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpDriver extends _i1.Mock implements _i2.HttpDriver {
  @override
  _i3.Future<dynamic> request(_i4.HttpDataRequest? requestData) =>
      (super.noSuchMethod(
        Invocation.method(
          #request,
          [requestData],
        ),
        returnValue: _i3.Future<dynamic>.value(),
        returnValueForMissingStub: _i3.Future<dynamic>.value(),
      ) as _i3.Future<dynamic>);
}

/// A class which mocks [HttpDataRequest].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpDataRequest extends _i1.Mock implements _i4.HttpDataRequest {
  @override
  String get baseUrl => (super.noSuchMethod(
        Invocation.getter(#baseUrl),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);

  @override
  set baseUrl(String? _baseUrl) => super.noSuchMethod(
        Invocation.setter(
          #baseUrl,
          _baseUrl,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set path(String? _path) => super.noSuchMethod(
        Invocation.setter(
          #path,
          _path,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set httpMethod(String? _httpMethod) => super.noSuchMethod(
        Invocation.setter(
          #httpMethod,
          _httpMethod,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set body(dynamic _body) => super.noSuchMethod(
        Invocation.setter(
          #body,
          _body,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set queryString(dynamic _queryString) => super.noSuchMethod(
        Invocation.setter(
          #queryString,
          _queryString,
        ),
        returnValueForMissingStub: null,
      );

  @override
  String get url => (super.noSuchMethod(
        Invocation.getter(#url),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
}

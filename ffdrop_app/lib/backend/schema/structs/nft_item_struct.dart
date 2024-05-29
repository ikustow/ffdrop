// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NftItemStruct extends BaseStruct {
  NftItemStruct({
    String? address,
    String? owner,
    String? name,
    String? image,
  })  : _address = address,
        _owner = owner,
        _name = name,
        _image = image;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;
  bool hasAddress() => _address != null;

  // "owner" field.
  String? _owner;
  String get owner => _owner ?? '';
  set owner(String? val) => _owner = val;
  bool hasOwner() => _owner != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;
  bool hasImage() => _image != null;

  static NftItemStruct fromMap(Map<String, dynamic> data) => NftItemStruct(
        address: data['address'] as String?,
        owner: data['owner'] as String?,
        name: data['name'] as String?,
        image: data['image'] as String?,
      );

  static NftItemStruct? maybeFromMap(dynamic data) =>
      data is Map ? NftItemStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'address': _address,
        'owner': _owner,
        'name': _name,
        'image': _image,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
        'owner': serializeParam(
          _owner,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
      }.withoutNulls;

  static NftItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      NftItemStruct(
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
        owner: deserializeParam(
          data['owner'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'NftItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NftItemStruct &&
        address == other.address &&
        owner == other.owner &&
        name == other.name &&
        image == other.image;
  }

  @override
  int get hashCode => const ListEquality().hash([address, owner, name, image]);
}

NftItemStruct createNftItemStruct({
  String? address,
  String? owner,
  String? name,
  String? image,
}) =>
    NftItemStruct(
      address: address,
      owner: owner,
      name: name,
      image: image,
    );

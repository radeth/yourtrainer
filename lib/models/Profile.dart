/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;


/** This is an auto generated class representing the Profile type in your schema. */
class Profile extends amplify_core.Model {
  static const classType = const _ProfileModelType();
  final String id;
  final ProfileType? _profileType;
  final String? _profilePicture;
  final String? _name;
  final String? _userId;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  ProfileModelIdentifier get modelIdentifier {
      return ProfileModelIdentifier(
        id: id
      );
  }
  
  ProfileType get profileType {
    try {
      return _profileType!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get profilePicture {
    return _profilePicture;
  }
  
  String get name {
    try {
      return _name!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get userId {
    try {
      return _userId!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Profile._internal({required this.id, required profileType, profilePicture, required name, required userId, createdAt, updatedAt}): _profileType = profileType, _profilePicture = profilePicture, _name = name, _userId = userId, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Profile({String? id, required ProfileType profileType, String? profilePicture, required String name, required String userId}) {
    return Profile._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      profileType: profileType,
      profilePicture: profilePicture,
      name: name,
      userId: userId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Profile &&
      id == other.id &&
      _profileType == other._profileType &&
      _profilePicture == other._profilePicture &&
      _name == other._name &&
      _userId == other._userId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Profile {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("profileType=" + (_profileType != null ? amplify_core.enumToString(_profileType)! : "null") + ", ");
    buffer.write("profilePicture=" + "$_profilePicture" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("userId=" + "$_userId" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Profile copyWith({ProfileType? profileType, String? profilePicture, String? name, String? userId}) {
    return Profile._internal(
      id: id,
      profileType: profileType ?? this.profileType,
      profilePicture: profilePicture ?? this.profilePicture,
      name: name ?? this.name,
      userId: userId ?? this.userId);
  }
  
  Profile copyWithModelFieldValues({
    ModelFieldValue<ProfileType>? profileType,
    ModelFieldValue<String?>? profilePicture,
    ModelFieldValue<String>? name,
    ModelFieldValue<String>? userId
  }) {
    return Profile._internal(
      id: id,
      profileType: profileType == null ? this.profileType : profileType.value,
      profilePicture: profilePicture == null ? this.profilePicture : profilePicture.value,
      name: name == null ? this.name : name.value,
      userId: userId == null ? this.userId : userId.value
    );
  }
  
  Profile.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _profileType = amplify_core.enumFromString<ProfileType>(json['profileType'], ProfileType.values),
      _profilePicture = json['profilePicture'],
      _name = json['name'],
      _userId = json['userId'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'profileType': amplify_core.enumToString(_profileType), 'profilePicture': _profilePicture, 'name': _name, 'userId': _userId, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'profileType': _profileType,
    'profilePicture': _profilePicture,
    'name': _name,
    'userId': _userId,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<ProfileModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<ProfileModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final PROFILETYPE = amplify_core.QueryField(fieldName: "profileType");
  static final PROFILEPICTURE = amplify_core.QueryField(fieldName: "profilePicture");
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final USERID = amplify_core.QueryField(fieldName: "userId");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Profile";
    modelSchemaDefinition.pluralName = "Profiles";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PUBLIC,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Profile.PROFILETYPE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Profile.PROFILEPICTURE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Profile.NAME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Profile.USERID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _ProfileModelType extends amplify_core.ModelType<Profile> {
  const _ProfileModelType();
  
  @override
  Profile fromJson(Map<String, dynamic> jsonData) {
    return Profile.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Profile';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Profile] in your schema.
 */
class ProfileModelIdentifier implements amplify_core.ModelIdentifier<Profile> {
  final String id;

  /** Create an instance of ProfileModelIdentifier using [id] the primary key. */
  const ProfileModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'ProfileModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is ProfileModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}
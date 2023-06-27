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
import 'package:collection/collection.dart';


/** This is an auto generated class representing the Friendship type in your schema. */
class Friendship extends amplify_core.Model {
  static const classType = const _FriendshipModelType();
  final String id;
  final List<Message>? _Messages;
  final Profile? _Customer;
  final Profile? _Trainer;
  final TrainerConnectionState? _connectionState;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;
  final String? _friendshipCustomerId;
  final String? _friendshipTrainerId;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  FriendshipModelIdentifier get modelIdentifier {
      return FriendshipModelIdentifier(
        id: id
      );
  }
  
  List<Message>? get Messages {
    return _Messages;
  }
  
  Profile get Customer {
    try {
      return _Customer!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  Profile get Trainer {
    try {
      return _Trainer!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  TrainerConnectionState get connectionState {
    try {
      return _connectionState!;
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
  
  String get friendshipCustomerId {
    try {
      return _friendshipCustomerId!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get friendshipTrainerId {
    try {
      return _friendshipTrainerId!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  const Friendship._internal({required this.id, Messages, required Customer, required Trainer, required connectionState, createdAt, updatedAt, required friendshipCustomerId, required friendshipTrainerId}): _Messages = Messages, _Customer = Customer, _Trainer = Trainer, _connectionState = connectionState, _createdAt = createdAt, _updatedAt = updatedAt, _friendshipCustomerId = friendshipCustomerId, _friendshipTrainerId = friendshipTrainerId;
  
  factory Friendship({String? id, List<Message>? Messages, required Profile Customer, required Profile Trainer, required TrainerConnectionState connectionState, required String friendshipCustomerId, required String friendshipTrainerId}) {
    return Friendship._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      Messages: Messages != null ? List<Message>.unmodifiable(Messages) : Messages,
      Customer: Customer,
      Trainer: Trainer,
      connectionState: connectionState,
      friendshipCustomerId: friendshipCustomerId,
      friendshipTrainerId: friendshipTrainerId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Friendship &&
      id == other.id &&
      DeepCollectionEquality().equals(_Messages, other._Messages) &&
      _Customer == other._Customer &&
      _Trainer == other._Trainer &&
      _connectionState == other._connectionState &&
      _friendshipCustomerId == other._friendshipCustomerId &&
      _friendshipTrainerId == other._friendshipTrainerId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Friendship {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("connectionState=" + (_connectionState != null ? amplify_core.enumToString(_connectionState)! : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("friendshipCustomerId=" + "$_friendshipCustomerId" + ", ");
    buffer.write("friendshipTrainerId=" + "$_friendshipTrainerId");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Friendship copyWith({List<Message>? Messages, Profile? Customer, Profile? Trainer, TrainerConnectionState? connectionState, String? friendshipCustomerId, String? friendshipTrainerId}) {
    return Friendship._internal(
      id: id,
      Messages: Messages ?? this.Messages,
      Customer: Customer ?? this.Customer,
      Trainer: Trainer ?? this.Trainer,
      connectionState: connectionState ?? this.connectionState,
      friendshipCustomerId: friendshipCustomerId ?? this.friendshipCustomerId,
      friendshipTrainerId: friendshipTrainerId ?? this.friendshipTrainerId);
  }
  
  Friendship copyWithModelFieldValues({
    ModelFieldValue<List<Message>?>? Messages,
    ModelFieldValue<Profile>? Customer,
    ModelFieldValue<Profile>? Trainer,
    ModelFieldValue<TrainerConnectionState>? connectionState,
    ModelFieldValue<String>? friendshipCustomerId,
    ModelFieldValue<String>? friendshipTrainerId
  }) {
    return Friendship._internal(
      id: id,
      Messages: Messages == null ? this.Messages : Messages.value,
      Customer: Customer == null ? this.Customer : Customer.value,
      Trainer: Trainer == null ? this.Trainer : Trainer.value,
      connectionState: connectionState == null ? this.connectionState : connectionState.value,
      friendshipCustomerId: friendshipCustomerId == null ? this.friendshipCustomerId : friendshipCustomerId.value,
      friendshipTrainerId: friendshipTrainerId == null ? this.friendshipTrainerId : friendshipTrainerId.value
    );
  }
  
  Friendship.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _Messages = json['Messages'] is List
        ? (json['Messages'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Message.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _Customer = json['Customer']?['serializedData'] != null
        ? Profile.fromJson(new Map<String, dynamic>.from(json['Customer']['serializedData']))
        : null,
      _Trainer = json['Trainer']?['serializedData'] != null
        ? Profile.fromJson(new Map<String, dynamic>.from(json['Trainer']['serializedData']))
        : null,
      _connectionState = amplify_core.enumFromString<TrainerConnectionState>(json['connectionState'], TrainerConnectionState.values),
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null,
      _friendshipCustomerId = json['friendshipCustomerId'],
      _friendshipTrainerId = json['friendshipTrainerId'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'Messages': _Messages?.map((Message? e) => e?.toJson()).toList(), 'Customer': _Customer?.toJson(), 'Trainer': _Trainer?.toJson(), 'connectionState': amplify_core.enumToString(_connectionState), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'friendshipCustomerId': _friendshipCustomerId, 'friendshipTrainerId': _friendshipTrainerId
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'Messages': _Messages,
    'Customer': _Customer,
    'Trainer': _Trainer,
    'connectionState': _connectionState,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt,
    'friendshipCustomerId': _friendshipCustomerId,
    'friendshipTrainerId': _friendshipTrainerId
  };

  static final amplify_core.QueryModelIdentifier<FriendshipModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<FriendshipModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final MESSAGES = amplify_core.QueryField(
    fieldName: "Messages",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Message'));
  static final CUSTOMER = amplify_core.QueryField(
    fieldName: "Customer",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Profile'));
  static final TRAINER = amplify_core.QueryField(
    fieldName: "Trainer",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Profile'));
  static final CONNECTIONSTATE = amplify_core.QueryField(fieldName: "connectionState");
  static final FRIENDSHIPCUSTOMERID = amplify_core.QueryField(fieldName: "friendshipCustomerId");
  static final FRIENDSHIPTRAINERID = amplify_core.QueryField(fieldName: "friendshipTrainerId");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Friendship";
    modelSchemaDefinition.pluralName = "Friendships";
    
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
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Friendship.MESSAGES,
      isRequired: false,
      ofModelName: 'Message',
      associatedKey: Message.FRIEND
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasOne(
      key: Friendship.CUSTOMER,
      isRequired: true,
      ofModelName: 'Profile',
      associatedKey: Profile.ID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasOne(
      key: Friendship.TRAINER,
      isRequired: true,
      ofModelName: 'Profile',
      associatedKey: Profile.ID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Friendship.CONNECTIONSTATE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.enumeration)
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
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Friendship.FRIENDSHIPCUSTOMERID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Friendship.FRIENDSHIPTRAINERID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
  });
}

class _FriendshipModelType extends amplify_core.ModelType<Friendship> {
  const _FriendshipModelType();
  
  @override
  Friendship fromJson(Map<String, dynamic> jsonData) {
    return Friendship.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Friendship';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Friendship] in your schema.
 */
class FriendshipModelIdentifier implements amplify_core.ModelIdentifier<Friendship> {
  final String id;

  /** Create an instance of FriendshipModelIdentifier using [id] the primary key. */
  const FriendshipModelIdentifier({
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
  String toString() => 'FriendshipModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is FriendshipModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}
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
import 'package:amplify_core/amplify_core.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Friend type in your schema. */
@immutable
class Friend extends Model {
  static const classType = const _FriendModelType();
  final String id;
  final String? _name;
  final String? _messageText;
  final String? _imageUrl;
  final String? _time;
  final bool? _isMessageRead;
  final List<Message>? _Messages;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  FriendModelIdentifier get modelIdentifier {
      return FriendModelIdentifier(
        id: id
      );
  }
  
  String get name {
    try {
      return _name!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get messageText {
    try {
      return _messageText!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get imageUrl {
    return _imageUrl;
  }
  
  String get time {
    try {
      return _time!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  bool get isMessageRead {
    try {
      return _isMessageRead!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<Message>? get Messages {
    return _Messages;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Friend._internal({required this.id, required name, required messageText, imageUrl, required time, required isMessageRead, Messages, createdAt, updatedAt}): _name = name, _messageText = messageText, _imageUrl = imageUrl, _time = time, _isMessageRead = isMessageRead, _Messages = Messages, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Friend({String? id, required String name, required String messageText, String? imageUrl, required String time, required bool isMessageRead, List<Message>? Messages}) {
    return Friend._internal(
      id: id == null ? UUID.getUUID() : id,
      name: name,
      messageText: messageText,
      imageUrl: imageUrl,
      time: time,
      isMessageRead: isMessageRead,
      Messages: Messages != null ? List<Message>.unmodifiable(Messages) : Messages);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Friend &&
      id == other.id &&
      _name == other._name &&
      _messageText == other._messageText &&
      _imageUrl == other._imageUrl &&
      _time == other._time &&
      _isMessageRead == other._isMessageRead &&
      DeepCollectionEquality().equals(_Messages, other._Messages);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Friend {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("messageText=" + "$_messageText" + ", ");
    buffer.write("imageUrl=" + "$_imageUrl" + ", ");
    buffer.write("time=" + "$_time" + ", ");
    buffer.write("isMessageRead=" + (_isMessageRead != null ? _isMessageRead!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Friend copyWith({String? name, String? messageText, String? imageUrl, String? time, bool? isMessageRead, List<Message>? Messages}) {
    return Friend._internal(
      id: id,
      name: name ?? this.name,
      messageText: messageText ?? this.messageText,
      imageUrl: imageUrl ?? this.imageUrl,
      time: time ?? this.time,
      isMessageRead: isMessageRead ?? this.isMessageRead,
      Messages: Messages ?? this.Messages);
  }
  
  Friend.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _messageText = json['messageText'],
      _imageUrl = json['imageUrl'],
      _time = json['time'],
      _isMessageRead = json['isMessageRead'],
      _Messages = json['Messages'] is List
        ? (json['Messages'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Message.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'messageText': _messageText, 'imageUrl': _imageUrl, 'time': _time, 'isMessageRead': _isMessageRead, 'Messages': _Messages?.map((Message? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'name': _name, 'messageText': _messageText, 'imageUrl': _imageUrl, 'time': _time, 'isMessageRead': _isMessageRead, 'Messages': _Messages, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<FriendModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<FriendModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField MESSAGETEXT = QueryField(fieldName: "messageText");
  static final QueryField IMAGEURL = QueryField(fieldName: "imageUrl");
  static final QueryField TIME = QueryField(fieldName: "time");
  static final QueryField ISMESSAGEREAD = QueryField(fieldName: "isMessageRead");
  static final QueryField MESSAGES = QueryField(
    fieldName: "Messages",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Message'));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Friend";
    modelSchemaDefinition.pluralName = "Friends";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Friend.NAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Friend.MESSAGETEXT,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Friend.IMAGEURL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Friend.TIME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Friend.ISMESSAGEREAD,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Friend.MESSAGES,
      isRequired: false,
      ofModelName: 'Message',
      associatedKey: Message.FRIEND
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _FriendModelType extends ModelType<Friend> {
  const _FriendModelType();
  
  @override
  Friend fromJson(Map<String, dynamic> jsonData) {
    return Friend.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Friend';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Friend] in your schema.
 */
@immutable
class FriendModelIdentifier implements ModelIdentifier<Friend> {
  final String id;

  /** Create an instance of FriendModelIdentifier using [id] the primary key. */
  const FriendModelIdentifier({
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
  String toString() => 'FriendModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is FriendModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}
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


/** This is an auto generated class representing the Friend type in your schema. */
class Friend extends amplify_core.Model {
  static const classType = const _FriendModelType();
  final String id;
  final String? _name;
  final String? _messageText;
  final String? _imageUrl;
  final String? _time;
  final bool? _isMessageRead;
  final List<Message>? _Messages;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

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
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get messageText {
    try {
      return _messageText!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
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
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  bool get isMessageRead {
    try {
      return _isMessageRead!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<Message>? get Messages {
    return _Messages;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Friend._internal({required this.id, required name, required messageText, imageUrl, required time, required isMessageRead, Messages, createdAt, updatedAt}): _name = name, _messageText = messageText, _imageUrl = imageUrl, _time = time, _isMessageRead = isMessageRead, _Messages = Messages, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Friend({String? id, required String name, required String messageText, String? imageUrl, required String time, required bool isMessageRead, List<Message>? Messages}) {
    return Friend._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
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
  
  Friend copyWithModelFieldValues({
    ModelFieldValue<String>? name,
    ModelFieldValue<String>? messageText,
    ModelFieldValue<String?>? imageUrl,
    ModelFieldValue<String>? time,
    ModelFieldValue<bool>? isMessageRead,
    ModelFieldValue<List<Message>?>? Messages
  }) {
    return Friend._internal(
      id: id,
      name: name == null ? this.name : name.value,
      messageText: messageText == null ? this.messageText : messageText.value,
      imageUrl: imageUrl == null ? this.imageUrl : imageUrl.value,
      time: time == null ? this.time : time.value,
      isMessageRead: isMessageRead == null ? this.isMessageRead : isMessageRead.value,
      Messages: Messages == null ? this.Messages : Messages.value
    );
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
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'messageText': _messageText, 'imageUrl': _imageUrl, 'time': _time, 'isMessageRead': _isMessageRead, 'Messages': _Messages?.map((Message? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'name': _name,
    'messageText': _messageText,
    'imageUrl': _imageUrl,
    'time': _time,
    'isMessageRead': _isMessageRead,
    'Messages': _Messages,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<FriendModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<FriendModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final MESSAGETEXT = amplify_core.QueryField(fieldName: "messageText");
  static final IMAGEURL = amplify_core.QueryField(fieldName: "imageUrl");
  static final TIME = amplify_core.QueryField(fieldName: "time");
  static final ISMESSAGEREAD = amplify_core.QueryField(fieldName: "isMessageRead");
  static final MESSAGES = amplify_core.QueryField(
    fieldName: "Messages",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Message'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Friend";
    modelSchemaDefinition.pluralName = "Friends";
    
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
      key: Friend.NAME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Friend.MESSAGETEXT,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Friend.IMAGEURL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Friend.TIME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Friend.ISMESSAGEREAD,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Friend.MESSAGES,
      isRequired: false,
      ofModelName: 'Message',
      associatedKey: Message.FRIEND
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

class _FriendModelType extends amplify_core.ModelType<Friend> {
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
class FriendModelIdentifier implements amplify_core.ModelIdentifier<Friend> {
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
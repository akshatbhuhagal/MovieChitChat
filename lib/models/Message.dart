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

import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Message type in your schema. */
@immutable
class Message extends Model {
  static const classType = const _MessageModelType();
  final String id;
  final String? _fromUsername;
  final String? _fromId;
  final String? _movieId;
  final String? _timestamp;
  final String? _message;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  String? get fromUsername {
    return _fromUsername;
  }

  String? get fromId {
    return _fromId;
  }

  String? get movieId {
    return _movieId;
  }

  String? get timestamp {
    return _timestamp;
  }

  String? get message {
    return _message;
  }

  TemporalDateTime? get createdAt {
    return _createdAt;
  }

  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }

  const Message._internal({required this.id, fromUsername, fromId, movieId, timestamp, message, createdAt, updatedAt}): _fromUsername = fromUsername, _fromId = fromId, _movieId = movieId, _timestamp = timestamp, _message = message, _createdAt = createdAt, _updatedAt = updatedAt;

  factory Message({String? id, String? fromUsername, String? fromId, String? movieId, String? timestamp, String? message}) {
    return Message._internal(
        id: id == null ? UUID.getUUID() : id,
        fromUsername: fromUsername,
        fromId: fromId,
        movieId: movieId,
        timestamp: timestamp,
        message: message);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Message &&
        id == other.id &&
        _fromUsername == other._fromUsername &&
        _fromId == other._fromId &&
        _movieId == other._movieId &&
        _timestamp == other._timestamp &&
        _message == other._message;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Message {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("fromUsername=" + "$_fromUsername" + ", ");
    buffer.write("fromId=" + "$_fromId" + ", ");
    buffer.write("movieId=" + "$_movieId" + ", ");
    buffer.write("timestamp=" + "$_timestamp" + ", ");
    buffer.write("message=" + "$_message" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  Message copyWith({String? id, String? fromUsername, String? fromId, String? movieId, String? timestamp, String? message}) {
    return Message._internal(
        id: id ?? this.id,
        fromUsername: fromUsername ?? this.fromUsername,
        fromId: fromId ?? this.fromId,
        movieId: movieId ?? this.movieId,
        timestamp: timestamp ?? this.timestamp,
        message: message ?? this.message);
  }

  Message.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        _fromUsername = json['fromUsername'],
        _fromId = json['fromId'],
        _movieId = json['movieId'],
        _timestamp = json['timestamp'],
        _message = json['message'],
        _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
        _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;

  Map<String, dynamic> toJson() => {
    'id': id, 'fromUsername': _fromUsername, 'fromId': _fromId, 'movieId': _movieId, 'timestamp': _timestamp, 'message': _message, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField FROMUSERNAME = QueryField(fieldName: "fromUsername");
  static final QueryField FROMID = QueryField(fieldName: "fromId");
  static final QueryField MOVIEID = QueryField(fieldName: "movieId");
  static final QueryField TIMESTAMP = QueryField(fieldName: "timestamp");
  static final QueryField MESSAGE = QueryField(fieldName: "message");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Message";
    modelSchemaDefinition.pluralName = "Messages";

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
        key: Message.FROMUSERNAME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Message.FROMID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Message.MOVIEID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Message.TIMESTAMP,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Message.MESSAGE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)
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

class _MessageModelType extends ModelType<Message> {
  const _MessageModelType();

  @override
  Message fromJson(Map<String, dynamic> jsonData) {
    return Message.fromJson(jsonData);
  }
}
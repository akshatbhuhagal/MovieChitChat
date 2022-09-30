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


/** This is an auto generated class representing the Movie type in your schema. */
@immutable
class Movie extends Model {
  static const classType = const _MovieModelType();
  final String id;
  final String? _img;
  final String? _rating;
  final String? _title;
  final String? _overview;
  final String? _recentMessage;
  final String? _recentMessageTim;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  String? get img {
    return _img;
  }

  String? get rating {
    return _rating;
  }

  String? get title {
    return _title;
  }

  String? get overview {
    return _overview;
  }

  String? get recentMessage {
    return _recentMessage;
  }

  String? get recentMessageTim {
    return _recentMessageTim;
  }

  TemporalDateTime? get createdAt {
    return _createdAt;
  }

  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }

  const Movie._internal({required this.id, img, rating, title, overview, recentMessage, recentMessageTim, createdAt, updatedAt}): _img = img, _rating = rating, _title = title, _overview = overview, _recentMessage = recentMessage, _recentMessageTim = recentMessageTim, _createdAt = createdAt, _updatedAt = updatedAt;

  factory Movie({String? id, String? img, String? rating, String? title, String? overview, String? recentMessage, String? recentMessageTim}) {
    return Movie._internal(
        id: id == null ? UUID.getUUID() : id,
        img: img,
        rating: rating,
        title: title,
        overview: overview,
        recentMessage: recentMessage,
        recentMessageTim: recentMessageTim);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Movie &&
        id == other.id &&
        _img == other._img &&
        _rating == other._rating &&
        _title == other._title &&
        _overview == other._overview &&
        _recentMessage == other._recentMessage &&
        _recentMessageTim == other._recentMessageTim;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Movie {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("img=" + "$_img" + ", ");
    buffer.write("rating=" + "$_rating" + ", ");
    buffer.write("title=" + "$_title" + ", ");
    buffer.write("overview=" + "$_overview" + ", ");
    buffer.write("recentMessage=" + "$_recentMessage" + ", ");
    buffer.write("recentMessageTim=" + "$_recentMessageTim" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  Movie copyWith({String? id, String? img, String? rating, String? title, String? overview, String? recentMessage, String? recentMessageTim}) {
    return Movie._internal(
        id: id ?? this.id,
        img: img ?? this.img,
        rating: rating ?? this.rating,
        title: title ?? this.title,
        overview: overview ?? this.overview,
        recentMessage: recentMessage ?? this.recentMessage,
        recentMessageTim: recentMessageTim ?? this.recentMessageTim);
  }

  Movie.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        _img = json['img'],
        _rating = json['rating'],
        _title = json['title'],
        _overview = json['overview'],
        _recentMessage = json['recentMessage'],
        _recentMessageTim = json['recentMessageTim'],
        _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
        _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;

  Map<String, dynamic> toJson() => {
    'id': id, 'img': _img, 'rating': _rating, 'title': _title, 'overview': _overview, 'recentMessage': _recentMessage, 'recentMessageTim': _recentMessageTim, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField IMG = QueryField(fieldName: "img");
  static final QueryField RATING = QueryField(fieldName: "rating");
  static final QueryField TITLE = QueryField(fieldName: "title");
  static final QueryField OVERVIEW = QueryField(fieldName: "overview");
  static final QueryField RECENTMESSAGE = QueryField(fieldName: "recentMessage");
  static final QueryField RECENTMESSAGETIM = QueryField(fieldName: "recentMessageTim");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Movie";
    modelSchemaDefinition.pluralName = "Movies";

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
        key: Movie.IMG,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Movie.RATING,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Movie.TITLE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Movie.OVERVIEW,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Movie.RECENTMESSAGE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Movie.RECENTMESSAGETIM,
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

class _MovieModelType extends ModelType<Movie> {
  const _MovieModelType();

  @override
  Movie fromJson(Map<String, dynamic> jsonData) {
    return Movie.fromJson(jsonData);
  }
}
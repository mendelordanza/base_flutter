import "package:gql/ast.dart" as ast;
import 'package:graphql/client.dart';
import 'package:widget_cheatsheet/core/network/graphql/queries.dart';

import 'mutations.dart';

ast.DocumentNode addFragments(
    ast.DocumentNode doc, List<ast.DocumentNode> fragments) {
  final newDefinitions = Set<ast.DefinitionNode>.from(doc.definitions);
  for (final frag in fragments) {
    newDefinitions.addAll(frag.definitions);
  }
  return ast.DocumentNode(definitions: newDefinitions.toList(), span: doc.span);
}

class QueryName {
  static String me = 'me';
}

class MutationName {
  static String createMood = 'createMoodEntry';
}

class GraphDocumentNodeBuilder {
  static late Map<String, ast.DocumentNode> queries;
  static late Map<String, ast.DocumentNode> mutations;

  static Future<void> build() async {
    queries = {
      QueryName.me: addFragments(
        gql(Queries.me),
        [],
      ),
    };

    mutations = {
      MutationName.createMood: addFragments(
        gql(Mutations.createMood),
        [],
      ),
    };
  }
}

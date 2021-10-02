import "package:gql/ast.dart" as ast;
import 'package:graphql/client.dart';

class GraphqlClient {
  String apiUrl = "your api";

  Future<Link> getLink() async {
    final _token = "your token";

    final _httpLink = HttpLink("https://$apiUrl");
    if (_token == null || _token.isEmpty) {
      return _httpLink;
    } else {
      return AuthLink(getToken: () async {
        return "Bearer $_token";
      }).concat(
        _httpLink,
      );
    }
  }

  Future<GraphQLClient> getClient() async {
    GraphQLClient client = GraphQLClient(
      /// **NOTE** The default store is the InMemoryStore, which does NOT persist to disk
      cache: GraphQLCache(),
      link: await getLink(),
    );
    return client;
  }

  Future<QueryResult> query(
      {required ast.DocumentNode document, Map<String, dynamic>? variables}) async {
    QueryOptions options;
    if (variables != null) {
      options = QueryOptions(document: document, variables: variables);
    } else {
      options = QueryOptions(document: document);
    }

    final client = await getClient();
    final QueryResult result = await client.query(options);
    return result;
  }

  Future<ObservableQuery> watchQuery(
      {required ast.DocumentNode document, Map<String, dynamic>? variables}) async {
    WatchQueryOptions options;
    if (variables != null) {
      options = WatchQueryOptions(fetchResults: true, document: document, variables: variables);
    } else {
      options = WatchQueryOptions(fetchResults: true, document: document);
    }

    final client = await getClient();
    final ObservableQuery observableQuery = await client.watchQuery(options);
    return observableQuery;
  }

  Future<QueryResult> mutation(
      {required ast.DocumentNode document, Map<String, dynamic>? variables}) async {
    MutationOptions options;
    if (variables != null) {
      options = MutationOptions(document: document, variables: variables);
    } else {
      options = MutationOptions(document: document);
    }

    final client = await getClient();
    final QueryResult result = await client.mutate(options);
    return result;
  }
}

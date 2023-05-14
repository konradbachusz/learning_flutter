import 'package:moor_flutter/moor_flutter.dart';
part 'moor_db.g.dart';

class BlogPosts extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 80)();
  TextColumn get content => text().nullable()();
  DateTimeColumn get date => dateTime().nullable()();
}

@UseMoor(tables: [BlogPosts])
class BlogDb extends _$BlogDb {
  BlogDb() : super(FlutterQueryExecutor.inDatabaseFolder(path: 'blog.db'));
  @override
  int get schemaVersion => 1;

  Future<List<BlogPost>> getPosts() => (select(blogPosts)
        ..orderBy([
          (post) => OrderingTerm(expression: post.date, mode: OrderingMode.desc)
        ]))
      .get();

  Future<int> insertPost(BlogPost post) => into(blogPosts).insert(post);
  Future<bool> updatePost(BlogPost post) => update(blogPosts).replace(post);
  Future<int> deletePost(BlogPost post) => delete(blogPosts).delete(post);
}

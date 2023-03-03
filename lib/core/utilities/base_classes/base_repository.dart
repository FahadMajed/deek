import 'package:deek/core/utilities/utilities.dart';

class Repository<T, E> {
  final RemoteDatabase<T, E> remoteDatabase;

  Repository({required this.remoteDatabase});

  final Map<String, T> collection = {};
  final Map<String, E> subCollection = {};

  Future<void> create(T object, String id) async {
    collection[id] = object;
    await remoteDatabase.createDocument(object, id);
  }

  Future<T> getById(String id) async {
    if (collection.containsKey(id)) {
      return collection[id]!;
    }
    return await remoteDatabase.getDocument(id);
  }

  //retrieves all docs in the collection
  Future<List<T>> getAll({int? limit}) async {
    final docs = await remoteDatabase.getDocuments(limit);
    return docs;
  }

  Future<void> update(T object, String id) async {
    collection.update(id, (value) => collection[id] = object);

    await remoteDatabase.updateDocument(object, id);
  }

  Future<void> delete(String id) async {
    collection.removeWhere((key, value) => key == id);

    await remoteDatabase.deleteDocument(id);
  }
}

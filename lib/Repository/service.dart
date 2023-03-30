import 'package:assignment_3/Repository/repository.dart';
import 'package:assignment_3/Data/Model/data.dart';

class Service {
  Repository? _repository;

  Service() {
    _repository = Repository();
  }

  saveItem(Item item) async {
    return await _repository!.insertData('item', item.toJson());
  }

  readItem() async {
    return await _repository!.readData('item');
  }

  deleteItem(dispatchId) async {
    return await _repository!.deleteData('item', dispatchId);
  }
}

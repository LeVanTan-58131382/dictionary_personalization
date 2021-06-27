import 'package:dictionary_personalization/common/services/networking.dart';
import 'package:dictionary_personalization/models/unit_knowledge.dart';

class UnitKnowledgeViewModel {
  Future<dynamic> getListUnitKnowledge(String apiUrl) async
  {
    NetworkHelper networkHelper = NetworkHelper(apiUrl);

    var data = await networkHelper.getData(); // du lieu dang o dang jsonDecode

    List<dynamic> arrayData = data["listUnitKnowledge"]; // lay du lieu co key="listUnitKnowledge"

    final List<UnitKnowledgeModel> listUnitKnowledge =
    arrayData.map((unitKnowledge) => UnitKnowledgeModel.fromJson(unitKnowledge)).toList();

    return listUnitKnowledge;
  }

  Future<dynamic> getUnitKnowledgeById(String apiUrl, int id) async
  {
    NetworkHelper networkHelper = NetworkHelper(apiUrl+id.toString());

    var data = await networkHelper.getData();

    var newData = data["unitKnowledge"];

    final UnitKnowledgeModel unitKnowledge = UnitKnowledgeModel.fromJson(newData);

    return unitKnowledge;
  }
}
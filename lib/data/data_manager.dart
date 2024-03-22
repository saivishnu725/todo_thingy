int findMaxId(List<Map<dynamic, dynamic>> listOfMaps) {
  if (listOfMaps.isEmpty) {
    return 0;
  }

  int maxId = 0; // Initialize with a default value

  // Iterate over each map in the list
  for (Map<dynamic, dynamic> map in listOfMaps) {
    // Check if the map contains the 'id' key
    if (map.containsKey('id')) {
      // Extract the 'id' value and convert it to an integer
      int id = map['id'];

      // Update maxId if the current 'id' is greater
      if (id > maxId) {
        maxId = id;
      }
    }
  }

  return maxId;
}





/*
*************** OLD CODE ***************
  // Method to load data from SharedPreferences
  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('dataList');
    if (jsonString != null) {
      setState(() {
        dataList = List<Map<String, dynamic>>.from(json.decode(jsonString));
      });
    }
  }

  // Method to save data to SharedPreferences
  Future<void> saveData() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = json.encode(dataList);
    await prefs.setString('dataList', jsonString);
  }

  // Add a sample item to the list
  void addItem(newData) {
    setState(() {
      dataList.add(newData); // Add your desired map here
      saveData(); // Save data after adding the item
    });
  }
 */
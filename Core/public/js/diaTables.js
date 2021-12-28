class DiaTables {
  getStructureValue(colName, structureParam, defaultReturnParam, tableStructure, addItallic) {
    if (tableStructure[colName]) {
      if (tableStructure[colName][structureParam]) {
        return tableStructure[colName][structureParam];
      } else {
        if (addItallic) {
          return "<i color='green'>" + defaultReturnParam + "</i>";
        } else {
          return defaultReturnParam;
        }
      }
    }
  }
}
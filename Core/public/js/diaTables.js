class DiaTables {
  getStructureValue(colName, structureParam, defaultReturnParam) {
    if (this.tableStructure[colName]) {
      if (this.tableStructure[colName][structureParam]) {
        if (this.tableStructure[colName][structureParam]) return this.tableStructure[colName][structureParam];
        else return defaultReturnParam;
      }
    }
  }
}
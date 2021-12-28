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

  checkRequiredsInputs(e, _this) {
    _this.emptyRequiredInputs = [];

    Object.keys(_this.formValues).forEach((item) => {
      if (_this.tableStructure[item]['required'] == true) {
        if (_this.formValues[item] == "") {
          _this.emptyRequiredInputs.push(item);
        }
      }
    })

    if (_this.emptyRequiredInputs.length < 1) {
      // If return TRUE form POST
      return true;
    }

    // Neodosli formular
    e.preventDefault();
  }

  validateInput(_this, item) {
    return {
      'required': _this.emptyRequiredInputs.includes(item)
    }
  }
}
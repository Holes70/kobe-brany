class Functions {

  /**
   * Limit string length
   * @param {string} item 
   * @param {int} limit 
   * @returns 
   */
  limitString(item, limit) {
    if (limit && item.length > limit) {
      return item.substring(0, limit) + "...";
    } else {
      return item;
    }
  }

  /**
   * 
   * @param {object} color 
   * @param {string} item 
   * @return string radio-btn-color
   */
  getRadioColor(color, item) {
    if (color) {
      return color[item];
    } else {
      return 'light';
    }
  }

}
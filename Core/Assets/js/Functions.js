class Functions {

  limitString(item,limit) {
    if (limit && item.length > limit) {
      return item.substring(0, limit) + "...";
    } else {
      return item;
    }
  }

  getRadioColor(color, item) {
    if (color) {
      return color[item];
    } else {
      return 'light';
    }
  }

}
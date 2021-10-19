// src/components/App.js
import BaseButton from './BaseButton.js';

export default {
  name: 'App',
  data() {
    return {
      count: 0,
    };
  },
  render() {
    return Vue.h('div', [
      `Count: ${this.count}`,
      Vue.h(BaseButton, {
        onClick: () => { this.count += 1 },
      }, () => '+1'),
    ]);
  },
};
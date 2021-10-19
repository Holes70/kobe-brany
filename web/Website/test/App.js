// src/components/App.js
import BaseButton from './BaseButton.js';

export default {
  name: 'App',
  components: {
    BaseButton,
  },
  data() {
    return {
      count: 0,
    };
  },
  template: `
    <div>
      Count: {{ count }}
      <BaseButton @click="count += 1">
        +1
      </BaseButton>
    </div>
  `,
};
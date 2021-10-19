import { createApp } from "./vue.esm.js";

const Example = {
  template: `
    <div>
      Vue 3 component
    </div>
  `
};

export default {
  name: 'App',
  components: {
    Example,
  },
  data() {
    return {
      count: 0,
    };
  },
  template: `
    <div>
      <Example></Example>
    </div>
  `,
};

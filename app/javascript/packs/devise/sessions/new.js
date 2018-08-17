import Vue from 'vue/dist/vue.esm';
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';

import DeviseSessionsNewView from 'views/devise/sessions/new.vue';

Vue.use(ElementUI);

const integrationIndex = new Vue({
    el: '#devise-sessions-new-view',
    components: {
        'devise-sessions-new-view': DeviseSessionsNewView
    }
});

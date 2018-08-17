import Vue from 'vue/dist/vue.esm';
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';

import UserProfilesEditView from 'views/user_profiles/edit.vue';

Vue.use(ElementUI);

const integrationIndex = new Vue({
    el: '#user-profiles-edit-view',
    components: {
        'user-profiles-edit-view': UserProfilesEditView
    }
});

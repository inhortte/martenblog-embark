import Vue from 'vue';
import Router from 'vue-router';
import Poems from '../components/Poems.vue';

Vue.use(Router);

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Poems',
      component: Poems
    }
  ]
})

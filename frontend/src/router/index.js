import Vue from 'vue'
import VueRouter from 'vue-router'
import HomeView from '../views/HomeView.vue'

import ComplaintAllView from "@/views/anbd/ComplaintAllView"
import ComplaintView from "@/views/anbd/ComplaintView"

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView
  },
  {
    path: '/about',
    name: 'about',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/AboutView.vue')
  },
  {
    path: '/complaint-all-view',
    name: 'complaint-all-view',
    component: ComplaintAllView
  },
  {
    path: '/complaint-view/:boardType',
    name: 'complaint-view',
    components: {
      default: ComplaintView
    },
    props: {
      default: true
    }
  },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router

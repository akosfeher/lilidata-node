// import '@mdi/font/css/materialdesignicons.css'
import Vue from 'vue'
import Vuetify from 'vuetify'
import 'vuetify/dist/vuetify.min.css'
import colors from 'vuetify/es5/util/colors'
import { Ripple } from 'vuetify/lib/directives'
import VueI18n from 'vue-i18n'
import hu from 'vuetify/src/locale/hu'
import en from 'vuetify/src/locale/en'

Vue.use(VueI18n)
Vue.use(Vuetify, {
  directives: {
    Ripple,
  },
  icons: {
    iconfont: 'mdi',
  },
  theme: {
    primary: colors.blue.darken2,
    accent: colors.grey.darken3,
    secondary: colors.amber.darken3,
    info: colors.teal.lighten1,
    warning: colors.amber.base,
    error: colors.deepOrange.accent4,
    success: colors.green.accent3,
  },
  lang: {
    locales: { hu, en },
    current: 'hu',
  },
})

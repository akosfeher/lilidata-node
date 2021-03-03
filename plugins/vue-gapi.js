// plugins/vue-gapi.js

import Vue from 'vue'
import VueGapi from 'vue-gapi'

Vue.use(VueGapi, {
  // apiKey: 'AIzaSyBxfwXjclHDjn9LH2KbYWlDQ06cfr12FM8',
  apiKey: 'AIzaSyBrIwQMcRYUf2C3DG3wCoVWEpGigb-Y7JU',
  clientId:
    '756179933080-gj131c4ogp2etlehjpkripium829d2gh.apps.googleusercontent.com',
  /*
  clientId:
    '1068873494568-ss5mnerfnbrfns7lnq6h7n6mj378l2rp.apps.googleusercontent.com',

   */
  discoveryDocs: ['https://sheets.googleapis.com/$discovery/rest?version=v4'],
  scope: 'https://www.googleapis.com/auth/spreadsheets',
  // accessType: 'offline',
  // approvalPrompt: 'force',
})

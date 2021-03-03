<template>
  <v-row justify="center" align="center">
    <v-col cols="12" sm="8" md="6">
      <div class="text-center">
        <logo />
        <vuetify-logo />
      </div>
      <v-card>
        <v-card-title class="headline">
          Welcome to the Vuetify + Nuxt.js template
        </v-card-title>
        <v-card-text>
          <p>
            Vuetify is a progressive Material Design component framework for
            Vue.js. It was designed to empower developers to create amazing
            applications.
          </p>
          <p>
            For more information on Vuetify, check out the
            <a
              href="https://vuetifyjs.com"
              target="_blank"
              rel="noopener noreferrer"
            >
              documentation </a
            >.
          </p>
          <p>
            If you have questions, please join the official
            <a
              href="https://chat.vuetifyjs.com/"
              target="_blank"
              rel="noopener noreferrer"
              title="chat"
            >
              discord </a
            >.
          </p>
          <p>
            Find a bug? Report it on the github
            <a
              href="https://github.com/vuetifyjs/vuetify/issues"
              target="_blank"
              rel="noopener noreferrer"
              title="contribute"
            >
              issue board </a
            >.
          </p>
          <p>
            Thank you for developing with Vuetify and I look forward to bringing
            more exciting features in the future.
          </p>
          <div class="text-xs-right">
            <em><small>&mdash; John Leider</small></em>
          </div>
          <hr class="my-3" />
          <a
            href="https://nuxtjs.org/"
            target="_blank"
            rel="noopener noreferrer"
          >
            Nuxt Documentation
          </a>
          <br />
          <a
            href="https://github.com/nuxt/nuxt.js"
            target="_blank"
            rel="noopener noreferrer"
          >
            Nuxt GitHub
          </a>
        </v-card-text>
        <v-card-actions>
          <v-spacer />
          <v-btn outlined green @click="test">Test sheet</v-btn>
          <v-btn color="primary" nuxt to="/inspire"> Continue </v-btn>
        </v-card-actions>
      </v-card>
    </v-col>
  </v-row>
</template>

<script>
import Logo from '~/components/Logo.vue'
import VuetifyLogo from '~/components/VuetifyLogo.vue'

export default {
  components: {
    Logo,
    VuetifyLogo,
  },
  data: () => ({
    gapi: undefined,
    languages: [
      {
        id: 'en',
        title: 'English',
        flagSrc: 'united-states.png',
      },
      {
        id: 'hu',
        title: 'Magyar',
        flagSrc: 'hungary.png',
      },
      {
        id: 'ro',
        title: 'Romanian',
        flagSrc: 'romania.png',
      },
      {
        id: 'po',
        title: 'Polish',
        flagSrc: 'poland.png',
      },
      {
        id: 'sl',
        title: 'Slovenian',
        flagSrc: 'slovenia.png',
      },
    ],
    SPREADSHEET_ID: '1xpwuj9zpQICdHPWNvNuazGVe7JNOUBgfkHHxQIPT_iA',
    SPREADSHEET_ID_NEW: '1Za64uLnGEH6Pe4wvJWzCsyQFDVcOm1k2QPxhYblFzVc',
    /*
    CLIENT_ID:
      '1068873494568-ss5mnerfnbrfns7lnq6h7n6mj378l2rp.apps.googleusercontent.com',
    API_KEY: 'AIzaSyBxfwXjclHDjn9LH2KbYWlDQ06cfr12FM8',

     */
    CLIENT_ID:
      '756179933080-gj131c4ogp2etlehjpkripium829d2gh.apps.googleusercontent.com',
    API_KEY: 'AIzaSyBrIwQMcRYUf2C3DG3wCoVWEpGigb-Y7JU',
    SCOPE: 'https://www.googleapis.com/auth/spreadsheets',
  }),
  mounted() {
    console.log('mounted')
    this.init()
  },
  methods: {
    async test() {
      console.log('test')
      const valueRangeBody = {
        majorDimension: 'ROWS', // log each entry as a new row (vs column)
        values: [['1111', 'aaaa']], // convert the object's values to an array
      }

      const params = {
        // The ID of the spreadsheet to update.
        spreadsheetId: this.SPREADSHEET_ID,
        // The A1 notation of a range to search for a logical table of data.Values will be appended after the last row of the table.
        range: 'Sheet1', // this is the default spreadsheet name, so unless you've changed it, or are submitting to multiple sheets, you can leave this
        // How the input data should be interpreted.
        valueInputOption: 'RAW', // RAW = if no conversion or formatting of submitted data is needed. Otherwise USER_ENTERED
        // How the input data should be inserted.
        insertDataOption: 'INSERT_ROWS', // Choose OVERWRITE OR INSERT_ROWS
      }

      const request = await this.gapi.client.sheets.spreadsheets.values.append(
        params,
        valueRangeBody
      )
      console.log('request', request)
    },
    async init() {
      this.gapi = await this.$gapi.getGapiClient()
      console.log('login', this.gapi)
      const accessToken = ''
      const refreshCode = ''
      if (!this.gapi.auth2.getAuthInstance().currentUser.get().isSignedIn()) {
        const GoogleAuth = this.gapi.auth2.getAuthInstance()

        GoogleAuth.signIn()

        /*
        const respgr = await GoogleAuth.grantOfflineAccess()

        console.log('offlineCode', respgr.code)

        refreshCode = respgr.code
*/
        console.log('signin GoogleAuth', GoogleAuth)

        const GoogleUser = GoogleAuth.currentUser.get()

        console.log('signIn, GoogleUser', GoogleUser)

        // accessToken = GoogleUser.uc.access_token // Get access_token
        console.log('accessToken', accessToken)
      } else {
        const GoogleAuth = this.gapi.auth2.getAuthInstance()
        /*
        const respgr = await GoogleAuth.grantOfflineAccess()

        console.log('offlineCode', respgr.code)

        refreshCode = respgr.code
*/
        console.log('GoogleAuth', GoogleAuth)

        const GoogleUser = GoogleAuth.currentUser.get()

        console.log('GoogleUser', GoogleUser)

        // accessToken = GoogleUser.uc.access_token // Get access_token
        console.log('accessToken', accessToken, 'refreshCode', refreshCode)
      }
    },
  },
}
</script>

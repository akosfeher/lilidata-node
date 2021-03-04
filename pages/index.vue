<template>
  <v-app id="questionary" style="background-color: #eeeeee">
    <LanguageSwitcher :languages="languages" :current-language="$i18n.locale" />
    <v-card
      max-width="600"
      class="mx-auto"
      elevation="0"
      style="background-color: #eeeeee; padding-left: 0; padding-right: 0"
    >
      <v-system-bar color="#aaaaaa" height="10px">
        <v-spacer></v-spacer>
      </v-system-bar>

      <v-app-bar color="white">
        <v-toolbar-title>{{ $t('questionary') }}</v-toolbar-title>

        <v-spacer></v-spacer>
      </v-app-bar>

      <v-container style="padding-left: 0; padding-right: 0">
        <v-row dense>
          <v-col cols="12">
            <v-card color="white" style="padding-left: 0; padding-right: 0">
              <v-card-subtitle>{{ $t('question.1') }}</v-card-subtitle>
              <v-card style="padding-left: 20px; padding-right: 0">
                <v-radio-group v-model="radioColor">
                  <v-radio
                    color="blue"
                    v-for="n in 3"
                    :key="n"
                    :label="color(n)"
                    :value="n"
                  ></v-radio>
                </v-radio-group>
              </v-card>
            </v-card>
          </v-col>

          <v-col>
            <v-card color="white" style="padding-left: 0; padding-right: 0">
              <v-card-subtitle>{{ $t('question.2') }}</v-card-subtitle>
              <v-card style="padding-left: 30px; padding-right: 0">
                <v-row align-content="center">
                  <div style="padding-top: 10px">{{ $t('notatall') }}</div>
                  <v-rating
                    v-model="rating"
                    empty-icon="mdi-circle-outline"
                    full-icon="mdi-radiobox-marked"
                    color="blue"
                    icon-label="custom icon label text {0} of {1}"
                  ></v-rating>
                  <div style="padding-top: 10px">{{ $t('totaly') }}</div></v-row
                >
                <br />
              </v-card>
            </v-card>
          </v-col>

          <v-col v-for="(item, i) in items1" :key="i" cols="12">
            <v-card :color="item.color" dark>
              <div class="d-flex flex-no-wrap justify-space-between">
                <div>
                  <v-card-title
                    class="headline"
                    v-text="item.title"
                  ></v-card-title>

                  <v-card-subtitle v-text="item.artist"></v-card-subtitle>

                  <v-card-actions>
                    <v-btn
                      v-if="item.artist === 'Ellie Goulding'"
                      class="ml-2 mt-3"
                      fab
                      icon
                      height="40px"
                      right
                      width="40px"
                    >
                      <v-icon>mdi-play</v-icon>
                    </v-btn>

                    <v-btn v-else class="ml-2 mt-5" outlined rounded small>
                      START RADIO
                    </v-btn>
                  </v-card-actions>
                </div>

                <v-avatar class="ma-3" size="125" tile>
                  <v-img :src="item.src"></v-img>
                </v-avatar>
              </div>
            </v-card>
          </v-col>
        </v-row>
        <v-row style="padding-left: 10px"
          ><v-btn>{{ $t('next') }}</v-btn></v-row
        >
      </v-container>
    </v-card>
  </v-app>
</template>

<script>
import Logo from '~/components/Logo.vue'
import VuetifyLogo from '~/components/VuetifyLogo.vue'
import LanguageSwitcher from '~/components/LanguageSwitcher'

export default {
  components: {
    Logo,
    VuetifyLogo,
    LanguageSwitcher,
  },
  data: () => ({
    gapi: undefined,
    radioColor: 0,
    rating: 0,
    items1: [],
    items: [
      {
        color: '#1F7087',
        src: 'https://cdn.vuetifyjs.com/images/cards/foster.jpg',
        title: 'Supermodel',
        artist: 'Foster the People',
      },
      {
        color: '#952175',
        src: 'https://cdn.vuetifyjs.com/images/cards/halcyon.png',
        title: 'Halcyon Days',
        artist: 'Ellie Goulding',
      },
    ],

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
  computed: {
    colors() {
      const ret = []
      ret.push(this.$t('red'))
      ret.push(this.$t('green'))
      ret.push(this.$t('blue'))
      return ret
    },
  },
  mounted() {
    console.log('mounted')
    this.init()
  },
  methods: {
    color(n) {
      return this.colors[n - 1]
    },
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
<style>
* {
  text-transform: none !important;
}
</style>

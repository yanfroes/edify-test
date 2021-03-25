<template>
  <div class="container">
    <div>
      <h3>Sign In</h3>
      <form @submit.prevent="signin">
        <div v-if="error">{{ error }}</div>

        <div>
          <label for="email" class="label">E-mail Address</label><br>
          <input type="email" v-model="email" class="input" id="email" placeholder="yan@edifyonline.com">
        </div>
        <div>
          <label for="password" class="label">Password</label><br>
          <input type="password" v-model="password" class="input" id="password" placeholder="Password">
        </div>
        <div><br>
          <button type="submit" class="btn btn-primary">Sign In</button>
          <router-link to="/signup"><button class="btn btn-dark">Sign Up</button></router-link>
       </div>
      </form>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Signin',
  data () {
    return {
      email: '',
      password: '',
      error: ''
    }
  },
  created () {
    this.checkSignedIn()
  },
  updated () {
    this.checkSignedIn()
  },
  methods: {
    signin () {
      this.$http.plain.post('/signin', { email: this.email, password: this.password })
        .then(response => this.signinSuccessful(response))
        .catch(error => this.signinFailed(error))
    },
    signinSuccessful (response) {
      if (!response.data.csrf) {
        this.signinFailed(response)
        return
      }
      localStorage.csrf = response.data.csrf
      localStorage.signedIn = true
      this.error = ''
      this.$router.replace('/pets')
    },
    signinFailed (error) {
      this.error = (error.response && error.response.data && error.response.data.error) || ''
      delete localStorage.csrf
      delete localStorage.signedIn
    },
    checkSignedIn () {
      if (localStorage.signedIn) {
        this.$router.replace('/pets')
      }
    }
  }
}
</script>

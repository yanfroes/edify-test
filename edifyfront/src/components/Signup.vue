<template>
  <div class="container">
    <div>
      <h3>Sign Up</h3>
      <form @submit.prevent="signup">
        <div v-if="error">{{ error }}</div>

        <div class="mb-6">
          <label for="name" class="label">Name</label><br>
          <input type="name" v-model="name" class="input" id="name" placeholder="Yan Fróes">
        </div>

        <div class="mb-6">
          <label for="email" class="label">E-mail Address</label><br>
          <input type="email" v-model="email" class="input" id="email" placeholder="yan@edifyonline.com">
        </div>

        <div class="mb-6">
          <label for="password" class="label">Password</label><br>
          <input type="password" v-model="password" class="input" id="password" placeholder="Password">
        </div>

        <div class="mb-6">
          <label for="newPet" class="label">Pet Name</label><br>
          <input type="newPet" v-model="newPet.name" class="input" id="petname" placeholder="Pet name">
        </div><br>
        <button type="submit" class="btn btn-dark">Sign Up</button>
        <router-link to="/"><button class="btn btn-primary">Sign In</button></router-link>
      </form>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Signup',
  data () {
    return {
      name: '',
      email: '',
      password: '',
      pets: [],
      newPet: [],
      error: ''
    }
  },
  created () {
    this.checkedSignedIn()
  },
  updated () {
    this.checkedSignedIn()
  },
  methods: {
    signup () {
      this.$http.plain.post('/signup', { name: this.name, email: this.email, password: this.password })
        .then(response => this.signupSuccessful(response))
        .catch(error => this.signupFailed(error))
    },
    signupSuccessful (response) {
      if (!response.data.csrf) {
        this.signupFailed(response)
        return
      }

      this.$http.secured.post('/api/v1/pets/', { pet: { name: this.newPet.name } })
      localStorage.csrf = response.data.csrf
      localStorage.signedIn = true
      this.error = ''
      this.$router.replace('/pets')
    },
    signupFailed (error) {
      this.error = (error.response && error.response.data && error.response.data.error) || 'Something went wrong'
      delete localStorage.csrf
      delete localStorage.signedIn
    },
    checkedSignedIn () {
      if (localStorage.signedIn) {
        this.$router.replace('/pets')
      }
    }
  }
}
</script>

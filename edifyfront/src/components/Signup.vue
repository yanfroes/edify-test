<template>
  <div class="max-w-sm m-auto my-8">
    <div class="border p-10 border-grey-light shadow rounded">
      <h3 class="text-2xl mb-6 text-grey-darkest">Sign Up</h3>
      <form @submit.prevent="signup">
        <div class="text-red" v-if="error">{{ error }}</div>

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
        </div>

        <button type="submit" class="font-sans font-bold px-4 rounded cursor-pointer no-underline bg-green hover:bg-green-dark block w-full py-4 items-center justify-center">Sign Up</button>

        <div class="my-4"><router-link to="/" class="link-grey">Sign In</router-link></div>
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

      localStorage.csrf = response.data.csrf
      localStorage.signedIn = true
      this.error = ''
      this.$router.replace('/pets')
      this.$http.secured.post('/api/v1/pets/', { pet: { name: this.newPet.name } })
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

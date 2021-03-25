<template>
  <header>
    <div class="container">
      <div class="btn-group" role="group">
        <a href="/"><img src="@/assets/icon-edify.jpeg" style="max-height:50px" /></a>
        <router-link to="/" v-if="!signedIn()"><button type="button" class="btn btn-primary">Sign in</button></router-link>
        <router-link to="/signup" v-if="!signedIn()"><button type="button" class="btn btn-primary">Sign Up</button></router-link>
        <router-link to="/pets" v-if="signedIn()"><button type="button" class="btn btn-primary">Pets</button></router-link>
        <a href="#" @click.prevent="signOut" v-if="signedIn()"><button type="button" class="btn btn-primary">Sign out</button></a>
      </div>
    </div><br>
  </header>
</template>

<script>
export default {
  name: 'Header',
  created () {
    this.signedIn()
  },
  methods: {
    setError (error, text) {
      this.error = (error.response && error.response.data && error.response.data.error) || text
    },
    signedIn () {
      return localStorage.signedIn
    },
    signOut () {
      this.$http.secured.delete('/signin')
        .then(response => {
          delete localStorage.csrf
          delete localStorage.signedIn
          this.$router.replace('/')
        })
        .catch(error => this.setError(error, 'Cannot sign out'))
    }
  }
}
</script>

<template>
  <div class="container">
    <div v-if="error">{{ error }}</div>
    <h3>Add a new pet</h3><br>
    <form action="" @submit.prevent="addPet">
      <div>
        <input class="input"
          autofocus autocomplete="off"
          placeholder="Name of your Pet"
          v-model="newPet.name" />
      </div><br>
      <input class="btn btn-success" type="submit" value="Add Pet" />
    </form>
    <hr />
    <div>
     <!--  PET ALERT -->
     <button class="btn btn-warning" v-on:click="petalert">PET ALERT</button>
    </div><br>

    <table class="table ">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Pet Name</th>
      <th scope="col">Actions</th>
    </tr>
  </thead>
  <tbody>
    <tr v-for="pet in pets" :key="pet.id" :pet="pet">
      <th scope="row">{{ pet.id }}</th>
      <td>{{ pet.name }}</td>
      <td><button class="btn btn-danger" @click.prevent="removePet(pet)">Delete</button></td>
    </tr>
  </tbody>
</table>
  </div>
</template>

<script>
export default {
  name: 'Pet',
  data () {
    return {
      pets: [],
      newPet: [],
      chosenName: '',
      error: ''
    }
  },
  created () {
    if (!localStorage.signedIn) {
      this.$router.replace('/')
    } else {
      this.$http.secured.get('/api/v1/pets')
        .then(response => { this.pets = response.data })
        .catch(error => this.setError(error, 'Something went wrong'))
    }
  },
  methods: {
    setError (error, text) {
      this.error = (error.response && error.response.data && error.response.data.error) || text
    },
    addPet () {
      const value = this.newPet
      if (!value) {
        return
      }
      this.$http.secured.post('/api/v1/pets/', { pet: { name: this.newPet.name } }).$router.replace('/pets')
        .then(response => {
          this.pets.push(response.data)
          this.newPet = ''
        })
        .catch(error => this.setError(error, 'Cannot create pet'))
    },
    removePet (pet) {
      this.$http.secured.delete(`/api/v1/pets/${pet.id}`)
        .then(response => {
          this.pets.splice(this.pets.indexOf(pet), 1)
        })
        .catch(error => this.setError(error, 'Cannot delete pet'))
    },
    petalert: function (pet) {
      var chosenNumber = Math.floor(Math.random() * this.pets.length)
      this.chosenName = this.pets[chosenNumber]
      alert('This ' + this.chosenName.name + ' is Fluffy!')
    }
  }
}
</script>

<template>
  <div class="max-w-md m-auto py-10">
    <div class="text-red" v-if="error">{{ error }}</div>
    <h3 class="font-mono font-regular text-3xl mb-4">Add a new pet</h3>
    <form action="" @submit.prevent="addPet">
      <div class="mb-6">
        <input class="input"
          autofocus autocomplete="off"
          placeholder="Type a Pet name"
          v-model="newPet.name" />
      </div>
      <input type="submit" value="Add Pet" class="font-sans font-bold px-4 rounded cursor-pointer no-underline bg-green hover:bg-green-dark block w-full py-4 text-white items-center justify-center" />
    </form>

    <hr class="border border-grey-light my-6" />

    <ul class="list-reset mt-4">
      <li class="py-4" v-for="pet in pets" :key="pet.id" :pet="pet">

        <div class="flex items-center justify-between flex-wrap">
          <p class="block flex-1 font-mono font-semibold flex items-center ">
            <svg class="fill-current text-indigo w-6 h-6 mr-2" viewBox="0 0 20 20" width="20" height="20"><title>Pet Name</title><path d="M15.75 8l-3.74-3.75a3.99 3.99 0 0 1 6.82-3.08A4 4 0 0 1 15.75 8zm-13.9 7.3l9.2-9.19 2.83 2.83-9.2 9.2-2.82-2.84zm-1.4 2.83l2.11-2.12 1.42 1.42-2.12 2.12-1.42-1.42zM10 15l2-2v7h-2v-5z"></path></svg>
            {{ pet.name }}
          </p>

          <button class="bg-tranparent text-sm hover:bg-blue hover:text-white text-blue border border-blue no-underline font-bold py-2 px-4 mr-2 rounded"
          @click.prevent="editPet(pet)">Edit</button>

          <button class="bg-transprent text-sm hover:bg-red text-red hover:text-white no-underline font-bold py-2 px-4 rounded border border-red"
         @click.prevent="removePet(pet)">Delete</button>
        </div>

        <div v-if="pet == editedPet">
          <form action="" @submit.prevent="updatePet(pet)">
            <div class="mb-6 p-4 bg-white rounded border border-grey-light mt-4">
              <input class="input" v-model="pet.name" />
              <input type="submit" value="Update" class=" my-2 bg-transparent text-sm hover:bg-blue hover:text-white text-blue border border-blue no-underline font-bold py-2 px-4 rounded cursor-pointer">
            </div>
          </form>
        </div>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  name: 'Pet',
  data () {
    return {
      pets: [],
      newPet: [],
      error: '',
      editedPet: ''
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
      this.$http.secured.post('/api/v1/pets/', { pet: { name: this.newPet.name } })

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
    editPet (pet) {
      this.editedpet = pet
    },
    updatePet (pet) {
      this.editedPet = ''
      this.$http.secured.patch(`/api/v1/pets/${pet.id}`, { pet: { title: pet.name } })
        .catch(error => this.setError(error, 'Cannot update pet'))
    }
  }
}
</script>

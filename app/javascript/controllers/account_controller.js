import { event } from "jquery"
import { Controller } from "stimulus"

export default class extends Controller {

static targets = ["list","package"]

  connect() {
    console.log("I am connected")
  }
  account() {
    console.log("Im in account")

    // console.log(this.listTarget.innerHTML)
    // perks in the selected list
      const selectedList = this.packageTarget.querySelectorAll("li")
    // perks available
      // const availableList = this.listTarget.querySelectorAll("li")
      // console.log(selectedList)

      const userId = document.querySelector(".current-user-id").id
      const csrf = document.querySelector("meta[name='csrf-token']").getAttribute("content");

     const newSelectedList = []
     selectedList.forEach ((item) => {
      newSelectedList.push(item.id)
     });

    //  console.log(newSelectedList)

     newSelectedList.forEach ((item) => {
       if (item.includes("false")) {
        console.log(userId, item)

        const data = { currentUser: userId };

         fetch(`http://localhost:3000/perks/${item.split("-")[0]}/user_perks?user_id=${userId}`, {
           method: 'POST', // or 'PUT' DELETE
           headers: {
             'Content-Type': 'application/json',
             'X-CSRF-Token': csrf
           },
           body: JSON.stringify(data),
          })
           .then(response => response.json())
           .then(data => {
             console.log('Success:', data);
           })
           .catch((error) => {
             console.error('Error:', error);
           });
       }
     })
    console.log("Im out of account")

  }

  options() {
    console.log("Im in options")
    // perks in the selected list
    const selectedList = this.listTarget.querySelectorAll("li")
    // perks available
    // const availableList = this.listTarget.querySelectorAll("li")
    // console.log(selectedList)
    // console.log(selectedList)

    const userId = document.querySelector(".current-user-id").id
    const csrf = document.querySelector("meta[name='csrf-token']").getAttribute("content");

    const newSelectedList = []
    selectedList.forEach((item) => {
      newSelectedList.push(item.id)
    });

    // console.log(newSelectedList)

    newSelectedList.forEach((item) => {
      if (item.includes("true")) {
        console.log(userId, item)

        const data = { currentUser: userId };

        fetch(`http://localhost:3000/package/${item.split("-")[2]}`, {
          method: 'DELETE', // or 'PUT' DELETE
          headers: {
            'Content-Type': 'application/json',
            'X-CSRF-Token': csrf
          },
          body: JSON.stringify(data),
        })
          .then(response => response.json())
          .then(data => {
            console.log('Success:', data);
          })
          .catch((error) => {
            console.error('Error:', error);
          });
      }
    })
    console.log("Im out of options")
  }

}


// /perks/: perk_id / user_perks

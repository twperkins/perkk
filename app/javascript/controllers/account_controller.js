import { event } from "jquery"
import { Controller } from "stimulus"

export default class extends Controller {

static targets = ["list","package"]

  connect() {
    console.log("I am connected")
  }
  account() {
    // console.log(this.listTarget.innerHTML)
      const list = this.packageTarget.querySelectorAll("li")
      const userId = document.querySelector(".current-user-id").id
      const csrf = document.querySelector("meta[name='csrf-token']").getAttribute("content");

     const newList = []
     list.forEach ((item) => {
      newList.push(item.id)
     });

     console.log(newList)

     newList.forEach ((item) => {
       if (item.endsWith("false")) {
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
  }
}


// /perks/: perk_id / user_perks

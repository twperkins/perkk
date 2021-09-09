import { event } from "jquery"
import { Controller } from "stimulus"
import Rails from '@rails/ujs'
// import { initSweetalert } from '../plugins/init_sweetalert';
import swal from 'sweetalert';



export default class extends Controller {

static targets = ["list","package","totals"]

  connect() {
    console.log("I am connected")
  }
  account(event) {
    const item = event.currentTarget;
    if (!Array.from(this.packageTarget.children).includes(item)) return;
    fetch(item.dataset.url, {
      method: 'POST', // or 'PUT' DELETE
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': Rails.csrfToken()
      }
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data.message)
       if (data.message == "failed to save"){
         console.log("I am an alert box!");
        //  alert("You do not have enough tokens - please add more tokens!");
        //  ideally this should be a seperate js file
        //
         const el = document.createElement('div')
         const refresh = document.createElement('div')

         el.innerHTML = "<a style='font-size:20px' href='/tokens'>Add Tokens</a>"
         refresh.innerHTML = "<a href='/tokens'>something</a>"


         swal({
           icon: 'https://picsum.photos/id/22/200/200',
           title: "Oops, not enough tokens!",
           content: el,
           button: "Ok!",
           className: "swal-class",
         }).then((result) => {
           console.log(result)
           if (result) {
             location.reload();
           }
         })

         //
         //
        // end of sweetalert
       }
        console.log('Success:', data.message);
      })
      .catch((error) => {
        console.error('Error:', error);
      });
  }

  options(event) {
    const item = event.currentTarget;
    if (!Array.from(this.listTarget.children).includes(item)) return;
    fetch(item.dataset.url, {
      method: 'DELETE', // or 'PUT' DELETE
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': Rails.csrfToken()
      }
    })
      .then(response => response.json())
      .then((data) => {
        console.log('Success:', data);
      })
      .catch((error) => {
        console.error('Error:', error);
      });
  }


  // options() {
  //   console.log("Im in options")
  //   // perks in the selected list
  //   const selectedList = this.listTarget.querySelectorAll(".small")
  //   // perks available
  //   // const availableList = this.listTarget.querySelectorAll("li")
  //   // console.log(selectedList)
  //   // console.log(selectedList)

  //   const userId = document.querySelector(".current-user-id").id
  //   const csrf = document.querySelector("meta[name='csrf-token']").getAttribute("content");

  //   const newSelectedList = []
  //   selectedList.forEach((item) => {
  //     newSelectedList.push(item.id)
  //   });

  //   console.log(newSelectedList)

  //   newSelectedList.forEach((item) => {
  //     if (item.includes("true")) {
  //       console.log(userId, item)

  //       const data = { currentUser: userId };

  //       fetch(`/package/${item.split("-")[2]}`, {
  //         method: 'DELETE', // or 'PUT' DELETE
  //         headers: {
  //           'Content-Type': 'application/json',
  //           'X-CSRF-Token': csrf
  //         },
  //         body: JSON.stringify(data),
  //       })
  //         .then(response => response.json())
  //         .then(data => {
  //           console.log('Success:', data);
  //         })
  //         .catch((error) => {
  //           console.error('Error:', error);
  //         });
  //     }
  //   })
  //   console.log("Im out of options")
  // }

}


// /perks/: perk_id / user_perks

import { Controller } from "stimulus"
import axios from 'axios'

export default class extends Controller {
  static targets = [ "followButton" ]

  follow(event) {
    event.preventDefault();
    
    let user_id = this.followButtonTarget.dataset.user;
    let button = this.followButtonTarget;
    axios.post(`/api/v1/users/${user_id}/follow`)
         .then(function(response) {
           let status = response.data.status;
           
           switch (status) {
            
            case 'sign_in_first':
              alert('請先登入')
              break;
           
             default:
              button.innerHTML = status
              break;
           }
         })
         .catch(function(error) {
           console.log(error)
         })
  }
}

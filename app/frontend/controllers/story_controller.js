import { Controller } from "stimulus"
import axios from 'axios'

export default class extends Controller {
  static targets = [ "clapCount" ]

  addClap(event) {
    event.preventDefault();
    let slug = event.currentTarget.dataset.slug;
    let target = this.clapCountTarget
    
    axios.post(`/api/v1/stories/${slug}/clap`)
         .then(function(response) {
           let status = response.data.status;
           switch (status) {
            case 'sign_in_first':
              alert('你必須先登入')
              break
            default:
              target.innerHTML = status
           }
         })
         .catch(function(error){
           console.log(error);
         })
  }
 
}

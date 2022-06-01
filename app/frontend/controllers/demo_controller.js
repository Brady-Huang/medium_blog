import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "content" ]

  pushme() {
    let content = this.contentTarget.value;
    console.log(content);
  }
 
}

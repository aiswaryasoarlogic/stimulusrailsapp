import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "email", "name", "password", "phone", "confirmpwd", "profession", "emailoutput", "nameoutput", 
  "passwordoutput", "confirmpwdoutput", "phoneoutput", "professionoutput", "output", "submitbtn" ]

  validate() {
    if(this.emailTarget.value == ""){
      this.emailoutputTarget.textContent = "Please enter your Email!!"
    }
    else if(this.passwordTarget.value == ""){
      this.passwordoutputTarget.textContent = "Please enter Password!!"
    }
    else{
        this.submitbtnTarget.hidden = false
    }
  }
  changehandler() {
    this.emailoutputTarget.textContent = ""
    this.nameoutputTarget.textContent = ""
    this.passwordoutputTarget.textContent = ""
    this.confirmpwdoutputTarget.textContent = ""
    this.phoneoutputTarget.textContent = ""
    this.professionoutputTarget.textContent = ""
    // this.submitbtnTarget.hidden = false
  }
}

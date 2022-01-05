import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "title", "pagetitle", "keyword", "metadescription", "description", "image", "titleoutput", "pagetitleoutput", 
  "keywordoutput", "metadescriptionoutput", "descriptionoutput", "imageoutput", "output", "submitbtn", "validatebtn" ]

  validate() {
    if(this.titleTarget.value == ""){
      this.titleoutputTarget.textContent = "Please enter Title!!"
    }
    else if(this.pagetitleTarget.value == ""){
      this.pagetitleoutputTarget.textContent = "Please enter Page title!!"
    }
    else if(this.keywordTarget.value == ""){
      this.keywordoutputTarget.textContent = "Please enter Keywords!!"
    }
    else if(this.metadescriptionTarget.value == ""){
      this.metadescriptionoutputTarget.textContent = "Please enter metadescription!!"
    }
    else if(this.descriptionTarget.value == ""){
      this.descriptionoutputTarget.textContent = "Please enter Description!!"
    }
    else{
        this.validatebtnTarget.hidden = true
        this.submitbtnTarget.hidden = false
    }
  }
  changehandler() {
    this.titleoutputTarget.textContent = ""
    this.pagetitleoutputTarget.textContent = ""
    this.keywordoutputTarget.textContent = ""
    this.metadescriptionoutputTarget.textContent = ""
    this.descriptionoutputTarget.textContent = ""
    this.imageoutputTarget.textContent = ""
    
  }
}

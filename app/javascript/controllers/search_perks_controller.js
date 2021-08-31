import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['form', 'input', 'list'];

  connect() {
    console.log(this.formTarget);
    console.log(this.inputTarget);
  }
  updateList(event) {
    const url = this.formTarget.action;
    fetch(`${url}?query=${this.inputTarget.value}`, { headers: { 'Accept': 'text/plain' } })
      .then(response => response.text())
      .then((data) => {
        this.listTarget.outerHTML = data;
      });
  }
}

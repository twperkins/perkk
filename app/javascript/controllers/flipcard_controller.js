import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['flipcard-button', 'flipcard', 'flipback'];

  connect() {
    console.log('connected');
  }
  toggleFlipcard() {
    console.log('clicked')
    this.flipcardTarget.classList.toggle('flip-card');
    this.flipbackTarget.classList.toggle('backface-visible');
  }
}

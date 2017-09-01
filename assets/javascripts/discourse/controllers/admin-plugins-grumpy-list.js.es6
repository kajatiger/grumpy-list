export default Ember.Controller.extend({
  listVisible: false,

  actions: {
    showList() {
      this.set('listVisible', true);
    }
  }
});

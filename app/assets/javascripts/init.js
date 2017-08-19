var Page, bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
Page = (function() {
  function Page() {
    this.action = bind(this.action, this);
    this.controller = bind(this.controller, this);
  }
  Page.prototype.controller = function() {
    return $('meta[name=psj]').attr('controller');
  };
  Page.prototype.action = function() {
    return $('meta[name=psj]').attr('action');
  };
  return Page;
})();
this.page = new Page;
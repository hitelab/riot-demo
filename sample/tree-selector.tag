<sample-tree-selector>
  <select each={items} if={options.length > 0} name={name} onchange={change}>
    <option each={options} value={info} selected={info == parent.value}>{info.split(':')[1]}</option>
  </select>

  <script>
    this.items = opts.items;

    this.on('update', function() {
      var options = opts.data;
      for(var i=0; i<this.items.length; i++) {
        var item = this.items[i];
        item.options = options;
        var subOptions = [];
        for(var j=0; j<options.length; j++) {
          if(options[j].info == item.value || j == 0) {
            subOptions = options[j].sub;
          }
        }
        options = subOptions || [];
      }
    })

    change(e) {
      e.item.value = e.target.value
      var index = this.items.indexOf(e.item)
      for(var i=(index + 1); i<this.items.length; i++) {
        this.items[i].value = '';
      }
    }
  </script>
</sample-tree-selector>

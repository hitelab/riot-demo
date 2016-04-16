<sample-tree-selector>
  <select each={items} if={options.length} name={name} onchange={change}>
    <option each={options} value={name} selected={name == selected}>{name}</option>
  </select>

  <script>
    this.items = opts.items;

    this.on('update', function() {
      var options = opts.data;
      for(var i=0; i<this.items.length; i++) {
        var item = this.items[i];
        item.index = i;
        item.options = options;
        var nextOptions = [];
        for(var j=0; j<options.length; j++) {
          if(options[j].name == item.selected || j == 0) {
            nextOptions = options[j].sub;
          }
        }
        options = nextOptions;
      }
    })

    change(e) {
      this.items[e.item.index].selected = e.target.value;
      for(var i=(e.item.index + 1); i<this.items.length; i++) {
        this.items[i].selected = '';
      }
    }
  </script>
</sample-tree-selector>

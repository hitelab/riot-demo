<sample>
  <h3>{ message }</h3>
  <ul>
    <li each={ techs }>{ name }</li>
  </ul>

  <script>
    this.message = 'Hello, Riot!'
    this.techs = [
      { name: 'HTML' },
      { name: 'JavaScript' },
      { name: 'CSS' }
    ]
  </script>

  <style scoped>
    :scope { font-size: 1rem }
    h3 { color: #444 }
    ul { color: #999 }
  </style>
</sample>

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

<sample-binary-calculator>
	<h3>Binary Calculator</h3>
	<span>Enter hex:</span>
	<br/>
	<span>0x</span>
	<input name="input" onkeyup={ hexChanged } value={ hex }>
	<span each={ bitlist }>{ value }</span>
	<br/>
  <br>
	<div class="bit" each={ bitlist } onclick={ parent.toggle }>
		<span>{ pos }</span>
		<input type="checkbox" checked={ value }>
	</div>
	<br/>

<script>
  this.num = NaN;

  this.on('update', function() {
    this.hex = isNaN(this.num) ? '' : parseInt(this.num, 10).toString(16).toUpperCase()
    this.bitlist = []
    var max = 7
    for (var i = 0; i<=max; i++) {
      this.bitlist.push({ pos: max-i, value: ((1 << max-i) & this.num) > 0 ? 1 : 0})
    }
  })

	hexChanged(e) {
    this.num = parseInt(e.target.value, 16)
	}

	toggle(e) {
    var bitPos = e.item.pos
    var mask = (1 << bitPos)
    this.num = parseInt(this.hex, 16) ^ mask
	}
</script>
<style scoped>
.bit {
  float: left;
  max-width: 10px;
  padding-right: 10px;
  border: 1px solid;
}
.bit > span {
  padding-left: 5px;
}
</style>
</sample-binary-calculator>

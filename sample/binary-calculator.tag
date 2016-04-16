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

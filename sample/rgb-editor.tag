<sample-rgb-editor>
  <table>
  <tr>
    <td>red:{red}</td>
    <td>green:{green}</td>
    <td>blue:{blue}</td>
  </tr>
  <tr>
    <td>
    <input onchange={changeRed} type="range" name="slideRed" value={red} min="0" max="255">
    </td>
    <td>
    <input onchange="{changeGreen}" type="range" name="slideGreen" value={green} min="0" max="255">
    </td>
    <td>
    <input onchange="{changeBlue}" type="range" name="slideBlue" value={blue} min="0" max="255">
    </td>
  </tr>
  <tr>
    <td colspan="3">rgb({red}, {green}, {blue})</td>
  </tr>
  <tr>
    <td colspan="3" style="height: 40px; background-color: rgb({red}, {green}, {blue});"></td>
  </tr>
  </table>

  <style scoped>
  table {
    table-layout: fixed;
    width: 100%;
    border-collapse: collapse;
    border-spacing: 0;
    border: 1px solid #ccc!important;
    text-align: center;
  }
  </style>
  <script>
  this.red = opts.red
  this.green = opts.green
  this.blue = opts.blue
  changeRed(e) {
    this.red = e.target.value;
  }
  changeGreen(e) {
    this.green = e.target.value;
  }
  changeBlue(e) {
    this.blue = e.target.value;
  }
  </script>
</sample-rgb-editor>

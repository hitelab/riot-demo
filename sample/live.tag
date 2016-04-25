<sample-rtmp-publisher>
  <script>
      var flashVars = {
          streamer: 'rtmp://ecs3.shbaiche.com/live',
          file:'mystream'
      };
      swfobject.embedSWF("assets/live/RtmpPublisher.swf", "rtmp-publisher", "640", "480", "9.0.0", null, flashVars);
  </script>
</sample-rtmp-publisher>

<sample-rtmp-player>
  <script>
      var flashVars = {
          streamer: 'rtmp://ecs3.shbaiche.com/live',
          file:'mystream'
      };
      var params = {};
      params.allowfullscreen = "true";
      var attributes = {};
      swfobject.embedSWF("assets/live/RtmpPlayer.swf", "rtmp-player", "640", "480", "9.0.0", null, flashVars, params, attributes);
  </script>
</sample-rtmp-player>

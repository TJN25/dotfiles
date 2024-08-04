#!/usr/bin/env ruby

# This script configures yabai to manage the windows on the secondary
# displays, but leave the windows on the primary display floating.
#
# See also: https://github.com/koekeishiya/yabai/discussions/959

require 'json'

displays = JSON.parse `yabai -m query --displays`
# [{
#   "id":2077751158,
#   "uuid":"FD6E9053-53B7-5224-5892-F9F7EC52CEF3",
#   "index":1,
#   "spaces":[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],
#   "frame":{
#     "x":0.0000,
#     "y":0.0000,
#     "w":1680.0000,
#     "h":1050.0000
#   }
# }]

spaces_on_primary_display = displays.first['spaces']
spaces_on_secondary_displays = displays.drop(1).collect { |display| display['spaces'] }.flatten

for space in spaces_on_primary_display
  `yabai -m config --space #{space} top_padding 24`
end

for space in spaces_on_secondary_displays
  `yabai -m config --space #{space} top_padding 50`
end


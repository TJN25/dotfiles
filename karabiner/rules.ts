import fs from "fs";
import { KarabinerRules } from "./types";
import { createHyperSubLayers, app, open, rectangle, shell } from "./utils";

//const openWithMinimal = (url: string) => open(`-a Firefox --args -P "Minimal Window" ${url}`);
//const openWithMinimal = (url: string) => `-a Firefox --args -P "Minimal Window" ${url}`;
// NEED TO CHANGE CONTROL TO OPTION BECAUSE OF MACOS SETTING SWAPSING THE KEYS

const rules: KarabinerRules[] = [
  // Define the Hyper key itself
  {
    description: "Hyper Key (⌃⌥⇧⌘)",
    manipulators: [
      {
        description: "Caps Lock -> Hyper Key",
        from: {
          key_code: "caps_lock",
          modifiers: {
            optional: ["any"],
          },
        },
        to: [
          {
            set_variable: {
              name: "hyper",
              value: 1,
            },
          },
        ],
        to_after_key_up: [
          {
            set_variable: {
              name: "hyper",
              value: 0,
            },
          },
        ],
        to_if_alone: [
          {
            key_code: "escape",
          },
        ],
        type: "basic",
      },
      {
        description: "Enter Key -> Hyper Key",
        from: {
          key_code: "return_or_enter",
          modifiers: {
            optional: ["any"],
          },
        },
        to: [
          {
            set_variable: {
              name: "hyper",
              value: 1,
            },
          },
        ],
        to_after_key_up: [
          {
            set_variable: {
              name: "hyper",
              value: 0,
            },
          },
        ],
        to_if_alone: [
          {
            key_code: "return_or_enter",
          },
        ],
        type: "basic",
      },
      //      {
      //        type: "basic",
      //        description: "Disable CMD + Tab to force Hyper Key usage",
      //        from: {
      //          key_code: "tab",
      //          modifiers: {
      //            mandatory: ["left_command"],
      //          },
      //        },
      //        to: [
      //          {
      //            key_code: "tab",
      //          },
      //        ],
      //      },
    ],
  },
  ...createHyperSubLayers({
    spacebar: open(
      "raycast://extensions/stellate/mxstbr-commands/create-notion-todo"
    ),
    k: {

      a: {
        description: "Open bracket",
        to: [
          {
            key_code: "open_bracket"
          },
        ],
      },
      s: {
        description: "Close bracket",
        to: [
          {
            key_code: "close_bracket"
          },
        ],
      },
      d: {
        description: "Open bracket",
        to: [
          {
            key_code: "open_bracket",
            modifiers: ["shift"]
          },
        ],
      },
      f: {
        description: "Close brace",
        to: [
          {
            key_code: "close_bracket",
            modifiers: ["shift"]
          },
        ],
      },
    },

    // b = "B"rowse
    b: {
      t: open("https://twitter.com"),
      s: open("https://docs.google.com/document/d/1q51yMLCkZGXBi1tnZUQqgi5BBl34jwGkYi9fWKNkqqc/"),
      //l: open("https://music.youtube.com/"),
      l: open("https://music.youtube.com/"),
      k: open("https://concept.otago.ac.nz/"),
      // Quarterly "P"lan
      g: open("https://github.com/tjn25"),
      y: open("https://www.youtube.com"),
      f: open("https://facebook.com"),
      r: open("https://reddit.com"),
      m: open("https://www.messenger.com/"),
    },
    // o = "Open" applications
    o: {
      1: app("1Password"),
      g: app("Google Chrome"),
      b: app("Bitwarden"),
      c: app("Calendar"),
      s: app("Slack"),
      y: app("System Settings"),
      n: app("Notion"),
      i: app("Obsidian"),
      t: app("Terminal"),
      // Open Notion projects 
      h: open(
        "notion://www.notion.so/Projects-Task-e3df002f363e4ef19be22806e3a299fe?pvs=32"
      ),
      z: app("zoom.us"),
      d: app("Finder"),
      f: app("Firefox"),
      p: app("Affinity Publisher 2"),
      a: app("Affinity Designer 2"),
      w: app("WezTerm"),
    },

    // TODO: This doesn't quite work yet.
    // l = "Layouts" via Raycast's custom window management
    // l: {
    //   // Coding layout
    //   c: shell`
    //     open -a "Visual Studio Code.app"
    //     sleep 0.2
    //     open -g "raycast://customWindowManagementCommand?position=topLeft&relativeWidth=0.5"

    //     open -a "Terminal.app"
    //     sleep 0.2
    //     open -g "raycast://customWindowManagementCommand?position=topRight&relativeWidth=0.5"
    //   `,
    // },

    // w = "Window" via rectangle.app
    w: {
      semicolon: {
        description: "Window: Hide",
        to: [
          {
            key_code: "h",
            modifiers: ["right_command"],
          },
        ],
      },
      y: rectangle("previous-display"),
      o: rectangle("next-display"),
      k: rectangle("top-half"),
      j: rectangle("bottom-half"),
      h: rectangle("left-half"),
      l: rectangle("right-half"),
      f: rectangle("maximize"),
      u: {
        description: "Window: Previous Tab",
        to: [
          {
            key_code: "tab",
            modifiers: ["right_control", "right_shift"],
          },
        ],
      },
      i: {
        description: "Window: Next Tab",
        to: [
          {
            key_code: "tab",
            modifiers: ["right_control"],
          },
        ],
      },
      n: {
        description: "Window: Next Window",
        to: [
          {
            key_code: "grave_accent_and_tilde",
            modifiers: ["right_command"],
          },
        ],
      },
      b: {
        description: "Window: Back",
        to: [
          {
            key_code: "open_bracket",
            modifiers: ["right_command"],
          },
        ],
      },
      // Note: No literal connection. Both f and n are already taken.
      m: {
        description: "Window: Forward",
        to: [
          {
            key_code: "close_bracket",
            modifiers: ["right_command"],
          },
        ],
      },
    },

    // s = "System"
    s: {
      u: {
        to: [
          {
            key_code: "volume_increment",
          },
        ],
      },
      j: {
        to: [
          {
            key_code: "volume_decrement",
          },
        ],
      },
      i: {
        to: [
          {
            key_code: "display_brightness_increment",
          },
        ],
      },
      k: {
        to: [
          {
            key_code: "display_brightness_decrement",
          },
        ],
      },
      l: {
        to: [
          {
            key_code: "q",
            modifiers: ["right_option", "right_command"],
          },
        ],
      },
      p: {
        to: [
          {
            key_code: "play_or_pause",
          },
        ],
      },
      semicolon: {
        to: [
          {
            key_code: "fastforward",
          },
        ],
      },
      e: open(
        `raycast://extensions/thomas/elgato-key-light/toggle?launchType=background`
      ),
      // "D"o not disturb toggle
      d: open(
        `raycast://extensions/yakitrak/do-not-disturb/toggle?launchType=background`
      ),
      // "T"heme
      t: open(`raycast://extensions/raycast/system/toggle-system-appearance`),
      c: open("raycast://extensions/raycast/system/open-camera"),
      // 'v'oice
      v: {
        to: [
          {
            key_code: "spacebar",
            modifiers: ["left_option"],
          },
        ],
      },
    },

    // v = "moVe" which isn't "m" because we want it to be on the left hand
    // so that hjkl work like they do in vim
    v: {
      h: {
        to: [{ key_code: "left_arrow" }],
      },
      j: {
        to: [{ key_code: "down_arrow" }],
      },
      k: {
        to: [{ key_code: "up_arrow" }],
      },
      l: {
        to: [{ key_code: "right_arrow" }],
      },
      // Magicmove via homerow.app
      m: {
        to: [{ key_code: "f", modifiers: ["right_control"] }],
        // TODO: Trigger Vim Easymotion when VSCode is focused
      },
      // Scroll mode via homerow.app
      s: {
        to: [{ key_code: "j", modifiers: ["right_control"] }],
      },
      d: {
        to: [{ key_code: "d", modifiers: ["right_shift", "right_command"] }],
      },
      u: {
        to: [{ key_code: "page_down" }],
      },
      i: {
        to: [{ key_code: "page_up" }],
      },
    },

    // c = Musi*c* which isn't "m" because we want it to be on the left hand
    c: {
      p: {
        to: [{ key_code: "play_or_pause" }],
      },
      n: {
        to: [{ key_code: "fastforward" }],
      },
      b: {
        to: [{ key_code: "rewind" }],
      },
    },

    // r = "Raycast"
    r: {
      c: open("raycast://extensions/thomas/color-picker/pick-color"),
      n: open("raycast://script-commands/dismiss-notifications"),
      i: open("raycast://ai-commands/improve-writing"),
      e: open("raycast://extensions/raycast/emoji-symbols/search-emoji-symbols"),
      s: open("raycast://ai-commands/fix-spelling-and-grammar"),
      p: open("raycast://extensions/raycast/raycast/confetti"),
      k: open("raycast://script-commands/karabiner-shortcuts"),
      a: open("raycast://extensions/raycast/raycast-ai/ai-chat"),
      t: open("raycast://extensions/joshmedeski/sesh/cmd-connect"),
      m: open("raycast://extensions/raycast/navigation/search-menu-items"),
      h: open("raycast://extensions/raycast/clipboard-history/clipboard-history"),
      1: open("raycast://extensions/VladCuciureanu/toothpick/connect-favorite-device-1"),
      2: open("raycast://extensions/VladCuciureanu/toothpick/connect-favorite-device-2"),
    },
    a: {
      o: open("raycast://extensions/raycast/raycast-ai/search-ai-chat-presets"),
      i: open("raycast://extensions/raycast/raycast-ai/ai-chat?context=%7B%22preset%22:%22C7D5E429-BF21-42A4-A5F7-840FD5640247%22%7D"),
      c: open("raycast://extensions/raycast/raycast-ai/ai-chat?context=%7B%22preset%22:%22B91D7FC5-5F7D-48B9-86FA-270EC19485FC%22%7D"),
      b: open("raycast://extensions/raycast/raycast-ai/ai-chat?context=%7B%22preset%22:%224F54E4D6-34A8-4CD4-9CCB-F9ECD3FBACD1%22%7D"),
      p: open("raycast://extensions/raycast/raycast-ai/ai-chat?context=%7B%22preset%22:%22E514F5D6-1C09-4CD0-8485-B76D66F5B3E3%22%7D"),
      s: open("raycast://extensions/raycast/raycast-ai/ai-chat?context=%7B%22preset%22:%229E8F60D0-8973-4ADA-9267-5F742EA3B22C%22%7D"),
      t: open("raycast://extensions/raycast/raycast-ai/ai-chat?context=%7B%22preset%22:%227993EB06-6BA0-4074-B18A-30D9B47EC0C9%22%7D"),
    },
  }),
];

fs.writeFileSync(
  "karabiner.json",
  JSON.stringify(
    {
      global: {
        show_in_menu_bar: false,
      },
      profiles: [
        {
          name: "Default",
          complex_modifications: {
            rules,
          },
        },
      ],
    },
    null,
    2
  )
);

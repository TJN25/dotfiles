"use strict";
var __defProp = Object.defineProperty;
var __getOwnPropDesc = Object.getOwnPropertyDescriptor;
var __getOwnPropNames = Object.getOwnPropertyNames;
var __hasOwnProp = Object.prototype.hasOwnProperty;
var __export = (target, all) => {
  for (var name in all)
    __defProp(target, name, { get: all[name], enumerable: true });
};
var __copyProps = (to, from, except, desc) => {
  if (from && typeof from === "object" || typeof from === "function") {
    for (let key of __getOwnPropNames(from))
      if (!__hasOwnProp.call(to, key) && key !== except)
        __defProp(to, key, { get: () => from[key], enumerable: !(desc = __getOwnPropDesc(from, key)) || desc.enumerable });
  }
  return to;
};
var __toCommonJS = (mod) => __copyProps(__defProp({}, "__esModule", { value: true }), mod);

// src/index.ts
var src_exports = {};
__export(src_exports, {
  default: () => src_default
});
module.exports = __toCommonJS(src_exports);
var import_api = require("@raycast/api");
var command = async () => {
  const now = new Date();
  const boston = now.toLocaleString(void 0, { timeZone: "America/New_York", timeStyle: "short" });
  const chicago = now.toLocaleString(void 0, { timeZone: "America/Chicago", timeStyle: "short" });
  const perth = now.toLocaleString(void 0, { timeZone: "Australia/Perth", timeStyle: "short" });
  const subtitle = `\u{1F1FA}\u{1F1F8} SBGrid ${boston}  \u{1F1FA}\u{1F1F8} Eli ${chicago}  \u{1F1E6}\u{1F1FA} Perth ${perth}`;
  await (0, import_api.updateCommandMetadata)({ subtitle });
  if (import_api.environment.launchType === import_api.LaunchType.UserInitiated) {
    const toast = new import_api.Toast({
      style: import_api.Toast.Style.Success,
      title: "Refreshed!",
      message: subtitle
    });
    toast.primaryAction = {
      title: "Copy to Clipboard",
      shortcut: { modifiers: ["cmd", "shift"], key: "c" },
      onAction: () => import_api.Clipboard.copy(subtitle)
    };
    await toast.show();
  }
};
var src_default = command;
// Annotate the CommonJS export names for ESM import in node:
0 && (module.exports = {});
//# sourceMappingURL=data:application/json;base64,ewogICJ2ZXJzaW9uIjogMywKICAic291cmNlcyI6IFsiLi4vLi4vLi4vLi4vdGVhbS10aW1lL3NyYy9pbmRleC50cyJdLAogICJzb3VyY2VzQ29udGVudCI6IFsiaW1wb3J0IHsgQ2xpcGJvYXJkLCBlbnZpcm9ubWVudCwgTGF1bmNoVHlwZSwgVG9hc3QsIHVwZGF0ZUNvbW1hbmRNZXRhZGF0YSB9IGZyb20gXCJAcmF5Y2FzdC9hcGlcIjtcblxuY29uc3QgY29tbWFuZCA9IGFzeW5jICgpID0+IHtcbiAgY29uc3Qgbm93ID0gbmV3IERhdGUoKTtcblxuICBjb25zdCBib3N0b24gPSBub3cudG9Mb2NhbGVTdHJpbmcodW5kZWZpbmVkLCB7IHRpbWVab25lOiBcIkFtZXJpY2EvTmV3X1lvcmtcIiwgdGltZVN0eWxlOiBcInNob3J0XCIgfSk7XG4gIGNvbnN0IGNoaWNhZ28gPSBub3cudG9Mb2NhbGVTdHJpbmcodW5kZWZpbmVkLCB7IHRpbWVab25lOiBcIkFtZXJpY2EvQ2hpY2Fnb1wiLCB0aW1lU3R5bGU6IFwic2hvcnRcIiB9KTtcbiAgLy9jb25zdCBsYSA9IG5vdy50b0xvY2FsZVN0cmluZyh1bmRlZmluZWQsIHsgdGltZVpvbmU6IFwiQW1lcmljYS9Mb3NfQW5nZWxlc1wiLCB0aW1lU3R5bGU6IFwic2hvcnRcIiB9KTtcbiAgLy9jb25zdCBncmVlY2UgPSBub3cudG9Mb2NhbGVTdHJpbmcodW5kZWZpbmVkLCB7IHRpbWVab25lOiBcIkV1cm9wZS9BdGhlbnNcIiwgdGltZVN0eWxlOiBcInNob3J0XCIgfSk7XG4gIC8vY29uc3QgbWFkcmlkID0gbm93LnRvTG9jYWxlU3RyaW5nKHVuZGVmaW5lZCwgeyB0aW1lWm9uZTogXCJFdXJvcGUvTWFkcmlkXCIsIHRpbWVTdHlsZTogXCJzaG9ydFwiIH0pO1xuICBjb25zdCBwZXJ0aCA9IG5vdy50b0xvY2FsZVN0cmluZyh1bmRlZmluZWQsIHsgdGltZVpvbmU6IFwiQXVzdHJhbGlhL1BlcnRoXCIsIHRpbWVTdHlsZTogXCJzaG9ydFwiIH0pO1xuXG4gIGNvbnN0IHN1YnRpdGxlID0gYFx1RDgzQ1x1RERGQVx1RDgzQ1x1RERGOCBTQkdyaWQgJHtib3N0b259ICBcdUQ4M0NcdURERkFcdUQ4M0NcdURERjggRWxpICR7Y2hpY2Fnb30gIFx1RDgzQ1x1RERFNlx1RDgzQ1x1RERGQSBQZXJ0aCAke3BlcnRofWA7XG4gIGF3YWl0IHVwZGF0ZUNvbW1hbmRNZXRhZGF0YSh7IHN1YnRpdGxlIH0pO1xuXG4gIGlmIChlbnZpcm9ubWVudC5sYXVuY2hUeXBlID09PSBMYXVuY2hUeXBlLlVzZXJJbml0aWF0ZWQpIHtcbiAgICBjb25zdCB0b2FzdCA9IG5ldyBUb2FzdCh7XG4gICAgICBzdHlsZTogVG9hc3QuU3R5bGUuU3VjY2VzcyxcbiAgICAgIHRpdGxlOiBcIlJlZnJlc2hlZCFcIixcbiAgICAgIG1lc3NhZ2U6IHN1YnRpdGxlLFxuICAgIH0pO1xuICAgIHRvYXN0LnByaW1hcnlBY3Rpb24gPSB7XG4gICAgICB0aXRsZTogXCJDb3B5IHRvIENsaXBib2FyZFwiLFxuICAgICAgc2hvcnRjdXQ6IHsgbW9kaWZpZXJzOiBbXCJjbWRcIiwgXCJzaGlmdFwiXSwga2V5OiBcImNcIiB9LFxuICAgICAgb25BY3Rpb246ICgpID0+IENsaXBib2FyZC5jb3B5KHN1YnRpdGxlKSxcbiAgICB9O1xuICAgIGF3YWl0IHRvYXN0LnNob3coKTtcbiAgfVxufTtcblxuZXhwb3J0IGRlZmF1bHQgY29tbWFuZDtcbiJdLAogICJtYXBwaW5ncyI6ICI7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7O0FBQUE7QUFBQTtBQUFBO0FBQUE7QUFBQTtBQUFBLGlCQUFpRjtBQUVqRixJQUFNLFVBQVUsWUFBWTtBQUMxQixRQUFNLE1BQU0sSUFBSSxLQUFLO0FBRXJCLFFBQU0sU0FBUyxJQUFJLGVBQWUsUUFBVyxFQUFFLFVBQVUsb0JBQW9CLFdBQVcsUUFBUSxDQUFDO0FBQ2pHLFFBQU0sVUFBVSxJQUFJLGVBQWUsUUFBVyxFQUFFLFVBQVUsbUJBQW1CLFdBQVcsUUFBUSxDQUFDO0FBSWpHLFFBQU0sUUFBUSxJQUFJLGVBQWUsUUFBVyxFQUFFLFVBQVUsbUJBQW1CLFdBQVcsUUFBUSxDQUFDO0FBRS9GLFFBQU0sV0FBVyw2QkFBZSxrQ0FBb0IscUNBQXVCO0FBQzNFLFlBQU0sa0NBQXNCLEVBQUUsU0FBUyxDQUFDO0FBRXhDLE1BQUksdUJBQVksZUFBZSxzQkFBVyxlQUFlO0FBQ3ZELFVBQU0sUUFBUSxJQUFJLGlCQUFNO0FBQUEsTUFDdEIsT0FBTyxpQkFBTSxNQUFNO0FBQUEsTUFDbkIsT0FBTztBQUFBLE1BQ1AsU0FBUztBQUFBLElBQ1gsQ0FBQztBQUNELFVBQU0sZ0JBQWdCO0FBQUEsTUFDcEIsT0FBTztBQUFBLE1BQ1AsVUFBVSxFQUFFLFdBQVcsQ0FBQyxPQUFPLE9BQU8sR0FBRyxLQUFLLElBQUk7QUFBQSxNQUNsRCxVQUFVLE1BQU0scUJBQVUsS0FBSyxRQUFRO0FBQUEsSUFDekM7QUFDQSxVQUFNLE1BQU0sS0FBSztBQUFBLEVBQ25CO0FBQ0Y7QUFFQSxJQUFPLGNBQVE7IiwKICAibmFtZXMiOiBbXQp9Cg==

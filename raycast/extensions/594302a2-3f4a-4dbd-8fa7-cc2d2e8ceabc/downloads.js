"use strict";var t=Object.defineProperty;var s=Object.getOwnPropertyDescriptor;var c=Object.getOwnPropertyNames;var i=Object.prototype.hasOwnProperty;var l=(o,e)=>{for(var n in e)t(o,n,{get:e[n],enumerable:!0})},m=(o,e,n,a)=>{if(e&&typeof e=="object"||typeof e=="function")for(let r of c(e))!i.call(o,r)&&r!==n&&t(o,r,{get:()=>e[r],enumerable:!(a=s(e,r))||a.enumerable});return o};var u=o=>m(t({},"__esModule",{value:!0}),o);var w={};l(w,{default:()=>f});module.exports=u(w);var d=require("@raycast/api"),p=(0,d.getPreferenceValues)().downloadsdir;function f(){return(0,d.open)(`${p}`)}
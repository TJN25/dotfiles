"use strict";require("./__raycast_check_for_updates");var p=Object.defineProperty;var b=Object.getOwnPropertyDescriptor;var C=Object.getOwnPropertyNames;var L=Object.prototype.hasOwnProperty;var N=(t,o)=>{for(var c in o)p(t,c,{get:o[c],enumerable:!0})},T=(t,o,c,i)=>{if(o&&typeof o=="object"||typeof o=="function")for(let l of C(o))!L.call(t,l)&&l!==c&&p(t,l,{get:()=>o[l],enumerable:!(i=b(o,l))||i.enumerable});return t};var W=t=>T(p({},"__esModule",{value:!0}),t);var v={};N(v,{default:()=>P});module.exports=W(v);var m=require("react"),e=require("@raycast/api");var f=require("child_process");var u=Object.assign({},process.env,{PATH:"/usr/local/bin:/usr/bin:/opt/homebrew/bin"});function g(){return new Promise((t,o)=>{(0,f.exec)("sesh list --json",{env:u},(c,i,l)=>{if(c||l)return o("Please upgrade to the latest version of the sesh CLI");let a=JSON.parse(i);return t(a??[])})})}function d(t){return new Promise((o,c)=>{(0,f.exec)(`sesh connect --switch "${t}"`,{env:u},(i,l,a)=>i||a?(console.error("error ",i),console.error("stderr ",a),c(i?.message??a)):o())})}function x(){return new Promise(t=>{(0,f.exec)("tmux ls",{env:u},(o,c,i)=>t(!(o||i)))})}var w=require("@raycast/api"),A=require("child_process");function y(){let{openWithApp:t}=(0,w.getPreferenceValues)();return new Promise((o,c)=>{(0,A.exec)(`open -a ${t.name}`,{env:u},(i,l,a)=>i||a?c(i?.message??a):o())})}var r=require("react/jsx-runtime");function S(t){switch(t.Src){case"tmux":return{source:e.Icon.Bolt,tintColor:t.Attached>=1?e.Color.Green:e.Color.Blue,tooltip:t.Attached>=1?"Attached":"Detached"};case"config":return{source:e.Icon.Cog,tintColor:e.Color.SecondaryText};case"zoxide":default:return{source:e.Icon.Folder,tintColor:e.Color.SecondaryText}}}function h(t){if(t!==0)return String(Number.isInteger(t)?t:t.toFixed(2))}function P(){let[t,o]=(0,m.useState)({tmux:[],config:[],zoxide:[]}),[c,i]=(0,m.useState)(!0);async function l(){try{let n=await g();o({tmux:n.filter(s=>s.Src==="tmux"),config:n.filter(s=>s.Src==="config"),zoxide:n.filter(s=>s.Src==="zoxide")})}catch(n){await(0,e.showToast)({style:e.Toast.Style.Failure,title:"Couldn't get sessions",message:typeof n=="string"?n:"Unknown reason"})}finally{i(!1)}}(0,m.useEffect)(()=>{(async()=>{if(!await x()){await(0,e.showToast)({style:e.Toast.Style.Failure,title:"tmux isn't running",message:"Please start tmux before using this command."}),i(!1);return}await l()})()},[]);async function a(n){try{i(!0),await d(n),await y(),await(0,e.closeMainWindow)(),await(0,e.clearSearchBar)()}catch(s){await(0,e.showToast)({style:e.Toast.Style.Failure,title:"Couldn't connect to session",message:typeof s=="string"?s:"Unknown reason"})}finally{i(!1)}}return(0,r.jsxs)(e.List,{isLoading:c,children:[(0,r.jsx)(e.List.Section,{title:"tmux",children:t.tmux.map((n,s)=>(0,r.jsx)(e.List.Item,{title:n.Name,icon:S(n),accessories:[{icon:e.Icon.AppWindow,text:String(n.Windows),tooltip:n.Windows===1?"Window":"Windows"}],actions:(0,r.jsx)(e.ActionPanel,{children:(0,r.jsx)(e.Action,{title:"Connect to Session",onAction:()=>a(n.Name)})})},s))}),(0,r.jsx)(e.List.Section,{title:"config",children:t.config.map((n,s)=>(0,r.jsx)(e.List.Item,{title:n.Name,icon:S(n),accessories:[{text:h(n.Score),icon:e.Icon.Racket,tooltip:"Score"}],actions:(0,r.jsx)(e.ActionPanel,{children:(0,r.jsx)(e.Action,{title:"Connect to Session",onAction:()=>a(n.Name)})})},s))}),(0,r.jsx)(e.List.Section,{title:"zoxide",children:t.zoxide.map((n,s)=>(0,r.jsx)(e.List.Item,{title:n.Name,icon:S(n),accessories:[{text:h(n.Score),icon:e.Icon.Racket,tooltip:"Score"}],actions:(0,r.jsx)(e.ActionPanel,{children:(0,r.jsx)(e.Action,{title:"Connect to Session",onAction:()=>a(n.Name)})})},s))})]})}

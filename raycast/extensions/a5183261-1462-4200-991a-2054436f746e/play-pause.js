"use strict";var mn=Object.create;var B=Object.defineProperty;var hn=Object.getOwnPropertyDescriptor;var Sn=Object.getOwnPropertyNames;var yn=Object.getPrototypeOf,gn=Object.prototype.hasOwnProperty;var c=(e,t)=>()=>(t||e((t={exports:{}}).exports,t),t.exports),xn=(e,t)=>{for(var r in t)B(e,r,{get:t[r],enumerable:!0})},ve=(e,t,r,n)=>{if(t&&typeof t=="object"||typeof t=="function")for(let o of Sn(t))!gn.call(e,o)&&o!==r&&B(e,o,{get:()=>t[o],enumerable:!(n=hn(t,o))||n.enumerable});return e};var Ee=(e,t,r)=>(r=e!=null?mn(yn(e)):{},ve(t||!e||!e.__esModule?B(r,"default",{value:e,enumerable:!0}):r,e)),bn=e=>ve(B({},"__esModule",{value:!0}),e);var Ge=c((xo,Pe)=>{Pe.exports=Ce;Ce.sync=vn;var Ie=require("fs");function wn(e,t){var r=t.pathExt!==void 0?t.pathExt:process.env.PATHEXT;if(!r||(r=r.split(";"),r.indexOf("")!==-1))return!0;for(var n=0;n<r.length;n++){var o=r[n].toLowerCase();if(o&&e.substr(-o.length).toLowerCase()===o)return!0}return!1}function Te(e,t,r){return!e.isSymbolicLink()&&!e.isFile()?!1:wn(t,r)}function Ce(e,t,r){Ie.stat(e,function(n,o){r(n,n?!1:Te(o,e,t))})}function vn(e,t){return Te(Ie.statSync(e),e,t)}});var Ne=c((bo,Oe)=>{Oe.exports=qe;qe.sync=En;var Ae=require("fs");function qe(e,t,r){Ae.stat(e,function(n,o){r(n,n?!1:Re(o,t))})}function En(e,t){return Re(Ae.statSync(e),t)}function Re(e,t){return e.isFile()&&In(e,t)}function In(e,t){var r=e.mode,n=e.uid,o=e.gid,s=t.uid!==void 0?t.uid:process.getuid&&process.getuid(),i=t.gid!==void 0?t.gid:process.getgid&&process.getgid(),a=parseInt("100",8),u=parseInt("010",8),l=parseInt("001",8),f=a|u,h=r&l||r&u&&o===i||r&a&&n===s||r&f&&s===0;return h}});var $e=c((vo,ke)=>{var wo=require("fs"),j;process.platform==="win32"||global.TESTING_WINDOWS?j=Ge():j=Ne();ke.exports=Z;Z.sync=Tn;function Z(e,t,r){if(typeof t=="function"&&(r=t,t={}),!r){if(typeof Promise!="function")throw new TypeError("callback not provided");return new Promise(function(n,o){Z(e,t||{},function(s,i){s?o(s):n(i)})})}j(e,t||{},function(n,o){n&&(n.code==="EACCES"||t&&t.ignoreErrors)&&(n=null,o=!1),r(n,o)})}function Tn(e,t){try{return j.sync(e,t||{})}catch(r){if(t&&t.ignoreErrors||r.code==="EACCES")return!1;throw r}}});var Ue=c((Eo,Fe)=>{var I=process.platform==="win32"||process.env.OSTYPE==="cygwin"||process.env.OSTYPE==="msys",_e=require("path"),Cn=I?";":":",Le=$e(),Me=e=>Object.assign(new Error(`not found: ${e}`),{code:"ENOENT"}),Be=(e,t)=>{let r=t.colon||Cn,n=e.match(/\//)||I&&e.match(/\\/)?[""]:[...I?[process.cwd()]:[],...(t.path||process.env.PATH||"").split(r)],o=I?t.pathExt||process.env.PATHEXT||".EXE;.CMD;.BAT;.COM":"",s=I?o.split(r):[""];return I&&e.indexOf(".")!==-1&&s[0]!==""&&s.unshift(""),{pathEnv:n,pathExt:s,pathExtExe:o}},je=(e,t,r)=>{typeof t=="function"&&(r=t,t={}),t||(t={});let{pathEnv:n,pathExt:o,pathExtExe:s}=Be(e,t),i=[],a=l=>new Promise((f,h)=>{if(l===n.length)return t.all&&i.length?f(i):h(Me(e));let m=n[l],S=/^".*"$/.test(m)?m.slice(1,-1):m,y=_e.join(S,e),g=!S&&/^\.[\\\/]/.test(e)?e.slice(0,2)+y:y;f(u(g,l,0))}),u=(l,f,h)=>new Promise((m,S)=>{if(h===o.length)return m(a(f+1));let y=o[h];Le(l+y,{pathExt:s},(g,E)=>{if(!g&&E)if(t.all)i.push(l+y);else return m(l+y);return m(u(l,f,h+1))})});return r?a(0).then(l=>r(null,l),r):a(0)},Pn=(e,t)=>{t=t||{};let{pathEnv:r,pathExt:n,pathExtExe:o}=Be(e,t),s=[];for(let i=0;i<r.length;i++){let a=r[i],u=/^".*"$/.test(a)?a.slice(1,-1):a,l=_e.join(u,e),f=!u&&/^\.[\\\/]/.test(e)?e.slice(0,2)+l:l;for(let h=0;h<n.length;h++){let m=f+n[h];try{if(Le.sync(m,{pathExt:o}))if(t.all)s.push(m);else return m}catch{}}}if(t.all&&s.length)return s;if(t.nothrow)return null;throw Me(e)};Fe.exports=je;je.sync=Pn});var te=c((Io,ee)=>{"use strict";var De=(e={})=>{let t=e.env||process.env;return(e.platform||process.platform)!=="win32"?"PATH":Object.keys(t).reverse().find(n=>n.toUpperCase()==="PATH")||"Path"};ee.exports=De;ee.exports.default=De});var We=c((To,Ke)=>{"use strict";var Xe=require("path"),Gn=Ue(),An=te();function He(e,t){let r=e.options.env||process.env,n=process.cwd(),o=e.options.cwd!=null,s=o&&process.chdir!==void 0&&!process.chdir.disabled;if(s)try{process.chdir(e.options.cwd)}catch{}let i;try{i=Gn.sync(e.command,{path:r[An({env:r})],pathExt:t?Xe.delimiter:void 0})}catch{}finally{s&&process.chdir(n)}return i&&(i=Xe.resolve(o?e.options.cwd:"",i)),i}function qn(e){return He(e)||He(e,!0)}Ke.exports=qn});var ze=c((Co,re)=>{"use strict";var ne=/([()\][%!^"`<>&|;, *?])/g;function Rn(e){return e=e.replace(ne,"^$1"),e}function On(e,t){return e=`${e}`,e=e.replace(/(\\*)"/g,'$1$1\\"'),e=e.replace(/(\\*)$/,"$1$1"),e=`"${e}"`,e=e.replace(ne,"^$1"),t&&(e=e.replace(ne,"^$1")),e}re.exports.command=Rn;re.exports.argument=On});var Ye=c((Po,Ve)=>{"use strict";Ve.exports=/^#!(.*)/});var Qe=c((Go,Je)=>{"use strict";var Nn=Ye();Je.exports=(e="")=>{let t=e.match(Nn);if(!t)return null;let[r,n]=t[0].replace(/#! ?/,"").split(" "),o=r.split("/").pop();return o==="env"?n:n?`${o} ${n}`:o}});var et=c((Ao,Ze)=>{"use strict";var oe=require("fs"),kn=Qe();function $n(e){let r=Buffer.alloc(150),n;try{n=oe.openSync(e,"r"),oe.readSync(n,r,0,150,0),oe.closeSync(n)}catch{}return kn(r.toString())}Ze.exports=$n});var ot=c((qo,rt)=>{"use strict";var _n=require("path"),tt=We(),nt=ze(),Ln=et(),Mn=process.platform==="win32",Bn=/\.(?:com|exe)$/i,jn=/node_modules[\\/].bin[\\/][^\\/]+\.cmd$/i;function Fn(e){e.file=tt(e);let t=e.file&&Ln(e.file);return t?(e.args.unshift(e.file),e.command=t,tt(e)):e.file}function Un(e){if(!Mn)return e;let t=Fn(e),r=!Bn.test(t);if(e.options.forceShell||r){let n=jn.test(t);e.command=_n.normalize(e.command),e.command=nt.command(e.command),e.args=e.args.map(s=>nt.argument(s,n));let o=[e.command].concat(e.args).join(" ");e.args=["/d","/s","/c",`"${o}"`],e.command=process.env.comspec||"cmd.exe",e.options.windowsVerbatimArguments=!0}return e}function Dn(e,t,r){t&&!Array.isArray(t)&&(r=t,t=null),t=t?t.slice(0):[],r=Object.assign({},r);let n={command:e,args:t,options:r,file:void 0,original:{command:e,args:t}};return r.shell?n:Un(n)}rt.exports=Dn});var at=c((Ro,it)=>{"use strict";var se=process.platform==="win32";function ie(e,t){return Object.assign(new Error(`${t} ${e.command} ENOENT`),{code:"ENOENT",errno:"ENOENT",syscall:`${t} ${e.command}`,path:e.command,spawnargs:e.args})}function Xn(e,t){if(!se)return;let r=e.emit;e.emit=function(n,o){if(n==="exit"){let s=st(o,t,"spawn");if(s)return r.call(e,"error",s)}return r.apply(e,arguments)}}function st(e,t){return se&&e===1&&!t.file?ie(t.original,"spawn"):null}function Hn(e,t){return se&&e===1&&!t.file?ie(t.original,"spawnSync"):null}it.exports={hookChildProcess:Xn,verifyENOENT:st,verifyENOENTSync:Hn,notFoundError:ie}});var lt=c((Oo,T)=>{"use strict";var ct=require("child_process"),ae=ot(),ce=at();function ut(e,t,r){let n=ae(e,t,r),o=ct.spawn(n.command,n.args,n.options);return ce.hookChildProcess(o,n),o}function Kn(e,t,r){let n=ae(e,t,r),o=ct.spawnSync(n.command,n.args,n.options);return o.error=o.error||ce.verifyENOENTSync(o.status,n),o}T.exports=ut;T.exports.spawn=ut;T.exports.sync=Kn;T.exports._parse=ae;T.exports._enoent=ce});var ft=c((No,dt)=>{"use strict";dt.exports=e=>{let t=typeof e=="string"?`
`:10,r=typeof e=="string"?"\r":13;return e[e.length-1]===t&&(e=e.slice(0,e.length-1)),e[e.length-1]===r&&(e=e.slice(0,e.length-1)),e}});var ht=c((ko,N)=>{"use strict";var O=require("path"),pt=te(),mt=e=>{e={cwd:process.cwd(),path:process.env[pt()],execPath:process.execPath,...e};let t,r=O.resolve(e.cwd),n=[];for(;t!==r;)n.push(O.join(r,"node_modules/.bin")),t=r,r=O.resolve(r,"..");let o=O.resolve(e.cwd,e.execPath,"..");return n.push(o),n.concat(e.path).join(O.delimiter)};N.exports=mt;N.exports.default=mt;N.exports.env=e=>{e={env:process.env,...e};let t={...e.env},r=pt({env:t});return e.path=t[r],t[r]=N.exports(e),t}});var yt=c(($o,ue)=>{"use strict";var St=(e,t)=>{for(let r of Reflect.ownKeys(t))Object.defineProperty(e,r,Object.getOwnPropertyDescriptor(t,r));return e};ue.exports=St;ue.exports.default=St});var xt=c((_o,U)=>{"use strict";var Wn=yt(),F=new WeakMap,gt=(e,t={})=>{if(typeof e!="function")throw new TypeError("Expected a function");let r,n=0,o=e.displayName||e.name||"<anonymous>",s=function(...i){if(F.set(s,++n),n===1)r=e.apply(this,i),e=null;else if(t.throw===!0)throw new Error(`Function \`${o}\` can only be called once`);return r};return Wn(s,e),F.set(s,n),s};U.exports=gt;U.exports.default=gt;U.exports.callCount=e=>{if(!F.has(e))throw new Error(`The given function \`${e.name}\` is not wrapped by the \`onetime\` package`);return F.get(e)}});var bt=c(D=>{"use strict";Object.defineProperty(D,"__esModule",{value:!0});D.SIGNALS=void 0;var zn=[{name:"SIGHUP",number:1,action:"terminate",description:"Terminal closed",standard:"posix"},{name:"SIGINT",number:2,action:"terminate",description:"User interruption with CTRL-C",standard:"ansi"},{name:"SIGQUIT",number:3,action:"core",description:"User interruption with CTRL-\\",standard:"posix"},{name:"SIGILL",number:4,action:"core",description:"Invalid machine instruction",standard:"ansi"},{name:"SIGTRAP",number:5,action:"core",description:"Debugger breakpoint",standard:"posix"},{name:"SIGABRT",number:6,action:"core",description:"Aborted",standard:"ansi"},{name:"SIGIOT",number:6,action:"core",description:"Aborted",standard:"bsd"},{name:"SIGBUS",number:7,action:"core",description:"Bus error due to misaligned, non-existing address or paging error",standard:"bsd"},{name:"SIGEMT",number:7,action:"terminate",description:"Command should be emulated but is not implemented",standard:"other"},{name:"SIGFPE",number:8,action:"core",description:"Floating point arithmetic error",standard:"ansi"},{name:"SIGKILL",number:9,action:"terminate",description:"Forced termination",standard:"posix",forced:!0},{name:"SIGUSR1",number:10,action:"terminate",description:"Application-specific signal",standard:"posix"},{name:"SIGSEGV",number:11,action:"core",description:"Segmentation fault",standard:"ansi"},{name:"SIGUSR2",number:12,action:"terminate",description:"Application-specific signal",standard:"posix"},{name:"SIGPIPE",number:13,action:"terminate",description:"Broken pipe or socket",standard:"posix"},{name:"SIGALRM",number:14,action:"terminate",description:"Timeout or timer",standard:"posix"},{name:"SIGTERM",number:15,action:"terminate",description:"Termination",standard:"ansi"},{name:"SIGSTKFLT",number:16,action:"terminate",description:"Stack is empty or overflowed",standard:"other"},{name:"SIGCHLD",number:17,action:"ignore",description:"Child process terminated, paused or unpaused",standard:"posix"},{name:"SIGCLD",number:17,action:"ignore",description:"Child process terminated, paused or unpaused",standard:"other"},{name:"SIGCONT",number:18,action:"unpause",description:"Unpaused",standard:"posix",forced:!0},{name:"SIGSTOP",number:19,action:"pause",description:"Paused",standard:"posix",forced:!0},{name:"SIGTSTP",number:20,action:"pause",description:'Paused using CTRL-Z or "suspend"',standard:"posix"},{name:"SIGTTIN",number:21,action:"pause",description:"Background process cannot read terminal input",standard:"posix"},{name:"SIGBREAK",number:21,action:"terminate",description:"User interruption with CTRL-BREAK",standard:"other"},{name:"SIGTTOU",number:22,action:"pause",description:"Background process cannot write to terminal output",standard:"posix"},{name:"SIGURG",number:23,action:"ignore",description:"Socket received out-of-band data",standard:"bsd"},{name:"SIGXCPU",number:24,action:"core",description:"Process timed out",standard:"bsd"},{name:"SIGXFSZ",number:25,action:"core",description:"File too big",standard:"bsd"},{name:"SIGVTALRM",number:26,action:"terminate",description:"Timeout or timer",standard:"bsd"},{name:"SIGPROF",number:27,action:"terminate",description:"Timeout or timer",standard:"bsd"},{name:"SIGWINCH",number:28,action:"ignore",description:"Terminal window size changed",standard:"bsd"},{name:"SIGIO",number:29,action:"terminate",description:"I/O is available",standard:"other"},{name:"SIGPOLL",number:29,action:"terminate",description:"Watched event",standard:"other"},{name:"SIGINFO",number:29,action:"ignore",description:"Request for process information",standard:"other"},{name:"SIGPWR",number:30,action:"terminate",description:"Device running out of power",standard:"systemv"},{name:"SIGSYS",number:31,action:"core",description:"Invalid system call",standard:"other"},{name:"SIGUNUSED",number:31,action:"terminate",description:"Invalid system call",standard:"other"}];D.SIGNALS=zn});var le=c(C=>{"use strict";Object.defineProperty(C,"__esModule",{value:!0});C.SIGRTMAX=C.getRealtimeSignals=void 0;var Vn=function(){let e=vt-wt+1;return Array.from({length:e},Yn)};C.getRealtimeSignals=Vn;var Yn=function(e,t){return{name:`SIGRT${t+1}`,number:wt+t,action:"terminate",description:"Application-specific signal (realtime)",standard:"posix"}},wt=34,vt=64;C.SIGRTMAX=vt});var Et=c(X=>{"use strict";Object.defineProperty(X,"__esModule",{value:!0});X.getSignals=void 0;var Jn=require("os"),Qn=bt(),Zn=le(),er=function(){let e=(0,Zn.getRealtimeSignals)();return[...Qn.SIGNALS,...e].map(tr)};X.getSignals=er;var tr=function({name:e,number:t,description:r,action:n,forced:o=!1,standard:s}){let{signals:{[e]:i}}=Jn.constants,a=i!==void 0;return{name:e,number:a?i:t,description:r,supported:a,action:n,forced:o,standard:s}}});var Tt=c(P=>{"use strict";Object.defineProperty(P,"__esModule",{value:!0});P.signalsByNumber=P.signalsByName=void 0;var nr=require("os"),It=Et(),rr=le(),or=function(){return(0,It.getSignals)().reduce(sr,{})},sr=function(e,{name:t,number:r,description:n,supported:o,action:s,forced:i,standard:a}){return{...e,[t]:{name:t,number:r,description:n,supported:o,action:s,forced:i,standard:a}}},ir=or();P.signalsByName=ir;var ar=function(){let e=(0,It.getSignals)(),t=rr.SIGRTMAX+1,r=Array.from({length:t},(n,o)=>cr(o,e));return Object.assign({},...r)},cr=function(e,t){let r=ur(e,t);if(r===void 0)return{};let{name:n,description:o,supported:s,action:i,forced:a,standard:u}=r;return{[e]:{name:n,number:e,description:o,supported:s,action:i,forced:a,standard:u}}},ur=function(e,t){let r=t.find(({name:n})=>nr.constants.signals[n]===e);return r!==void 0?r:t.find(n=>n.number===e)},lr=ar();P.signalsByNumber=lr});var Pt=c((Fo,Ct)=>{"use strict";var{signalsByName:dr}=Tt(),fr=({timedOut:e,timeout:t,errorCode:r,signal:n,signalDescription:o,exitCode:s,isCanceled:i})=>e?`timed out after ${t} milliseconds`:i?"was canceled":r!==void 0?`failed with ${r}`:n!==void 0?`was killed with ${n} (${o})`:s!==void 0?`failed with exit code ${s}`:"failed",pr=({stdout:e,stderr:t,all:r,error:n,signal:o,exitCode:s,command:i,escapedCommand:a,timedOut:u,isCanceled:l,killed:f,parsed:{options:{timeout:h}}})=>{s=s===null?void 0:s,o=o===null?void 0:o;let m=o===void 0?void 0:dr[o].description,S=n&&n.code,g=`Command ${fr({timedOut:u,timeout:h,errorCode:S,signal:o,signalDescription:m,exitCode:s,isCanceled:l})}: ${i}`,E=Object.prototype.toString.call(n)==="[object Error]",L=E?`${g}
${n.message}`:g,M=[L,t,e].filter(Boolean).join(`
`);return E?(n.originalMessage=n.message,n.message=M):n=new Error(M),n.shortMessage=L,n.command=i,n.escapedCommand=a,n.exitCode=s,n.signal=o,n.signalDescription=m,n.stdout=e,n.stderr=t,r!==void 0&&(n.all=r),"bufferedData"in n&&delete n.bufferedData,n.failed=!0,n.timedOut=!!u,n.isCanceled=l,n.killed=f&&!u,n};Ct.exports=pr});var At=c((Uo,de)=>{"use strict";var H=["stdin","stdout","stderr"],mr=e=>H.some(t=>e[t]!==void 0),Gt=e=>{if(!e)return;let{stdio:t}=e;if(t===void 0)return H.map(n=>e[n]);if(mr(e))throw new Error(`It's not possible to provide \`stdio\` in combination with one of ${H.map(n=>`\`${n}\``).join(", ")}`);if(typeof t=="string")return t;if(!Array.isArray(t))throw new TypeError(`Expected \`stdio\` to be of type \`string\` or \`Array\`, got \`${typeof t}\``);let r=Math.max(t.length,H.length);return Array.from({length:r},(n,o)=>t[o])};de.exports=Gt;de.exports.node=e=>{let t=Gt(e);return t==="ipc"?"ipc":t===void 0||typeof t=="string"?[t,t,t,"ipc"]:t.includes("ipc")?t:[...t,"ipc"]}});var qt=c((Do,K)=>{K.exports=["SIGABRT","SIGALRM","SIGHUP","SIGINT","SIGTERM"];process.platform!=="win32"&&K.exports.push("SIGVTALRM","SIGXCPU","SIGXFSZ","SIGUSR2","SIGTRAP","SIGSYS","SIGQUIT","SIGIOT");process.platform==="linux"&&K.exports.push("SIGIO","SIGPOLL","SIGPWR","SIGSTKFLT","SIGUNUSED")});var $t=c((Xo,q)=>{var d=global.process,w=function(e){return e&&typeof e=="object"&&typeof e.removeListener=="function"&&typeof e.emit=="function"&&typeof e.reallyExit=="function"&&typeof e.listeners=="function"&&typeof e.kill=="function"&&typeof e.pid=="number"&&typeof e.on=="function"};w(d)?(Rt=require("assert"),G=qt(),Ot=/^win/i.test(d.platform),k=require("events"),typeof k!="function"&&(k=k.EventEmitter),d.__signal_exit_emitter__?p=d.__signal_exit_emitter__:(p=d.__signal_exit_emitter__=new k,p.count=0,p.emitted={}),p.infinite||(p.setMaxListeners(1/0),p.infinite=!0),q.exports=function(e,t){if(!w(global.process))return function(){};Rt.equal(typeof e,"function","a callback must be provided for exit handler"),A===!1&&fe();var r="exit";t&&t.alwaysLast&&(r="afterexit");var n=function(){p.removeListener(r,e),p.listeners("exit").length===0&&p.listeners("afterexit").length===0&&W()};return p.on(r,e),n},W=function(){!A||!w(global.process)||(A=!1,G.forEach(function(t){try{d.removeListener(t,z[t])}catch{}}),d.emit=V,d.reallyExit=pe,p.count-=1)},q.exports.unload=W,v=function(t,r,n){p.emitted[t]||(p.emitted[t]=!0,p.emit(t,r,n))},z={},G.forEach(function(e){z[e]=function(){if(w(global.process)){var r=d.listeners(e);r.length===p.count&&(W(),v("exit",null,e),v("afterexit",null,e),Ot&&e==="SIGHUP"&&(e="SIGINT"),d.kill(d.pid,e))}}}),q.exports.signals=function(){return G},A=!1,fe=function(){A||!w(global.process)||(A=!0,p.count+=1,G=G.filter(function(t){try{return d.on(t,z[t]),!0}catch{return!1}}),d.emit=kt,d.reallyExit=Nt)},q.exports.load=fe,pe=d.reallyExit,Nt=function(t){w(global.process)&&(d.exitCode=t||0,v("exit",d.exitCode,null),v("afterexit",d.exitCode,null),pe.call(d,d.exitCode))},V=d.emit,kt=function(t,r){if(t==="exit"&&w(global.process)){r!==void 0&&(d.exitCode=r);var n=V.apply(this,arguments);return v("exit",d.exitCode,null),v("afterexit",d.exitCode,null),n}else return V.apply(this,arguments)}):q.exports=function(){return function(){}};var Rt,G,Ot,k,p,W,v,z,A,fe,pe,Nt,V,kt});var Lt=c((Ho,_t)=>{"use strict";var hr=require("os"),Sr=$t(),yr=1e3*5,gr=(e,t="SIGTERM",r={})=>{let n=e(t);return xr(e,t,r,n),n},xr=(e,t,r,n)=>{if(!br(t,r,n))return;let o=vr(r),s=setTimeout(()=>{e("SIGKILL")},o);s.unref&&s.unref()},br=(e,{forceKillAfterTimeout:t},r)=>wr(e)&&t!==!1&&r,wr=e=>e===hr.constants.signals.SIGTERM||typeof e=="string"&&e.toUpperCase()==="SIGTERM",vr=({forceKillAfterTimeout:e=!0})=>{if(e===!0)return yr;if(!Number.isFinite(e)||e<0)throw new TypeError(`Expected the \`forceKillAfterTimeout\` option to be a non-negative integer, got \`${e}\` (${typeof e})`);return e},Er=(e,t)=>{e.kill()&&(t.isCanceled=!0)},Ir=(e,t,r)=>{e.kill(t),r(Object.assign(new Error("Timed out"),{timedOut:!0,signal:t}))},Tr=(e,{timeout:t,killSignal:r="SIGTERM"},n)=>{if(t===0||t===void 0)return n;let o,s=new Promise((a,u)=>{o=setTimeout(()=>{Ir(e,r,u)},t)}),i=n.finally(()=>{clearTimeout(o)});return Promise.race([s,i])},Cr=({timeout:e})=>{if(e!==void 0&&(!Number.isFinite(e)||e<0))throw new TypeError(`Expected the \`timeout\` option to be a non-negative integer, got \`${e}\` (${typeof e})`)},Pr=async(e,{cleanup:t,detached:r},n)=>{if(!t||r)return n;let o=Sr(()=>{e.kill()});return n.finally(()=>{o()})};_t.exports={spawnedKill:gr,spawnedCancel:Er,setupTimeout:Tr,validateTimeout:Cr,setExitHandler:Pr}});var Bt=c((Ko,Mt)=>{"use strict";var x=e=>e!==null&&typeof e=="object"&&typeof e.pipe=="function";x.writable=e=>x(e)&&e.writable!==!1&&typeof e._write=="function"&&typeof e._writableState=="object";x.readable=e=>x(e)&&e.readable!==!1&&typeof e._read=="function"&&typeof e._readableState=="object";x.duplex=e=>x.writable(e)&&x.readable(e);x.transform=e=>x.duplex(e)&&typeof e._transform=="function";Mt.exports=x});var Ft=c((Wo,jt)=>{"use strict";var{PassThrough:Gr}=require("stream");jt.exports=e=>{e={...e};let{array:t}=e,{encoding:r}=e,n=r==="buffer",o=!1;t?o=!(r||n):r=r||"utf8",n&&(r=null);let s=new Gr({objectMode:o});r&&s.setEncoding(r);let i=0,a=[];return s.on("data",u=>{a.push(u),o?i=a.length:i+=u.length}),s.getBufferedValue=()=>t?a:n?Buffer.concat(a,i):a.join(""),s.getBufferedLength=()=>i,s}});var Ut=c((zo,$)=>{"use strict";var{constants:Ar}=require("buffer"),qr=require("stream"),{promisify:Rr}=require("util"),Or=Ft(),Nr=Rr(qr.pipeline),Y=class extends Error{constructor(){super("maxBuffer exceeded"),this.name="MaxBufferError"}};async function me(e,t){if(!e)throw new Error("Expected a stream");t={maxBuffer:1/0,...t};let{maxBuffer:r}=t,n=Or(t);return await new Promise((o,s)=>{let i=a=>{a&&n.getBufferedLength()<=Ar.MAX_LENGTH&&(a.bufferedData=n.getBufferedValue()),s(a)};(async()=>{try{await Nr(e,n),o()}catch(a){i(a)}})(),n.on("data",()=>{n.getBufferedLength()>r&&i(new Y)})}),n.getBufferedValue()}$.exports=me;$.exports.buffer=(e,t)=>me(e,{...t,encoding:"buffer"});$.exports.array=(e,t)=>me(e,{...t,array:!0});$.exports.MaxBufferError=Y});var Xt=c((Vo,Dt)=>{"use strict";var{PassThrough:kr}=require("stream");Dt.exports=function(){var e=[],t=new kr({objectMode:!0});return t.setMaxListeners(0),t.add=r,t.isEmpty=n,t.on("unpipe",o),Array.prototype.slice.call(arguments).forEach(r),t;function r(s){return Array.isArray(s)?(s.forEach(r),this):(e.push(s),s.once("end",o.bind(null,s)),s.once("error",t.emit.bind(t,"error")),s.pipe(t,{end:!1}),this)}function n(){return e.length==0}function o(s){e=e.filter(function(i){return i!==s}),!e.length&&t.readable&&t.end()}}});var zt=c((Yo,Wt)=>{"use strict";var Kt=Bt(),Ht=Ut(),$r=Xt(),_r=(e,t)=>{t===void 0||e.stdin===void 0||(Kt(t)?t.pipe(e.stdin):e.stdin.end(t))},Lr=(e,{all:t})=>{if(!t||!e.stdout&&!e.stderr)return;let r=$r();return e.stdout&&r.add(e.stdout),e.stderr&&r.add(e.stderr),r},he=async(e,t)=>{if(e){e.destroy();try{return await t}catch(r){return r.bufferedData}}},Se=(e,{encoding:t,buffer:r,maxBuffer:n})=>{if(!(!e||!r))return t?Ht(e,{encoding:t,maxBuffer:n}):Ht.buffer(e,{maxBuffer:n})},Mr=async({stdout:e,stderr:t,all:r},{encoding:n,buffer:o,maxBuffer:s},i)=>{let a=Se(e,{encoding:n,buffer:o,maxBuffer:s}),u=Se(t,{encoding:n,buffer:o,maxBuffer:s}),l=Se(r,{encoding:n,buffer:o,maxBuffer:s*2});try{return await Promise.all([i,a,u,l])}catch(f){return Promise.all([{error:f,signal:f.signal,timedOut:f.timedOut},he(e,a),he(t,u),he(r,l)])}},Br=({input:e})=>{if(Kt(e))throw new TypeError("The `input` option cannot be a stream in sync mode")};Wt.exports={handleInput:_r,makeAllStream:Lr,getSpawnedResult:Mr,validateInputSync:Br}});var Yt=c((Jo,Vt)=>{"use strict";var jr=(async()=>{})().constructor.prototype,Fr=["then","catch","finally"].map(e=>[e,Reflect.getOwnPropertyDescriptor(jr,e)]),Ur=(e,t)=>{for(let[r,n]of Fr){let o=typeof t=="function"?(...s)=>Reflect.apply(n.value,t(),s):n.value.bind(t);Reflect.defineProperty(e,r,{...n,value:o})}return e},Dr=e=>new Promise((t,r)=>{e.on("exit",(n,o)=>{t({exitCode:n,signal:o})}),e.on("error",n=>{r(n)}),e.stdin&&e.stdin.on("error",n=>{r(n)})});Vt.exports={mergePromise:Ur,getSpawnedPromise:Dr}});var Zt=c((Qo,Qt)=>{"use strict";var Jt=(e,t=[])=>Array.isArray(t)?[e,...t]:[e],Xr=/^[\w.-]+$/,Hr=/"/g,Kr=e=>typeof e!="string"||Xr.test(e)?e:`"${e.replace(Hr,'\\"')}"`,Wr=(e,t)=>Jt(e,t).join(" "),zr=(e,t)=>Jt(e,t).map(r=>Kr(r)).join(" "),Vr=/ +/g,Yr=e=>{let t=[];for(let r of e.trim().split(Vr)){let n=t[t.length-1];n&&n.endsWith("\\")?t[t.length-1]=`${n.slice(0,-1)} ${r}`:t.push(r)}return t};Qt.exports={joinCommand:Wr,getEscapedCommand:zr,parseCommand:Yr}});var an=c((Zo,R)=>{"use strict";var Jr=require("path"),ye=require("child_process"),Qr=lt(),Zr=ft(),eo=ht(),to=xt(),J=Pt(),tn=At(),{spawnedKill:no,spawnedCancel:ro,setupTimeout:oo,validateTimeout:so,setExitHandler:io}=Lt(),{handleInput:ao,getSpawnedResult:co,makeAllStream:uo,validateInputSync:lo}=zt(),{mergePromise:en,getSpawnedPromise:fo}=Yt(),{joinCommand:nn,parseCommand:rn,getEscapedCommand:on}=Zt(),po=1e3*1e3*100,mo=({env:e,extendEnv:t,preferLocal:r,localDir:n,execPath:o})=>{let s=t?{...process.env,...e}:e;return r?eo.env({env:s,cwd:n,execPath:o}):s},sn=(e,t,r={})=>{let n=Qr._parse(e,t,r);return e=n.command,t=n.args,r=n.options,r={maxBuffer:po,buffer:!0,stripFinalNewline:!0,extendEnv:!0,preferLocal:!1,localDir:r.cwd||process.cwd(),execPath:process.execPath,encoding:"utf8",reject:!0,cleanup:!0,all:!1,windowsHide:!0,...r},r.env=mo(r),r.stdio=tn(r),process.platform==="win32"&&Jr.basename(e,".exe")==="cmd"&&t.unshift("/q"),{file:e,args:t,options:r,parsed:n}},_=(e,t,r)=>typeof t!="string"&&!Buffer.isBuffer(t)?r===void 0?void 0:"":e.stripFinalNewline?Zr(t):t,Q=(e,t,r)=>{let n=sn(e,t,r),o=nn(e,t),s=on(e,t);so(n.options);let i;try{i=ye.spawn(n.file,n.args,n.options)}catch(S){let y=new ye.ChildProcess,g=Promise.reject(J({error:S,stdout:"",stderr:"",all:"",command:o,escapedCommand:s,parsed:n,timedOut:!1,isCanceled:!1,killed:!1}));return en(y,g)}let a=fo(i),u=oo(i,n.options,a),l=io(i,n.options,u),f={isCanceled:!1};i.kill=no.bind(null,i.kill.bind(i)),i.cancel=ro.bind(null,i,f);let m=to(async()=>{let[{error:S,exitCode:y,signal:g,timedOut:E},L,M,pn]=await co(i,n.options,l),ge=_(n.options,L),xe=_(n.options,M),be=_(n.options,pn);if(S||y!==0||g!==null){let we=J({error:S,exitCode:y,signal:g,stdout:ge,stderr:xe,all:be,command:o,escapedCommand:s,parsed:n,timedOut:E,isCanceled:f.isCanceled,killed:i.killed});if(!n.options.reject)return we;throw we}return{command:o,escapedCommand:s,exitCode:0,stdout:ge,stderr:xe,all:be,failed:!1,timedOut:!1,isCanceled:!1,killed:!1}});return ao(i,n.options.input),i.all=uo(i,n.options),en(i,m)};R.exports=Q;R.exports.sync=(e,t,r)=>{let n=sn(e,t,r),o=nn(e,t),s=on(e,t);lo(n.options);let i;try{i=ye.spawnSync(n.file,n.args,n.options)}catch(l){throw J({error:l,stdout:"",stderr:"",all:"",command:o,escapedCommand:s,parsed:n,timedOut:!1,isCanceled:!1,killed:!1})}let a=_(n.options,i.stdout,i.error),u=_(n.options,i.stderr,i.error);if(i.error||i.status!==0||i.signal!==null){let l=J({stdout:a,stderr:u,error:i.error,signal:i.signal,exitCode:i.status,command:o,escapedCommand:s,parsed:n,timedOut:i.error&&i.error.code==="ETIMEDOUT",isCanceled:!1,killed:i.signal!==null});if(!n.options.reject)return l;throw l}return{command:o,escapedCommand:s,exitCode:0,stdout:a,stderr:u,failed:!1,timedOut:!1,isCanceled:!1,killed:!1}};R.exports.command=(e,t)=>{let[r,...n]=rn(e);return Q(r,n,t)};R.exports.commandSync=(e,t)=>{let[r,...n]=rn(e);return Q.sync(r,n,t)};R.exports.node=(e,t,r={})=>{t&&!Array.isArray(t)&&typeof t=="object"&&(r=t,t=[]);let n=tn.node(r),o=process.execArgv.filter(a=>!a.startsWith("--inspect")),{nodePath:s=process.execPath,nodeOptions:i=o}=r;return Q(s,[...i,e,...Array.isArray(t)?t:[]],{...r,stdin:void 0,stdout:void 0,stderr:void 0,stdio:n,shell:!1})}});var yo={};xn(yo,{default:()=>So});module.exports=bn(yo);var fn=require("@raycast/api");var b=require("@raycast/api");var cn=Ee(require("node:process"),1),un=Ee(an(),1);async function ln(e){if(cn.default.platform!=="darwin")throw new Error("macOS only");let{stdout:t}=await(0,un.default)("osascript",["-e",e]);return t}function ho(e,t){return e==="Safari"?`do javascript "${t}"`:`execute javascript "${t}"`}async function dn(e){let t=(0,b.getPreferenceValues)().browser;try{let r=await ln(`
		    tell application "${t.name}"
		        repeat with w in (every window)
		            repeat with t in (every tab whose URL contains "music.youtube.com" or URL contains "youtube.com") of w
		              tell t
		                 return ${ho(t.name,e)}
		              end tell
		            end repeat
		        end repeat
		    end tell
		    return "false"
		`);return r==="false"?(await(0,b.showToast)({style:b.Toast.Style.Failure,title:"The YouTube Music tab was not found",message:"Try to check selected browser in extension preferences."}),!1):r}catch(r){return r.stderr.includes("Allow JavaScript from Apple Events")&&await(0,b.showToast)({style:b.Toast.Style.Failure,title:"Cannot run JavaScript in selected browser.",message:`Enable the 'Allow JavaScript from Apple Events' option in ${t.name}'s Develop menu.`}),!1}}var So=async()=>{if(await dn("(document.querySelector('#play-pause-button') || document.querySelector('.ytp-play-button')).click();"))return await(0,fn.closeMainWindow)()};

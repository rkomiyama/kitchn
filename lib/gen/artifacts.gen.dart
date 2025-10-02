// GENERATED – do not modify by hand

// ignore_for_file: camel_case_types
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: constant_identifier_names
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: unused_element
import "package:kitchn/models/user/user.dart";import "package:kitchn/models/user/user_private.dart";import "package:kitchn/models/user/user_capabilities.dart";import "package:kitchn/models/user/settings.dart";import "package:kitchn/models/recipe.dart";import "package:artifact/artifact.dart";import "dart:core";import "package:kitchn/models/user/user_role.dart";import "package:kitchn/models/user/user_grant.dart";
typedef _0=ArtifactCodecUtil;typedef _1=Map<String, dynamic>;typedef _2=List<String>;typedef _3=String;typedef _4=dynamic;typedef _5=int;typedef _6=User;typedef _7=UserPrivate;typedef _8=UserCapabilities;typedef _9=Settings;typedef _a=Recipe;typedef _b=DateTime;typedef _c=bool;typedef _d=ArgumentError;typedef _e=Set;typedef _f=List;typedef _g=UserGrant;typedef _h=UserRole;typedef _i=Set<UserGrant>;typedef _j=List<dynamic>;
const _2 _S=['username','lastOnline','email','settings','acceptedTerms','Missing required UserPrivate."email" in map ','role','grants','suspendedUntil','themeMode','title','image','summary','imageHash','Missing required Recipe."title" in map ','Missing required Recipe."image" in map ','Missing required Recipe."summary" in map ','Missing required Recipe."imageHash" in map '];const _j _V=["anonymous",Settings(),false,UserRole.user,<_g>{},"system"];const _c _T=true;const _c _F=false;const _5 _ = 0;
extension $User on _6{
  _6 get _H=>this;
  _3 toJson({bool pretty=_F})=>_0.j(pretty, toMap);
  _3 toYaml()=>_0.y(toMap);
  _3 toToml()=>_0.u(toMap);
  _3 toXml({bool pretty=_F})=>_0.z(pretty,toMap);
  _3 toProperties()=>_0.h(toMap);
  _1 toMap(){_;return <_3, _4>{_S[0]:_0.ea(username),_S[1]:_0.ea(lastOnline),}.$nn;}
  static _6 fromJson(String j)=>fromMap(_0.o(j));
  static _6 fromYaml(String j)=>fromMap(_0.v(j));
  static _6 fromToml(String j)=>fromMap(_0.t(j));
  static _6 fromProperties(String j)=>fromMap(_0.g(j));
  static _6 fromMap(_1 r){_;_1 m=r.$nn;return _6(username: m.$c(_S[0]) ?  _0.da(m[_S[0]], _3) as _3 : _V[0],lastOnline: m.$c(_S[1]) ?  _0.da(m[_S[1]], _b) as _b? : null,);}
  _6 copyWith({_3? username,_c resetUsername=_F,_b? lastOnline,_c deleteLastOnline=_F,})=>_6(username: resetUsername?_V[0]:(username??_H.username),lastOnline: deleteLastOnline?null:(lastOnline??_H.lastOnline),);
}
extension $UserPrivate on _7{
  _7 get _H=>this;
  _3 toJson({bool pretty=_F})=>_0.j(pretty, toMap);
  _3 toYaml()=>_0.y(toMap);
  _3 toToml()=>_0.u(toMap);
  _3 toXml({bool pretty=_F})=>_0.z(pretty,toMap);
  _3 toProperties()=>_0.h(toMap);
  _1 toMap(){_;return <_3, _4>{_S[2]:_0.ea(email),_S[3]:settings.toMap(),_S[4]:_0.ea(acceptedTerms),}.$nn;}
  static _7 fromJson(String j)=>fromMap(_0.o(j));
  static _7 fromYaml(String j)=>fromMap(_0.v(j));
  static _7 fromToml(String j)=>fromMap(_0.t(j));
  static _7 fromProperties(String j)=>fromMap(_0.g(j));
  static _7 fromMap(_1 r){_;_1 m=r.$nn;return _7(email: m.$c(_S[2])? _0.da(m[_S[2]], _3) as _3:(throw _d('${_S[5]}$m.')),settings: m.$c(_S[3]) ? $Settings.fromMap((m[_S[3]]) as _1) : _V[1],acceptedTerms: m.$c(_S[4]) ?  _0.da(m[_S[4]], _c) as _c : _V[2],);}
  _7 copyWith({_3? email,_9? settings,_c resetSettings=_F,_c? acceptedTerms,_c resetAcceptedTerms=_F,})=>_7(email: email??_H.email,settings: resetSettings?_V[1]:(settings??_H.settings),acceptedTerms: resetAcceptedTerms?_V[2]:(acceptedTerms??_H.acceptedTerms),);
}
extension $UserCapabilities on _8{
  _8 get _H=>this;
  _3 toJson({bool pretty=_F})=>_0.j(pretty, toMap);
  _3 toYaml()=>_0.y(toMap);
  _3 toToml()=>_0.u(toMap);
  _3 toXml({bool pretty=_F})=>_0.z(pretty,toMap);
  _3 toProperties()=>_0.h(toMap);
  _1 toMap(){_;return <_3, _4>{_S[6]:role.name,_S[7]:grants.$m((e)=> e.name).$l,_S[8]:_0.ea(suspendedUntil),}.$nn;}
  static _8 fromJson(String j)=>fromMap(_0.o(j));
  static _8 fromYaml(String j)=>fromMap(_0.v(j));
  static _8 fromToml(String j)=>fromMap(_0.t(j));
  static _8 fromProperties(String j)=>fromMap(_0.g(j));
  static _8 fromMap(_1 r){_;_1 m=r.$nn;return _8(role: m.$c(_S[6]) ? _0.e(UserRole.values, m[_S[6]]) as UserRole : _V[3],grants: m.$c(_S[7]) ?  (m[_S[7]] as _f).$m((e)=>_0.e(UserGrant.values, e) as UserGrant).$s : _V[4],suspendedUntil: m.$c(_S[8]) ?  _0.da(m[_S[8]], _b) as _b? : null,);}
  _8 copyWith({_h? role,_c resetRole=_F,_i? grants,_c resetGrants=_F,_i? appendGrants,_i? removeGrants,_b? suspendedUntil,_c deleteSuspendedUntil=_F,})=>_8(role: resetRole?_V[3]:(role??_H.role),grants: ((resetGrants?_V[4]:(grants??_H.grants)) as _i).$u(appendGrants,removeGrants),suspendedUntil: deleteSuspendedUntil?null:(suspendedUntil??_H.suspendedUntil),);
}
extension $Settings on _9{
  _9 get _H=>this;
  _3 toJson({bool pretty=_F})=>_0.j(pretty, toMap);
  _3 toYaml()=>_0.y(toMap);
  _3 toToml()=>_0.u(toMap);
  _3 toXml({bool pretty=_F})=>_0.z(pretty,toMap);
  _3 toProperties()=>_0.h(toMap);
  _1 toMap(){_;return <_3, _4>{_S[9]:_0.ea(themeMode),}.$nn;}
  static _9 fromJson(String j)=>fromMap(_0.o(j));
  static _9 fromYaml(String j)=>fromMap(_0.v(j));
  static _9 fromToml(String j)=>fromMap(_0.t(j));
  static _9 fromProperties(String j)=>fromMap(_0.g(j));
  static _9 fromMap(_1 r){_;_1 m=r.$nn;return _9(themeMode: m.$c(_S[9]) ?  _0.da(m[_S[9]], _3) as _3 : _V[5],);}
  _9 copyWith({_3? themeMode,_c resetThemeMode=_F,})=>_9(themeMode: resetThemeMode?_V[5]:(themeMode??_H.themeMode),);
}
extension $Recipe on _a{
  _a get _H=>this;
  _3 toJson({bool pretty=_F})=>_0.j(pretty, toMap);
  _3 toYaml()=>_0.y(toMap);
  _3 toToml()=>_0.u(toMap);
  _3 toXml({bool pretty=_F})=>_0.z(pretty,toMap);
  _3 toProperties()=>_0.h(toMap);
  _1 toMap(){_;return <_3, _4>{_S[10]:_0.ea(title),_S[11]:_0.ea(image),_S[12]:_0.ea(summary),_S[13]:_0.ea(imageHash),}.$nn;}
  static _a fromJson(String j)=>fromMap(_0.o(j));
  static _a fromYaml(String j)=>fromMap(_0.v(j));
  static _a fromToml(String j)=>fromMap(_0.t(j));
  static _a fromProperties(String j)=>fromMap(_0.g(j));
  static _a fromMap(_1 r){_;_1 m=r.$nn;return _a(title: m.$c(_S[10])? _0.da(m[_S[10]], _3) as _3:(throw _d('${_S[14]}$m.')),image: m.$c(_S[11])? _0.da(m[_S[11]], _3) as _3:(throw _d('${_S[15]}$m.')),summary: m.$c(_S[12])? _0.da(m[_S[12]], _3) as _3:(throw _d('${_S[16]}$m.')),imageHash: m.$c(_S[13])? _0.da(m[_S[13]], _3) as _3:(throw _d('${_S[17]}$m.')),);}
  _a copyWith({_3? title,_3? image,_3? summary,_3? imageHash,})=>_a(title: title??_H.title,image: image??_H.image,summary: summary??_H.summary,imageHash: imageHash??_H.imageHash,);
}


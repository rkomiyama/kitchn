// GENERATED – do not modify.
import 'package:kitchn/models/user/user.dart';
import 'package:kitchn/gen/artifacts.gen.dart';
import "dart:core";
import 'package:fire_crud/fire_crud.dart';
import 'package:fire_api/fire_api.dart';
import 'package:kitchn/models/user/user_private.dart';
import "package:kitchn/models/user/settings.dart";
import 'package:kitchn/models/user/user_capabilities.dart';
import "package:kitchn/models/user/user_role.dart";

/// CRUD Extensions for User
extension XFCrudBase$User on User {
  /// Gets this document (self) live and returns a new instance of [User] representing the new data
  Future<User?> get() => getSelfRaw<User>();
  
  /// Opens a self stream of [User] representing this document
  Stream<User?> stream() => streamSelfRaw<User>();
  
  /// Sets this [User] document to a new value
  Future<void> set(User to) => setSelfRaw<User>(to);
  
  /// Updates properties of this [User] with {"fieldName": VALUE, ...}
  Future<void> update(Map<String, dynamic> u) => updateSelfRaw<User>(u);
  
  /// Deletes this [User] document
  Future<void> delete() => deleteSelfRaw<User>();
  
  /// Sets this [User] document atomically by getting first then setting.
  Future<void> setAtomic(User Function(User?) txn) => setSelfAtomicRaw<User>(txn);
  
  Future<void> modify({
    
    /// Replaces the value of [username] with a new value atomically.
    String? username,
    
    /// Removes the [username] field from the document atomically using FieldValue.delete(). See https://cloud.google.com/firestore/docs/manage-data/delete-data#fields
    bool deleteUsername = false,
    
    /// Replaces the value of [lastOnline] with a new value atomically.
    DateTime? lastOnline,
    
    /// Removes the [lastOnline] field from the document atomically using FieldValue.delete(). See https://cloud.google.com/firestore/docs/manage-data/delete-data#fields
    bool deleteLastOnline = false,
    bool $z = false
  }) =>
    updateSelfRaw<User>({ 
      if(username != null) 'username': username,
      if(deleteUsername) 'username': FieldValue.delete(),
      if(lastOnline != null) 'lastOnline': lastOnline.toIso8601String(),
      if(deleteLastOnline) 'lastOnline': FieldValue.delete()
    });
}
    
/// CRUD Extensions for (UNIQUE) User.UserPrivate
extension XFCrudU$User$UserPrivate on User {
  Future<UserPrivate?> getUserPrivate() => getUnique<UserPrivate>();
  Future<void> setUserPrivate(UserPrivate value) => setUnique<UserPrivate>(value);
  Future<void> deleteUserPrivate() => deleteUnique<UserPrivate>();
  Stream<UserPrivate?> streamUserPrivate() => streamUnique<UserPrivate>(); 
  Future<void> updateUserPrivate(Map<String, dynamic> updates) => updateUnique<UserPrivate>(updates);
  Future<void> setUserPrivateAtomic(UserPrivate Function(UserPrivate?) txn) => setUniqueAtomic<UserPrivate>(txn);
  Future<void> ensureUserPrivateExists(UserPrivate or) => ensureExistsUnique<UserPrivate>(or);
  UserPrivate userPrivateModel() => modelUnique<UserPrivate>();
  Future<void> modifyUserPrivate({
    
    /// Replaces the value of [email] with a new value atomically.
    String? email,
    
    /// Removes the [email] field from the document atomically using FieldValue.delete(). See https://cloud.google.com/firestore/docs/manage-data/delete-data#fields
    bool deleteEmail = false,
    
    /// Replaces the value of [acceptedTerms] with a new value atomically.
    bool? acceptedTerms,
    
    /// Removes the [acceptedTerms] field from the document atomically using FieldValue.delete(). See https://cloud.google.com/firestore/docs/manage-data/delete-data#fields
    bool deleteAcceptedTerms = false,
    
    /// Replaces the value of [settings] with a new value atomically.
    Settings? settings,
    
    /// Removes the [settings] field from the document atomically using FieldValue.delete(). See https://cloud.google.com/firestore/docs/manage-data/delete-data#fields
    bool deleteSettings = false,
    bool $z = false
  }) =>
    updateUnique<UserPrivate>({ 
      if(email != null) 'email': email,
      if(deleteEmail) 'email': FieldValue.delete(),
      if(acceptedTerms != null) 'acceptedTerms': acceptedTerms,
      if(deleteAcceptedTerms) 'acceptedTerms': FieldValue.delete(),
      if(settings != null) 'settings': settings.toMap(),
      if(deleteSettings) 'settings': FieldValue.delete()
    });
} 

/// CRUD Extensions for (UNIQUE) User.UserCapabilities
extension XFCrudU$User$UserCapabilities on User {
  Future<UserCapabilities?> getUserCapabilities() => getUnique<UserCapabilities>();
  Future<void> setUserCapabilities(UserCapabilities value) => setUnique<UserCapabilities>(value);
  Future<void> deleteUserCapabilities() => deleteUnique<UserCapabilities>();
  Stream<UserCapabilities?> streamUserCapabilities() => streamUnique<UserCapabilities>(); 
  Future<void> updateUserCapabilities(Map<String, dynamic> updates) => updateUnique<UserCapabilities>(updates);
  Future<void> setUserCapabilitiesAtomic(UserCapabilities Function(UserCapabilities?) txn) => setUniqueAtomic<UserCapabilities>(txn);
  Future<void> ensureUserCapabilitiesExists(UserCapabilities or) => ensureExistsUnique<UserCapabilities>(or);
  UserCapabilities userCapabilitiesModel() => modelUnique<UserCapabilities>();
  Future<void> modifyUserCapabilities({
    
    /// Replaces the value of [role] with a new value atomically.
    UserRole? role,
    
    /// Removes the [role] field from the document atomically using FieldValue.delete(). See https://cloud.google.com/firestore/docs/manage-data/delete-data#fields
    bool deleteRole = false,
    
    /// Replaces the value of [suspendedUntil] with a new value atomically.
    DateTime? suspendedUntil,
    
    /// Removes the [suspendedUntil] field from the document atomically using FieldValue.delete(). See https://cloud.google.com/firestore/docs/manage-data/delete-data#fields
    bool deleteSuspendedUntil = false,
    bool $z = false
  }) =>
    updateUnique<UserCapabilities>({ 
      if(role != null) 'role': role.name,
      if(deleteRole) 'role': FieldValue.delete(),
      if(suspendedUntil != null) 'suspendedUntil': suspendedUntil.toIso8601String(),
      if(deleteSuspendedUntil) 'suspendedUntil': FieldValue.delete()
    });
} 


/// CRUD Extensions for UserPrivate
extension XFCrudBase$UserPrivate on UserPrivate {
  /// Gets this document (self) live and returns a new instance of [UserPrivate] representing the new data
  Future<UserPrivate?> get() => getSelfRaw<UserPrivate>();
  
  /// Opens a self stream of [UserPrivate] representing this document
  Stream<UserPrivate?> stream() => streamSelfRaw<UserPrivate>();
  
  /// Sets this [UserPrivate] document to a new value
  Future<void> set(UserPrivate to) => setSelfRaw<UserPrivate>(to);
  
  /// Updates properties of this [UserPrivate] with {"fieldName": VALUE, ...}
  Future<void> update(Map<String, dynamic> u) => updateSelfRaw<UserPrivate>(u);
  
  /// Deletes this [UserPrivate] document
  Future<void> delete() => deleteSelfRaw<UserPrivate>();
  
  /// Sets this [UserPrivate] document atomically by getting first then setting.
  Future<void> setAtomic(UserPrivate Function(UserPrivate?) txn) => setSelfAtomicRaw<UserPrivate>(txn);
  
  Future<void> modify({
    
    /// Replaces the value of [email] with a new value atomically.
    String? email,
    
    /// Removes the [email] field from the document atomically using FieldValue.delete(). See https://cloud.google.com/firestore/docs/manage-data/delete-data#fields
    bool deleteEmail = false,
    
    /// Replaces the value of [acceptedTerms] with a new value atomically.
    bool? acceptedTerms,
    
    /// Removes the [acceptedTerms] field from the document atomically using FieldValue.delete(). See https://cloud.google.com/firestore/docs/manage-data/delete-data#fields
    bool deleteAcceptedTerms = false,
    
    /// Replaces the value of [settings] with a new value atomically.
    Settings? settings,
    
    /// Removes the [settings] field from the document atomically using FieldValue.delete(). See https://cloud.google.com/firestore/docs/manage-data/delete-data#fields
    bool deleteSettings = false,
    bool $z = false
  }) =>
    updateSelfRaw<UserPrivate>({ 
      if(email != null) 'email': email,
      if(deleteEmail) 'email': FieldValue.delete(),
      if(acceptedTerms != null) 'acceptedTerms': acceptedTerms,
      if(deleteAcceptedTerms) 'acceptedTerms': FieldValue.delete(),
      if(settings != null) 'settings': settings.toMap(),
      if(deleteSettings) 'settings': FieldValue.delete()
    });
}
    

/// CRUD Extensions for UserCapabilities
extension XFCrudBase$UserCapabilities on UserCapabilities {
  /// Gets this document (self) live and returns a new instance of [UserCapabilities] representing the new data
  Future<UserCapabilities?> get() => getSelfRaw<UserCapabilities>();
  
  /// Opens a self stream of [UserCapabilities] representing this document
  Stream<UserCapabilities?> stream() => streamSelfRaw<UserCapabilities>();
  
  /// Sets this [UserCapabilities] document to a new value
  Future<void> set(UserCapabilities to) => setSelfRaw<UserCapabilities>(to);
  
  /// Updates properties of this [UserCapabilities] with {"fieldName": VALUE, ...}
  Future<void> update(Map<String, dynamic> u) => updateSelfRaw<UserCapabilities>(u);
  
  /// Deletes this [UserCapabilities] document
  Future<void> delete() => deleteSelfRaw<UserCapabilities>();
  
  /// Sets this [UserCapabilities] document atomically by getting first then setting.
  Future<void> setAtomic(UserCapabilities Function(UserCapabilities?) txn) => setSelfAtomicRaw<UserCapabilities>(txn);
  
  Future<void> modify({
    
    /// Replaces the value of [role] with a new value atomically.
    UserRole? role,
    
    /// Removes the [role] field from the document atomically using FieldValue.delete(). See https://cloud.google.com/firestore/docs/manage-data/delete-data#fields
    bool deleteRole = false,
    
    /// Replaces the value of [suspendedUntil] with a new value atomically.
    DateTime? suspendedUntil,
    
    /// Removes the [suspendedUntil] field from the document atomically using FieldValue.delete(). See https://cloud.google.com/firestore/docs/manage-data/delete-data#fields
    bool deleteSuspendedUntil = false,
    bool $z = false
  }) =>
    updateSelfRaw<UserCapabilities>({ 
      if(role != null) 'role': role.name,
      if(deleteRole) 'role': FieldValue.delete(),
      if(suspendedUntil != null) 'suspendedUntil': suspendedUntil.toIso8601String(),
      if(deleteSuspendedUntil) 'suspendedUntil': FieldValue.delete()
    });
}
    

/// Root CRUD Extensions for RootFireCrud
extension XFCrudRoot$User on RootFireCrud {
  Future<int> countUsers([CollectionReference Function(CollectionReference ref)? query]) => $count<User>(query);
  Future<List<User>> getUsers([CollectionReference Function(CollectionReference ref)? query]) => getAll<User>(query);
  Stream<List<User>> streamUsers([CollectionReference Function(CollectionReference ref)? query]) => streamAll<User>(query);
  Future<void> setUser(String id, User value) => $set<User>(id, value);
  Future<User?> getUser(String id) => $get<User>(id);
  Future<void> updateUser(String id, Map<String, dynamic> updates) => $update<User>(id, updates);
  Stream<User?> streamUser(String id) => $stream<User>(id);
  Future<void> deleteUser(String id) => $delete<User>(id);
  Future<User> addUser(User value) => $add<User>(value);
  Future<void> setUserAtomic(String id, User Function(User?) txn) => $setAtomic<User>(id, txn);
  Future<void> ensureUserExists(String id, User or) => $ensureExists<User>(id, or);
  User userModel(String id) => $model<User>(id);
  Future<void> modifyUser({
    required String id,
    
    /// Replaces the value of [username] with a new value atomically.
    String? username,
    
    /// Removes the [username] field from the document atomically using FieldValue.delete(). See https://cloud.google.com/firestore/docs/manage-data/delete-data#fields
    bool deleteUsername = false,
    
    /// Replaces the value of [lastOnline] with a new value atomically.
    DateTime? lastOnline,
    
    /// Removes the [lastOnline] field from the document atomically using FieldValue.delete(). See https://cloud.google.com/firestore/docs/manage-data/delete-data#fields
    bool deleteLastOnline = false,
    bool $z = false
  }) =>
    $update<User>(id, { 
      if(username != null) 'username': username,
      if(deleteUsername) 'username': FieldValue.delete(),
      if(lastOnline != null) 'lastOnline': lastOnline.toIso8601String(),
      if(deleteLastOnline) 'lastOnline': FieldValue.delete()
    });
}
    

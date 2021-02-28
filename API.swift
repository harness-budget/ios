// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class DashboardQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Dashboard {
      currentUser {
        __typename
        safeToSpend {
          __typename
          fractional
        }
        safeToSpendFraction
        goalMetFraction
      }
    }
    """

  public let operationName: String = "Dashboard"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("currentUser", type: .object(CurrentUser.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(currentUser: CurrentUser? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "currentUser": currentUser.flatMap { (value: CurrentUser) -> ResultMap in value.resultMap }])
    }

    public var currentUser: CurrentUser? {
      get {
        return (resultMap["currentUser"] as? ResultMap).flatMap { CurrentUser(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "currentUser")
      }
    }

    public struct CurrentUser: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("safeToSpend", type: .nonNull(.object(SafeToSpend.selections))),
          GraphQLField("safeToSpendFraction", type: .nonNull(.scalar(Double.self))),
          GraphQLField("goalMetFraction", type: .nonNull(.scalar(Double.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(safeToSpend: SafeToSpend, safeToSpendFraction: Double, goalMetFraction: Double) {
        self.init(unsafeResultMap: ["__typename": "User", "safeToSpend": safeToSpend.resultMap, "safeToSpendFraction": safeToSpendFraction, "goalMetFraction": goalMetFraction])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Money available in accounts that is not set aside
      public var safeToSpend: SafeToSpend {
        get {
          return SafeToSpend(unsafeResultMap: resultMap["safeToSpend"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "safeToSpend")
        }
      }

      /// Not sure what this means yet, lol. Range: [0, 1]
      public var safeToSpendFraction: Double {
        get {
          return resultMap["safeToSpendFraction"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "safeToSpendFraction")
        }
      }

      /// The percent of goals met. Range: [0, 1]
      public var goalMetFraction: Double {
        get {
          return resultMap["goalMetFraction"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "goalMetFraction")
        }
      }

      public struct SafeToSpend: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Money"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("fractional", type: .nonNull(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(fractional: Int) {
          self.init(unsafeResultMap: ["__typename": "Money", "fractional": fractional])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fractional: Int {
          get {
            return resultMap["fractional"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "fractional")
          }
        }
      }
    }
  }
}

public final class LoginWithPhoneCodeMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation LoginWithPhoneCode($phoneNumber: String!, $code: String!) {
      loginWithPhoneCode(input: {phoneNumber: $phoneNumber, code: $code}) {
        __typename
        errors
        authToken
      }
    }
    """

  public let operationName: String = "LoginWithPhoneCode"

  public var phoneNumber: String
  public var code: String

  public init(phoneNumber: String, code: String) {
    self.phoneNumber = phoneNumber
    self.code = code
  }

  public var variables: GraphQLMap? {
    return ["phoneNumber": phoneNumber, "code": code]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("loginWithPhoneCode", arguments: ["input": ["phoneNumber": GraphQLVariable("phoneNumber"), "code": GraphQLVariable("code")]], type: .object(LoginWithPhoneCode.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(loginWithPhoneCode: LoginWithPhoneCode? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "loginWithPhoneCode": loginWithPhoneCode.flatMap { (value: LoginWithPhoneCode) -> ResultMap in value.resultMap }])
    }

    /// Login with a verification code sent via SMS. You can request a code be sent with sendLoginCode.
    /// 
    /// Once you have successfully logged in, pass the auth token via the Authorization header:
    /// 
    /// ```
    /// Authorization: Bearer ${authToken}
    /// ```
    public var loginWithPhoneCode: LoginWithPhoneCode? {
      get {
        return (resultMap["loginWithPhoneCode"] as? ResultMap).flatMap { LoginWithPhoneCode(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "loginWithPhoneCode")
      }
    }

    public struct LoginWithPhoneCode: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["LoginWithPhoneCodePayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("errors", type: .list(.nonNull(.scalar(String.self)))),
          GraphQLField("authToken", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(errors: [String]? = nil, authToken: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "LoginWithPhoneCodePayload", "errors": errors, "authToken": authToken])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var errors: [String]? {
        get {
          return resultMap["errors"] as? [String]
        }
        set {
          resultMap.updateValue(newValue, forKey: "errors")
        }
      }

      public var authToken: String? {
        get {
          return resultMap["authToken"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "authToken")
        }
      }
    }
  }
}

public final class SendLoginCodeMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation SendLoginCode($phone: String!) {
      sendLoginCode(input: {phoneNumber: $phone}) {
        __typename
        errors
        success
      }
    }
    """

  public let operationName: String = "SendLoginCode"

  public var phone: String

  public init(phone: String) {
    self.phone = phone
  }

  public var variables: GraphQLMap? {
    return ["phone": phone]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("sendLoginCode", arguments: ["input": ["phoneNumber": GraphQLVariable("phone")]], type: .object(SendLoginCode.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(sendLoginCode: SendLoginCode? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "sendLoginCode": sendLoginCode.flatMap { (value: SendLoginCode) -> ResultMap in value.resultMap }])
    }

    /// Request a verification code be sent via SMS. Later, claim an auth token by verifing the code via loginWithPhoneCode.
    public var sendLoginCode: SendLoginCode? {
      get {
        return (resultMap["sendLoginCode"] as? ResultMap).flatMap { SendLoginCode(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "sendLoginCode")
      }
    }

    public struct SendLoginCode: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["SendLoginCodePayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("errors", type: .list(.nonNull(.scalar(String.self)))),
          GraphQLField("success", type: .nonNull(.scalar(Bool.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(errors: [String]? = nil, success: Bool) {
        self.init(unsafeResultMap: ["__typename": "SendLoginCodePayload", "errors": errors, "success": success])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var errors: [String]? {
        get {
          return resultMap["errors"] as? [String]
        }
        set {
          resultMap.updateValue(newValue, forKey: "errors")
        }
      }

      public var success: Bool {
        get {
          return resultMap["success"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "success")
        }
      }
    }
  }
}

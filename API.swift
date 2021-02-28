// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class CreatePlaidLinkTokenMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CreatePlaidLinkToken {
      createPlaidLinkToken(input: {}) {
        __typename
        linkToken
      }
    }
    """

  public let operationName: String = "CreatePlaidLinkToken"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("createPlaidLinkToken", arguments: ["input": [:]], type: .object(CreatePlaidLinkToken.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createPlaidLinkToken: CreatePlaidLinkToken? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createPlaidLinkToken": createPlaidLinkToken.flatMap { (value: CreatePlaidLinkToken) -> ResultMap in value.resultMap }])
    }

    /// Create a Plaid link token. User must be able to link accounts.
    public var createPlaidLinkToken: CreatePlaidLinkToken? {
      get {
        return (resultMap["createPlaidLinkToken"] as? ResultMap).flatMap { CreatePlaidLinkToken(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "createPlaidLinkToken")
      }
    }

    public struct CreatePlaidLinkToken: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["CreatePlaidLinkTokenPayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("linkToken", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(linkToken: String) {
        self.init(unsafeResultMap: ["__typename": "CreatePlaidLinkTokenPayload", "linkToken": linkToken])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var linkToken: String {
        get {
          return resultMap["linkToken"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "linkToken")
        }
      }
    }
  }
}

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
        envelopes {
          __typename
          id
          name
          goalFractional
          balanceFractional
        }
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
          GraphQLField("envelopes", type: .nonNull(.list(.nonNull(.object(Envelope.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(safeToSpend: SafeToSpend, safeToSpendFraction: Double, goalMetFraction: Double, envelopes: [Envelope]) {
        self.init(unsafeResultMap: ["__typename": "User", "safeToSpend": safeToSpend.resultMap, "safeToSpendFraction": safeToSpendFraction, "goalMetFraction": goalMetFraction, "envelopes": envelopes.map { (value: Envelope) -> ResultMap in value.resultMap }])
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

      public var envelopes: [Envelope] {
        get {
          return (resultMap["envelopes"] as! [ResultMap]).map { (value: ResultMap) -> Envelope in Envelope(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Envelope) -> ResultMap in value.resultMap }, forKey: "envelopes")
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

      public struct Envelope: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Envelope"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("goalFractional", type: .scalar(Int.self)),
            GraphQLField("balanceFractional", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String? = nil, goalFractional: Int? = nil, balanceFractional: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "Envelope", "id": id, "name": name, "goalFractional": goalFractional, "balanceFractional": balanceFractional])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var goalFractional: Int? {
          get {
            return resultMap["goalFractional"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "goalFractional")
          }
        }

        public var balanceFractional: Int? {
          get {
            return resultMap["balanceFractional"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "balanceFractional")
          }
        }
      }
    }
  }
}

public final class LinkPlaidAccountMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation LinkPlaidAccount($publicToken: String!) {
      linkPlaidAccount(input: {publicToken: $publicToken}) {
        __typename
        bankAccount {
          __typename
          name
        }
      }
    }
    """

  public let operationName: String = "LinkPlaidAccount"

  public var publicToken: String

  public init(publicToken: String) {
    self.publicToken = publicToken
  }

  public var variables: GraphQLMap? {
    return ["publicToken": publicToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("linkPlaidAccount", arguments: ["input": ["publicToken": GraphQLVariable("publicToken")]], type: .object(LinkPlaidAccount.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(linkPlaidAccount: LinkPlaidAccount? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "linkPlaidAccount": linkPlaidAccount.flatMap { (value: LinkPlaidAccount) -> ResultMap in value.resultMap }])
    }

    public var linkPlaidAccount: LinkPlaidAccount? {
      get {
        return (resultMap["linkPlaidAccount"] as? ResultMap).flatMap { LinkPlaidAccount(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "linkPlaidAccount")
      }
    }

    public struct LinkPlaidAccount: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["LinkPlaidAccountPayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("bankAccount", type: .object(BankAccount.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(bankAccount: BankAccount? = nil) {
        self.init(unsafeResultMap: ["__typename": "LinkPlaidAccountPayload", "bankAccount": bankAccount.flatMap { (value: BankAccount) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var bankAccount: BankAccount? {
        get {
          return (resultMap["bankAccount"] as? ResultMap).flatMap { BankAccount(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "bankAccount")
        }
      }

      public struct BankAccount: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["BankAccount"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String) {
          self.init(unsafeResultMap: ["__typename": "BankAccount", "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
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

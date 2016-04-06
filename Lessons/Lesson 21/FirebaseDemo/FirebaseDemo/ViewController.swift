import UIKit
import Firebase
import Google

class ViewController: UIViewController, GIDSignInDelegate, GIDSignInUIDelegate {
    let ref = Firebase(url:"https://radiant-fire-1715.firebaseio.com")

    var auth: FAuthData?
    @IBOutlet weak var currentValueLabel: UILabel!
    
    @IBOutlet weak var currentLoggedInUser: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup delegates
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        // Attempt to sign in silently, this will succeed if
        // the user has recently been authenticated
        GIDSignIn.sharedInstance().signInSilently()

    }

    @IBOutlet weak var textField: UITextField!
    
    @IBAction func saveToFirebase() {
        
        let uid = auth!.uid
        
        let ref = Firebase(url:"https://radiant-fire-1715.firebaseio.com/users/\(uid)")

        ref.setValue(textField.text)
    }
    
    // Wire up to a button tap
    @IBAction func authenticateWithGoogle(sender: UIButton) {
        GIDSignIn.sharedInstance().signIn()
    }
    
    @IBAction func signOut() {
        GIDSignIn.sharedInstance().signOut()
        ref.unauth()
        self.currentLoggedInUser.text = "Logged out"
    }
    
    // Implement the required GIDSignInDelegate methods
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!,
        withError error: NSError!) {
            if (error == nil) {
                // Auth with Firebase
                ref.authWithOAuthProvider("google", token: user.authentication.accessToken, withCompletionBlock: { (error, authData) in
                    self.auth = authData
                    self.currentLoggedInUser.text = authData.providerData["displayName"] as? String
                    let uid = authData!.uid
                    
                    let ref = Firebase(url:"https://radiant-fire-1715.firebaseio.com/users/\(uid)")
                    ref.observeEventType(.Value, withBlock: {
                        snapshot in
                        self.currentValueLabel.text = "\(snapshot.value)"
                    })


                })
            } else {
                // Don't assert this error it is commonly returned as nil
                print("\(error.localizedDescription)")
            }
    }
    // Implement the required GIDSignInDelegate methods
    // Unauth when disconnected from Google
    func signIn(signIn: GIDSignIn!, didDisconnectWithUser user:GIDGoogleUser!,
        withError error: NSError!) {
            ref.unauth();
            self.currentLoggedInUser.text = "Logged out"
    }

}


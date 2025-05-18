
access(all) contract WordVerification {
    // Array to store the 5 words
    access(all) let words: [String]
    
    // Event to be emitted when verification is successful
    access(all) event VerificationSuccessful(word: String)
    
    // Event to be emitted when verification fails
    access(all) event VerificationFailed(attemptedWord: String)
    
    init() {
        // Initialize with your 5 specific words
        self.words = [
            "blockchain", 
            "flow", 
            "cadence", 
            "contract", 
            "verification"
        ]
    }
    
    // Public function to check if a word exists in our array
    access(all) fun verifyWord(word: String): Bool {
        let exists = self.words.contains(word)
        
        if exists {
            emit VerificationSuccessful(word: word)
        } else {
            emit VerificationFailed(attemptedWord: word)
        }
        
        return exists
    }
    
    // Public function to get all the words
    view access(all) fun getAllWords(): [String] {
        return self.words
    }
    
    // Public function to check if a specific index contains a specific word
    view access(all) fun verifyWordAtIndex(index: Int, word: String): Bool {
        if index < 0 || index >= self.words.length {
            return false
        }
        
        return self.words[index] == word
    }
}
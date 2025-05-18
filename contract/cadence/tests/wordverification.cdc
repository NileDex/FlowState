import Test
import "WordVerification"

access(all)
fun setup() {
    let err = Test.deployContract(
        name: "WordVerification",
        path: "./contracts/WordVerification.cdc",
        arguments: []
    )
    Test.expect(err, Test.beNil())
}

access(all)
fun testVerifyWord() {
    // Should succeed
    let result1 = WordVerification.verifyWord(word: "blockchain")
    Test.assert(result1, message: "Expected 'blockchain' to be verified")

    // Should fail
    let result2 = WordVerification.verifyWord(word: "notaword")
    Test.assert(!result2, message: "Expected 'notaword' to fail verification")
}

access(all)
fun testGetAllWords() {
    let expected = [
        "blockchain",
        "flow",
        "cadence",
        "contract",
        "verification"
    ]
    let actual = WordVerification.getAllWords()
    Test.assertEqual(expected, actual)
}

access(all)
fun testVerifyWordAtIndex() {
    // Correct word at index 2
    let result1 = WordVerification.verifyWordAtIndex(index: 2, word: "cadence")
    Test.assert(result1, message: "Expected 'cadence' at index 2")

    // Incorrect word at index 2
    let result2 = WordVerification.verifyWordAtIndex(index: 2, word: "blockchain")
    Test.assert(!result2, message: "Did not expect 'blockchain' at index 2")

    // Out of bounds index
    let result3 = WordVerification.verifyWordAtIndex(index: 10, word: "anything")
    Test.assert(!result3, message: "Expected out-of-bounds index to return false")
}

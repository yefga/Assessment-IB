import XCTest
@testable import App

class UserViewModelTests: XCTestCase {
    @MainActor
    func testFetchUsersSuccess() async {
        // Arrange
        let mockViewModel = MockUserViewModel()
        let testUsers = [
            User(
                id: 1,
                name: "Jan Cook",
                username: "jancook",
                email: "jancook@gmail.com",
                address: "Subaraya",
                phone: "+6287832123123",
                website: "www.jancook.com",
                company: "Jancook, Inc"
            )
        ]
        mockViewModel.fetchUsersToReturn = .success(testUsers)
        
        // Act
        await mockViewModel.fetchUsers()
        
        // Assert
        XCTAssertTrue(mockViewModel.fetchUsersCalled)
        XCTAssertEqual(mockViewModel.state.users, testUsers)
        XCTAssertNil(mockViewModel.state.error)
        XCTAssertFalse(mockViewModel.state.isLoading)
    }
    
    @MainActor
    func testFetchUsersFailure() async {
        // Arrange
        let mockViewModel = MockUserViewModel()
        let testError = NSError(domain: "TestError", code: 0, userInfo: nil)
        mockViewModel.fetchUsersToReturn = .failure(testError)
        
        // Act
        await mockViewModel.fetchUsers()
        
        // Assert
        XCTAssertTrue(mockViewModel.fetchUsersCalled)
        XCTAssertTrue(mockViewModel.state.users.isEmpty)
        XCTAssertNotNil(mockViewModel.state.error)
        XCTAssertFalse(mockViewModel.state.isLoading)
    }
}

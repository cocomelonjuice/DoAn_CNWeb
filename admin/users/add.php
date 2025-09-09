<?php
session_start();
ob_start();
$rootPath = '/AssignmentWeb/admin';

// Check if admin is logged in
if (!isset($_SESSION["email_ad"])) {
    header('location: ../login.php');
    exit();
}

require_once '../../db/DB.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Get form data
    $name = $_POST['name'];
    $email = $_POST['email'];
    $password = $_POST['password'];
    $phone = $_POST['phone'];
    $address = $_POST['address'];
    
    // Validate required fields
    if (empty($name) || empty($email) || empty($password) || empty($phone) || empty($address)) {
        $_SESSION['error'] = "Tất cả các trường đều bắt buộc!";
        header('location: index.php');
        exit();
    }
    
    // Check if email already exists
    $checkEmail = "SELECT email FROM user WHERE email = ?";
    $stmtCheck = $conn->prepare($checkEmail);
    $stmtCheck->bind_param("s", $email);
    $stmtCheck->execute();
    $result = $stmtCheck->get_result();
    
    if ($result->num_rows > 0) {
        $_SESSION['error'] = "Email đã tồn tại trong hệ thống!";
        $stmtCheck->close();
        header('location: index.php');
        exit();
    }
    $stmtCheck->close();
    
    // Insert new user into database
    $sql = "INSERT INTO user (name, email, password, phone, address, updated_at) VALUES (?, ?, ?, ?, ?, NOW())";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sssss", $name, $email, $password, $phone, $address);
    
    if ($stmt->execute()) {
        $_SESSION['success'] = "Thêm người dùng mới thành công!";
    } else {
        $_SESSION['error'] = "Lỗi khi thêm người dùng: " . $conn->error;
    }
    
    $stmt->close();
    $conn->close();
    
    header('location: index.php');
    exit();
} else {
    // If not POST request, redirect to index
    header('location: index.php');
    exit();
}
?> 
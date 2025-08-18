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
    $id = $_POST['id'];
    $name = $_POST['name'];
    $email = $_POST['email'];
    $password = $_POST['password'];
    $phone = $_POST['phone'];
    $address = $_POST['address'];
    
    // Validate required fields
    if (empty($id) || empty($name) || empty($email) || empty($password) || empty($phone) || empty($address)) {
        $_SESSION['error'] = "Tất cả các trường đều bắt buộc!";
        header('location: index.php');
        exit();
    }
    
    // Update user in database
    $sql = "UPDATE user SET name = ?, email = ?, password = ?, phone = ?, address = ?, updated_at = NOW() WHERE user_id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sssssi", $name, $email, $password, $phone, $address, $id);
    
    if ($stmt->execute()) {
        $_SESSION['success'] = "Cập nhật người dùng thành công!";
    } else {
        $_SESSION['error'] = "Lỗi khi cập nhật người dùng: " . $conn->error;
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
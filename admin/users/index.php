<?php
  session_start();
  ob_start();
  $rootPath = '/AssignmentWeb/admin';
  if (!isset($_SESSION["email_ad"])) {
      header('location: ../login.php');
  }

  require_once '../../db/DB.php';

  $sqlShowUser = "SELECT * FROM user";
  $users = $conn->query($sqlShowUser);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User</title>
    <link rel="stylesheet"  href="https://site-assets.fontawesome.com/releases/v6.1.2/css/all.css">
    <!-- CSS only -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <!-- <link rel="stylesheet" href="../includes/css/base.css">
    <link rel="stylesheet" href="../includes/css/home.css"> -->
</head>
<body>
<?php
    require '../includes/header.php';
    require '../includes/navbar.php';
?>

<div class="container-fluid my-5">
    <?php if (isset($_SESSION['success'])): ?>
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <?php echo $_SESSION['success']; ?>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <?php unset($_SESSION['success']); ?>
    <?php endif; ?>
    
    <?php if (isset($_SESSION['error'])): ?>
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <?php echo $_SESSION['error']; ?>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <?php unset($_SESSION['error']); ?>
    <?php endif; ?>
    
    <!-- Add User Button -->
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h4>Quản lý người dùng</h4>
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#Add">
            <i class="fa-light fa-plus"></i> Thêm người dùng
        </button>
    </div>
    
    <table class="table table-striped">
      <thead>
        <tr class="table-primary text-center">
          <th scope="col">STT</th>
          <th scope="col">Username</th>
          <th scope="col">Email</th>
          <th scope="col">Password</th>
          <th scope="col">SĐT</th>
          <th scope="col">Địa chỉ</th>
          <th scope="col">Ngày cập nhật</th>
          <th scope="col">Actions</th>
        </tr>
      </thead>
      <?php
        if ($users->num_rows>0) {
          $count = 1;
          while ($row = $users->fetch_assoc()) {
      ?>
      <tbody>
        <tr>
          <th class='align-middle text-center' scope="row"><?php echo $count?></th>
          <td class='align-middle text-center'><?php echo $row["name"]?></td>
          <td class='align-middle'><?php echo $row["email"]?></td>
          <td class='align-middle text-center'><?php echo $row["password"]?></td>
          <td class='align-middle text-center'><?php echo $row["phone"]?></td>
          <td class='align-middle'><?php echo $row["address"]?></td>
          <td class='align-middle text-center'><?php echo $row["updated_at"]?></td>
          <td class='align-middle'>    
            <div class="d-inline-flex">
            <button type='button' class='btn-edit btn btn-success m-1' data-bs-id='<?php echo $row['user_id'] ?>' data-bs-name='<?php echo htmlspecialchars($row["name"]) ?>' data-bs-email='<?php echo htmlspecialchars($row["email"]) ?>' data-bs-password='<?php echo htmlspecialchars($row["password"]) ?>' data-bs-phone='<?php echo htmlspecialchars($row["phone"]) ?>' data-bs-address='<?php echo htmlspecialchars($row["address"]) ?>' data-bs-target='#Edit' data-bs-toggle='modal'><i class="fa-light fa-pen-to-square"></i></button>
            <button type='button' class='btn-delete btn btn-danger m-1' data-bs-id='<?php echo $row['user_id'] ?>' data-bs-target='#Delete' data-bs-toggle='modal'><i class="fa-light fa-trash-can"></i></button>
            </div>
          </td>
        </tr>
      </tbody>
      <?php
              $count++;
          };
        }
      ?>
    </table>
    
    <!-- Edit Modal -->
    <div class="modal fade" id="Edit" tabindex="-1" role="dialog" aria-labelledby="Edit" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
          <div class="modal-content">
              <div class="modal-header">
                  <h5 class="modal-title">Chỉnh sửa người dùng</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <form action="edit.php" method="post">
                  <div class="modal-body">
                      <input type="hidden" name="id" />
                      <div class="row">
                          <div class="col-md-6 mb-3">
                              <label for="name" class="form-label">Username</label>
                              <input type="text" class="form-control" id="name" name="name" required>
                          </div>
                          <div class="col-md-6 mb-3">
                              <label for="email" class="form-label">Email</label>
                              <input type="email" class="form-control" id="email" name="email" required>
                          </div>
                      </div>
                      <div class="row">
                          <div class="col-md-6 mb-3">
                              <label for="password" class="form-label">Password</label>
                              <input type="text" class="form-control" id="password" name="password" required>
                          </div>
                          <div class="col-md-6 mb-3">
                              <label for="phone" class="form-label">SĐT</label>
                              <input type="text" class="form-control" id="phone" name="phone" required>
                          </div>
                      </div>
                      <div class="mb-3">
                          <label for="address" class="form-label">Địa chỉ</label>
                          <textarea class="form-control" id="address" name="address" rows="3" required></textarea>
                      </div>
                  </div>
                  <div class="modal-footer">
                      <button class="btn btn-secondary" type="button" data-bs-dismiss="modal">Đóng lại</button>
                      <button class="btn btn-primary" type="submit">Cập nhật</button>
                  </div>
              </form>
          </div>
        </div>
    </div>

    <!-- Delete Modal -->
    <div class="modal fade" id="Delete" tabindex="-1" role="dialog" aria-labelledby="Delete" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
              <div class="modal-header">
                  <h5 class="modal-title">Xoá người dùng</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <form action="delete.php" method="post">
                  <div class="modal-body">
                      <input type="hidden" name="id" />
                      <p>Bạn chắc chắn muốn xoá?</p>
                  </div>
                  <div class="modal-footer">
                      <button class="btn btn-primary btn-outline-light" type="button" data-bs-dismiss="modal">Đóng lại</button>
                      <button class="btn btn-danger btn-outline-light" type="submit">Xác nhận</button>
                  </div>
              </form>
          </div>
        </div>
    </div>

    <!-- Add User Modal -->
    <div class="modal fade" id="Add" tabindex="-1" role="dialog" aria-labelledby="Add" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
          <div class="modal-content">
              <div class="modal-header">
                  <h5 class="modal-title">Thêm người dùng mới</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <form action="add.php" method="post">
                  <div class="modal-body">
                      <div class="row">
                          <div class="col-md-6 mb-3">
                              <label for="add_name" class="form-label">Username</label>
                              <input type="text" class="form-control" id="add_name" name="name" required>
                          </div>
                          <div class="col-md-6 mb-3">
                              <label for="add_email" class="form-label">Email</label>
                              <input type="email" class="form-control" id="add_email" name="email" required>
                          </div>
                      </div>
                      <div class="row">
                          <div class="col-md-6 mb-3">
                              <label for="add_password" class="form-label">Password</label>
                              <input type="text" class="form-control" id="add_password" name="password" required>
                          </div>
                          <div class="col-md-6 mb-3">
                              <label for="add_phone" class="form-label">SĐT</label>
                              <input type="text" class="form-control" id="add_phone" name="phone" required>
                          </div>
                      </div>
                      <div class="mb-3">
                          <label for="add_address" class="form-label">Địa chỉ</label>
                          <textarea class="form-control" id="add_address" name="address" rows="3" required></textarea>
                      </div>
                  </div>
                  <div class="modal-footer">
                      <button class="btn btn-secondary" type="button" data-bs-dismiss="modal">Đóng lại</button>
                      <button class="btn btn-primary" type="submit">Thêm người dùng</button>
                  </div>
              </form>
          </div>
        </div>
    </div>

</div>

<?php
    require '../includes/footer.php';
?>
<script>
$(".btn-delete").click(function (e) {
    const id = this.getAttribute('data-bs-id')
    $("#Delete input[name='id']").val(id);
    $('#Delete').modal('show');
});

$(".btn-edit").click(function (e) {
    const id = this.getAttribute('data-bs-id');
    const name = this.getAttribute('data-bs-name');
    const email = this.getAttribute('data-bs-email');
    const password = this.getAttribute('data-bs-password');
    const phone = this.getAttribute('data-bs-phone');
    const address = this.getAttribute('data-bs-address');
    
    $("#Edit input[name='id']").val(id);
    $("#Edit input[name='name']").val(name);
    $("#Edit input[name='email']").val(email);
    $("#Edit input[name='password']").val(password);
    $("#Edit input[name='phone']").val(phone);
    $("#Edit textarea[name='address']").val(address);
    
    $('#Edit').modal('show');
});
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>
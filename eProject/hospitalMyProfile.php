<?php
include_once('header_hospital.php');
if (!isset($_SESSION['Hospital'])) {
    redirectWindow('signin.php');
}
;
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile</title>
    <style>
        .profile img {
            width: 13rem;
            height: 12rem;
            border-radius: 50%;
            margin-left: 3rem;
        }

        .w {
            width: 20rem;
            margin-left: 3rem;
        }

        .button {
            width: 20rem;
            margin-left: 3rem;
        }
    </style>
</head>

<body>
    <?php
    $user = $_SESSION['Hospital'];
    foreach ($user as $value) {
        $h_ID = $value['hospitalID'];
        $h_name = $value['hospitalName'];
        $h_email = $value['hospitalEmail'];

    }
    ?>

    <div class="container h-100 bg-light rounded">
        <form action="" method="post" enctype="multipart/form-data">
            <input type="hidden" name="h_id" value='<?php echo $h_ID ?>'>
            <div class="form-group w">
                <label for="" class='text-dark'>Update Username</label>
                <input type="text" name="h_name" value="<?php echo $h_name ?>" class='form-control'>
            </div>



            <div class="form-group w mt-4">
                <label for="" class='text-dark'>Update Email</label>
                <input type="email" name="h_email" value="<?php echo $h_email ?>" class='form-control'>
            </div>
            <button type='submit' name="h_edit" class='btn btn-primary button my-4'>Edit</button>
        </form>
    </div>
</body>

</html>
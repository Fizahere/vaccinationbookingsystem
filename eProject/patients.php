<?php
include_once('header_hospital.php');
if (!isset($_SESSION['Hospital'])) {
    redirectWindow('signin.php');
}
?>
<div class="container pt-4">
    <div class="bg-light rounded p-4">
        <div class="row">
            <div class="col-12">
                <div class="bg-white rounded h-100 ">
                    <div class="d-flex bg-light justify-content-between">

                        <h4>Patients</h4>

                    </div>
                    <div class="table-responsive bg- ">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>

                                    <th scope="col">Patient Name</th>
                                    <th scope="col">Gender</th>
                                    <th scope="col">Age</th>
                                    <th scope="col">vaccineID</th>
                                    <th scope="col">vaccination Date</th>
                                    <th scope="col">parentID</th>
                                    <th scope="col">contact</th>
                                    <th scope="col">appointmentStatus</th>
                                    <th scope="col"> </th>

                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                $user = $_SESSION['Hospital'];
                                foreach ($user as $value) {
                                    $hospitalID = $value['hospitalID'];
                                    // echo '<script>alert("' . $hospitalID . '")</script>'
                                ?>
                                    <div class="col-sm-10">
                                        <input type="hidden" name="getHospitalID" value="<?php echo $value['hospitalID'] ?>" class="form-control">
                                    </div>
                                    <?php

                                    $query = $pdo->prepare("SELECT * FROM children_details where hospitalID = :getHospitalID AND appointmentStatus = 'approved'");
                                    $query->bindParam('getHospitalID', $hospitalID, );
                                    $query->bindParam('getHospitalID', $hospitalID,);
                                    $query->execute();
                                    $result = $query->fetchAll(PDO::FETCH_ASSOC);
                                    // print_r($result);   
                                    $count = 1;
                                    foreach ($result as $row) {
                                    ?>
                                        <tr class="tr-row">
                                            <th scope="row">
                                                <?php echo $count ?>
                                            </th>

                                            <td>
                                                <?php echo $row['childName'] ?>
                                            </td>
                                            <td>
                                                <?php echo $row['childGender'] ?>
                                            </td>
                                            <td>
                                                <?php echo $row['childAge'] ?>
                                            </td>
                                            <td>
                                                <?php echo $row['vaccineID'] ?>
                                            </td>
                                            <td>
                                                <?php echo $row['vaccinationDate'] ?>
                                            </td>
                                            <td>
                                                <?php echo $row['parentID'] ?>
                                            </td>
                                            <td>
                                                <?php echo $row['contact'] ?>
                                            </td>
                                            <td>
                                                <?php echo $row['appointmentStatus'] ?>
                                            </td>
                                        </tr>
                                <?php
                                        $count++;
                                    }
                                };

                                ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<script src="js/script.js"></script>
<script>
    //  function togglePasswordVisibility() {
    //     const passwordInput = document.querySelector('.password-input');
    //     const eyeIcon = document.querySelector('.toggle-password i');

    //     if (passwordInput.type === 'password') {
    //         passwordInput.type = 'text';
    //         eyeIcon.classList.add('visible');
    //     } else {
    //         passwordInput.type = 'password';
    //         eyeIcon.classList.remove('visible');
    //     }
    //     // alert('hello');
    // }
</script>
<?php
include('footer.php')
?>
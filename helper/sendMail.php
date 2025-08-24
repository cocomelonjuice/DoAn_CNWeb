<?php



use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

function sendMailOrder($receiver, $content) {
    try {
        $mail = new PHPMailer(true);
        
        //Server settings for Gmail
        $mail->isSMTP();     
        $mail->CharSet  = "utf-8";                                     
        $mail->SMTPAuth   = true;                                  
        $mail->SMTPSecure = "tls";          
        $mail->Host       = 'smtp.gmail.com';                     
        $mail->Port       = 587; // Correct port for Gmail TLS                                    
        $mail->Username   = 'minhtiendh2018@gmail.com';                     
        $mail->Password   = 'yokk pmbn cltp hfpn';// google app password                            
        
        // Additional Gmail settings
        $mail->SMTPOptions = array(
            'ssl' => array(
                'verify_peer' => false,
                'verify_peer_name' => false,
                'allow_self_signed' => true
            )
        );
        
        //Recipients
        $mail->setFrom('minhtiendh2018@gmail.com', 'TheCoffeeHouse221');
        $mail->addAddress($receiver['email'], $receiver['name']);     
        $mail->addReplyTo('minhtiendh2018@gmail.com', 'TheCoffeeHouse221');

        //Content
        $mail->isHTML(true);                                  
        $mail->Subject = 'TheCoffeeHouse221 thông báo xác nhận đơn hàng #'.$receiver['id'];
        $mail->Body    = ' <html>
                                <body>
                                    <p>Xin chào quý khách <b>'.$receiver['name'].',</b></p>
                                    <p>Cảm ơn quý khách đã đặt hàng tại <a href="#">TheCoffeeHouse221</a>.</p>
                                    <p>Đơn hàng quý khách sẽ được gửi đi sau khi nhân viên xác nhận qua điện thoại, email,... Vui lòng không tra lời qua email này. Mọi chi tiết xin liên hệ 0909 1999 hoặc 1900 1900</p>

                                    <div>'.$content.'</div>
                                    <p><b style="color: blue">TheCoffeeHouse221</b></p>
                                </body>
                            </html>';

        $result = $mail->send();
        
        return $result;

    } catch (Exception $e) {
        if (isset($mail)) {
            error_log("PHPMailer ErrorInfo: " . $mail->ErrorInfo);
        }
        return false;
    }
}

function verifyEmail($receiver, $verifyCode) {
    try {
        $mail = new PHPMailer(true);
        
        //Server settings for Gmail
        $mail->isSMTP();     
        $mail->CharSet  = "utf-8";                                     
        $mail->SMTPAuth   = true;                                  
        $mail->SMTPSecure = "tls";          
        $mail->Host       = 'smtp.gmail.com';                     
        $mail->Port       = 587; // Correct port for Gmail TLS                                    
        $mail->Username   = 'minhtiendh2018@gmail.com';                     
        $mail->Password   = 'yokk pmbn cltp hfpn';                              
        
        // Additional Gmail settings
        $mail->SMTPOptions = array(
            'ssl' => array(
                'verify_peer' => false,
                'verify_peer_name' => false,
                'allow_self_signed' => true
            )
        );
        
        //Recipients
        $mail->setFrom('minhtiendh2018@gmail.com', 'TheCoffeeHouse221');
        $mail->addAddress($receiver['email'], $receiver['name']);     
        $mail->addReplyTo('minhtiendh2018@gmail.com', 'TheCoffeeHouse221');

        //Content
        $mail->isHTML(true);                                  
        $mail->Subject = 'TheCoffeeHouse221 xác thực tải khoản';
        $mail->Body    = ' <html>
                                <body>
                                    <p>Thông tin tài khoản</p>
                                    <p>Tên đăng nhập: <b style="color:blue">'.$receiver['email'].'</b></p>
                                    <p>Mật khẩu: <b style="color:blue">'.$receiver['password'].'</b></p>
                                    <p>Quý khách vui lòng điền mã xác thực để kích hoạt dịch vụ</p>
                                    <p>Mã xác thực kích hoạt tài khoản</p>
                                    <div><b>'.$verifyCode.'</b></div>
                                    <p>Nếu quý khách không thực hiên được, liên hệ: 0909 1900 99</p>
                                    <p><b style="color: blue">TheCoffeeHouse221</b></p>
                                </body>
                            </html>';

        $result = $mail->send();
        
        return $result;
        
    } catch (Exception $e) {
        error_log("PHPMailer Exception in verifyEmail: " . $e->getMessage());
        if (isset($mail)) {
            error_log("PHPMailer ErrorInfo: " . $mail->ErrorInfo);
        }
        return false;
    }
}

function resetPassword($receiver) {
    try {
        $mail = new PHPMailer(true);
        
        //Server settings for Gmail
        $mail->isSMTP();     
        $mail->CharSet  = "utf-8";                                     
        $mail->SMTPAuth   = true;                                  
        $mail->SMTPSecure = "tls";          
        $mail->Host       = 'smtp.gmail.com';                     
        $mail->Port       = 587; // Correct port for Gmail TLS                                    
        $mail->Username   = 'minhtiendh2018@gmail.com';                     
        $mail->Password   = 'yokk pmbn cltp hfpn';                              
        
        // Additional Gmail settings
        $mail->SMTPOptions = array(
            'ssl' => array(
                'verify_peer' => false,
                'verify_peer_name' => false,
                'allow_self_signed' => true
            )
        );
        
        //Recipients
        $mail->setFrom('minhtiendh2018@gmail.com', 'TheCoffeeHouse221');
        $mail->addAddress($receiver['email'], $receiver['name']);     
        $mail->addReplyTo('minhtiendh2018@gmail.com', 'TheCoffeeHouse221');

        //Content
        $mail->isHTML(true);                                  
        $mail->Subject = 'TheCoffeeHouse221 cập nhật thông tin tài khoản';
        $mail->Body    = ' <html>
                                <body>
                                    <p>Thông tin tài khoản</p>
                                    <p>Tên đăng nhập: <b style="color:blue">'.$receiver['email'].'</b></p>
                                    <p>Mật khẩu: <b style="color:blue">'.$receiver['password'].'</b></p>
                                    <p>Quý khách vui lòng đăng nhập lại</p>
                                    <p>Nếu quý khách không thực hiên được, liên hệ: 0909 1900 99</p>
                                    <p><b style="color: blue">TheCoffeeHouse221</b></p>
                                </body>
                            </html>';

        $result = $mail->send();
        
        return $result;
        
    } catch (Exception $e) {
        error_log("PHPMailer Exception in resetPassword: " . $e->getMessage());
        if (isset($mail)) {
            error_log("PHPMailer ErrorInfo: " . $mail->ErrorInfo);
        }
        return false;
    }
}

?>
-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `assignmentweb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `role` int(11) NOT NULL DEFAULT 0,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `email`, `password`, `name`, `role`, `updated_at`) VALUES
(1, 'admin@gmail.com', '21232f297a57a5a743894a0e4a801fc3', 'Admin', 0, '2025-08-08 18:34:23'); 
-- login: admin@gmail.com - admin

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(1, 'Cà phê'),
(2, 'Trà'),
(3, 'Bánh & Snack'),
(4, 'CloudFee'),
(5, 'Hi-Tea Healthy'),
(6, 'CloudTea');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `message` varchar(2000) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `username`, `email`, `message`, `status`, `created_at`) VALUES
(1, 'Tien', 'blaugrana3ds@gmail.com', 'Hi, thank you for your recent inquiry. Let us know how we did by completing this short survey. It takes less than a minute to complete.', 0, '2025-08-12 14:21:58'),

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `payment_method` varchar(50) NOT NULL DEFAULT 'Tiền mặt khi nhận hàng',
  `payment` bigint(20) NOT NULL,
  `address_receiver` varchar(50) NOT NULL,
  `phone_receiver` varchar(50) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` enum('Đang xử lý','Đang giao','Đã giao') NOT NULL DEFAULT 'Đang xử lý',
  `name_receiver` varchar(50) NOT NULL DEFAULT 'Đang xử lý'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity_item` bigint(20) NOT NULL DEFAULT 1,
  `price` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `post_id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `content` text DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `image` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`post_id`, `title`, `content`, `updated_at`, `image`) VALUES
(1, 'HI-TEA HEALTHY: DA ĐẸP DÁNG XINH - RINH DEAL 0Đ', 'Mùa lễ hội đến gần, cần da đẹp dáng xinh phát mê, thì hổng được bỏ qua Hi-Tea Healthy bạn nha. Nhà còn có deal 0Đ dành tặng bạn nữa nè 💃💃\r\n💃\r\n\r\n\r\n🔸 Nhập mã: HITEADAY\r\n\r\n🔸 Thứ 3 hàng tuần: 13, 20, 27/12\r\n\r\n🔸 Áp dụng ly Hi-Tea thứ 2 giá 0đ, khi mua một ly Hi-Tea bất kỳ cho đơn Giao hàng\r\n\r\n👉 Mãi “biu tì”, chốt ngay Hi-Tea!\r\n\r\n', '2025-08-07 10:51:25', 'https://feed.thecoffeehouse.com//content/images/2022/12/NOTI--22-.jpg'),
(2, 'ĐẠI TIỆC LINH ĐÌNH - RINH DEAL MUA 1 TẶNG 1', 'Black Friday vừa qua, deal Nhà siêu to MUA 1 TẶNG 1 ở lại. Cùng bạn mở tiệc thiệt hoành tráng, mừng ngày “anh lương” ghé thăm 😜.\r\n\r\n\r\n🔸 Nhập mã: DAITIEC\r\n\r\n🔸 Thời gian: 02/12 - 07/12\r\n\r\n🔸 Áp dụng cho Hi-Tea/CloudTea/CloudFee/The Coffee House Sữa Đá cho đơn Giao hàng\r\n\r\n👉 Nhà hùn vốn rồi đó, còn khum mau mau chốt đơn!', '2025-08-07 11:11:19', 'https://feed.thecoffeehouse.com//content/images/2022/12/noti--19-.jpg'),
(3, 'BÁNH NƯỚC ĐỦ ĐẦY - CHỚP NGAY COMBO 3 MÓN CHỈ 99K', 'Cuối tuần rồi, chạy về nhà thôi. Nơi có ba có mẹ và trăm chuyện tỉ tê trên đời 👨‍👩‍👧‍👦\r\n\r\nNhà góp chút “ấm áp” để nhà mình thêm vui bạn nhé!\r\n\r\n\r\n🔸 Nhập mã: FAMILYDAY\r\n\r\n🔸 Thứ 7, CN hàng tuần: 10-11,17-18, 24-25/12\r\n\r\nMón 1: 01 Cà phê VN/CloudFee\r\nMón 2: 01 Hi-Tea/Trà trái cây/Trà sữa/CloudTea\r\nMón 3: 01 Chocolate hoặc bánh Mousse/Chà bông phô mai/Croissant trứng muối\r\n🔸 Áp dụng size M cho đơn Giao hàng\r\n\r\n👉 Chớp deal đi chờ chi!', '2025-08-07 11:13:45', 'https://feed.thecoffeehouse.com//content/images/2022/12/NOTI--16-.jpg'),
(4, 'GHÉ NHÀ MANG ĐI - RƯỚC DEAL MÊ LY', 'Biết bạn dạo này bận lắm, nhưng món nước yêu thích thì hổng thể thiếu 😢\r\n\r\nThương thương! Từ ngày 01/12 - 31/12, Nhà mời ngay 10% cho đơn Mang đi, để bạn không chỉ được thưởng thức món ngon mà còn tiện lợi nữa nè ^^\r\n\r\n\r\n🔸 Nhập mã: GHENHANHE\r\n\r\n🔸 Thời gian: 01/12 - 31/12\r\n\r\n🔸 Áp dụng cho đơn Mang đi từ 2 món bất kỳ\r\n\r\nGhé Nhà Mang đi nào bạn ơi!', '2025-08-07 11:13:50', 'https://feed.thecoffeehouse.com//content/images/2022/12/NOTI--18-.jpg'),
(5, 'NƯỚC NGON TUYỆT VỜI - NHÀ MỜI CHỈ TỪ 19K', 'Cầu được ước thấy! Món ghiền của bạn mỗi ngày, nay Nhà ưu đãi chỉ từ 19K ^^  Từ 01/12 - 31/12, bạn tranh thủ rước deal lia lịa nha: Cà phê 19K/ The Coffee House Sữa Đá 29K/Trà trái cây, CloudFee 39K\r\n\r\n🔸 Nhập mã: TUYETVOI\r\n\r\n🔸 Áp dụng size M khi mua cùng bánh bất kỳ, cho đơn Giao hàng.\r\n\r\n🔸  Không áp dụng cho nước đóng chai Fresh và topping\r\n\r\n🔸 Không áp dụng cho các chương trình khuyến mãi song song\r\n\r\n*Không áp dụng cho Bánh mì que\r\n\r\n👉 Xế Nhà giao ngay, chốt đơn liền tay!', '2025-08-07 11:14:45', 'https://feed.thecoffeehouse.com//content/images/2022/12/NOTI--17-.jpg'),
(6, 'SÁNG NO NÊ, BÁNH MÌ GẬY THIỆT MÊ CHỈ 9K', 'Nhà phát hiện dạo này có người hay bỏ bữa sáng lắm 😭\r\n\r\nNên từ ngày 01/12 - 31/12, Nhà ủ mưu lắp đầy chiếc bụng đói bằng Bánh mì Gậy ngon ngon, nhanh gọn chỉ với 9K thôi nè ^^\r\n\r\n\r\n🔸Nhập mã: ANSANG9K\r\n\r\n🔸Thời gian: 07:00 - 14:00\r\n\r\n🔸Áp dụng khi mua kèm 1 nước (size M, L) bất kỳ cho đơn Giao hàng\r\n\r\n🔸Không áp dụng cho nước đóng chai Fresh và topping\r\n\r\n🔸Không áp dụng cho các chương trình khuyến mãi song song\r\n\r\n👉 Có thực mới vực được deadline, chốt đơn ngay bạn nhé!', '2025-08-07 11:17:39', 'https://feed.thecoffeehouse.com//content/images/2022/12/noti--21-.jpg'),
(7, 'BÊN NHAU NHIỀU - NHÀ CHIỀU DEAL ĐẬM', 'Chỉ cần được bên bạn mỗi ngày, Nhà hổng ngại chiều deal đậm 😘\r\n\r\nTừ ngày 01/12 - 31/12, Nhà giảm lớn đến 70K, thoả thích thưởng thức bánh nước thơm ngon bạn nha ^^\r\n\r\n\r\n🔸 Giảm 35K đơn từ 169K\r\n\r\nNhập mã: BENNHAU35\r\n\r\n🔸 Giảm 70K đơn từ 289K\r\n\r\nNhập mã: BENNHAU70\r\n\r\n🔸 Áp dụng cho bánh, nước cho đơn Giao hàng.\r\n\r\n🔸 Không áp dụng cho nước đóng chai Fresh và topping\r\n\r\n🔸 Không áp dụng cho các chương trình khuyến mãi song song\r\n\r\n👉  Đặt đi, chờ chi!', '2025-08-07 11:18:23', 'https://feed.thecoffeehouse.com//content/images/2022/12/noti--20-.jpg'),
(8, 'MANG ĐI CÙNG NHÀ - GIẢM NGAY 15%', 'Biết bạn dù bận bịu nhưng nước ngon thì không thể thiếu 😜\r\n\r\n\r\nNên từ ngày 01/11 - 30/11, Nhà mời ngay deal 15% nè cho đơn Mang đi nè.\r\n\r\n🔸 Nhập mã: GHENHA\r\n\r\n🔸 Áp dụng đơn hàng từ 2 món\r\n\r\nMở app, mang đi rốp rẻng liền nha!', '2025-08-07 11:19:04', 'https://feed.thecoffeehouse.com//content/images/2022/11/NOTI--6-.jpg'),
(9, 'VITAMIN TỈNH TÁO - NHÀ KHAO DEAL CHỈ TỪ 25K', 'Xử gọn deadline, thứ 2 không còn ngập task. Vì có vitamin tỉnh táo, Nhà mời rồi đây 😍\r\n\r\n\r\nTừ ngày 01/11 - 30/11, bạn nhớ chớp ngay deal The Coffee House Sữa Đá, Coldbrew Phúc Bồn Tử chỉ 25K và Cà phê CloudFee chỉ 35K\r\n\r\n🔸 Nhập mã: CAPHEDAY\r\n\r\n🔸 Thứ 2 hàng tuần từ 07:00 - 13:00\r\n\r\n🔸 Áp dụng size M cho đơn Giao hàng\r\n\r\n👉 Mở app liền tay, chốt đơn lia lịa ngay!', '2025-08-07 11:20:00', 'https://feed.thecoffeehouse.com//content/images/2022/11/NOTI--1-.jpg'),
(10, 'ĐẠI TIỆC TRÀ - 3 LY CHỈ 99K', 'Thứ 6 rồi, mở tiệc linh đình thôi team mình ơi😍\r\n\r\nTừ ngày 01/11 - 30/11, Nhà mời ngay combo 3 ly trà chỉ 99K, để chúng mình thoải mái chill nước ngon đã đời, mà chẳng lo về giá ^^\r\n\r\n\r\n🔸 Nhập mã: PARTEADAY\r\n\r\n🔸 Thời gian: Thứ 6 hàng tuần (từ 01/11 - 30/11)\r\n\r\n🔸 Áp dụng Trà trái cây, Hi-Tea, Trà sữa, CloudTea (size M) cho đơn Giao hàng\r\n\r\nĐặt ngay đi chờ chi!', '2025-08-07 11:21:18', 'https://feed.thecoffeehouse.com//content/images/2022/11/noti--9-.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `category_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `images` varchar(100) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` bigint(20) NOT NULL,
  `price_sale` bigint(20) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `name`, `category_id`, `description`, `images`, `quantity`, `price`, `price_sale`, `timestamp`) VALUES
(1, 'The Coffee House Sữa Đá', 1, 'Thức uống giúp tỉnh táo tức thì để bắt đầu ngày mới thật hứng khởi. Không đắng khét như cà phê truyền thống, The Coffee House Sữa Đá mang hương vị hài hoà đầy lôi cuốn. Là sự đậm đà của 100% cà phê Arabica Cầu Đất rang vừa tới, biến tấu tinh tế với sữa đặc và kem sữa ngọt ngào cực quyến rũ. Càng hấp dẫn hơn với topping thạch 100% cà phê nguyên chất giúp giữ trọn vị ngon đến ngụm cuối cùng.', 'coffeeSuaDa.jpg', 1, 39000, 25000, '2025-08-08 15:29:11'),
(2, 'Cà Phê Sữa Đá', 1, 'Sự độc đáo trong thưởng thức cà phê của người Việt    Cà phê phin kết hợp cùng sữa đặc là một sáng tạo đầy tự hào của người Việt, được xem món uống thương hiệu của Việt Nam.  Khi người Pháp đem văn hóa cà phê vào Việt Nam, người bản xứ thay thế sữa tươi đắt đỏ bằng sữa đặc rẻ tiền hơn để pha cùng cà phê. Tuy nhiên, bằng sự kết hợp hài hòa giữa các thái cực đắng – ngọt, bùi – béo, ly cà phê sữa đá lại sánh đặc và đậm đà hơn, không làm mất đi công dụng của cà phê mà bổ sung thêm năng lượng cho cơ thể từ sữa đã trở thành quen thuộc với nếp sống của người Việt và là một nét sáng tạo riêng, chinh phục được trái tim hàng triệu người yêu cà phê trên thế giới.', 'coffeeSuaTruyenThong.jpg', 25, 29000, NULL, '2025-08-07 16:25:12'),
(3, 'Cà Phê Sữa Nóng', 1, 'Sự độc đáo trong thưởng thức cà phê của người Việt  Cà phê phin kết hợp cùng sữa đặc là một sáng tạo đầy tự hào của người Việt, được xem món uống thương hiệu của Việt Nam.  Khi người Pháp đem văn hóa cà phê vào Việt Nam, người bản xứ thay thế sữa tươi đắt đỏ bằng sữa đặc rẻ tiền hơn để pha cùng cà phê. Tuy nhiên, bằng sự kết hợp hài hòa giữa các thái cực đắng – ngọt, bùi – béo, ly cà phê sữa đá lại sánh đặc và đậm đà hơn, không làm mất đi công dụng của cà phê mà bổ sung thêm năng lượng cho cơ thể từ sữa đã trở thành quen thuộc với nếp sống của người Việt và là một nét sáng tạo riêng, chinh phục được trái tim hàng triệu người yêu cà phê trên thế giới.', 'coffeeSuaNong.jpg', 20, 35000, NULL, '2025-08-07 16:25:18'),
(4, 'Bạc Sỉu', 1, 'Bạc sỉu – Nét văn hóa đầy tự hào của người Sài Gòn  Chính vị ngon của sữa trong 1 ly Bạc sỉu sẽ là thứ chinh phục bạn.  Nguồn gốc  Theo chân những người gốc Hoa đến định cư tại Sài Gòn, Bạc sỉu là cách gọi tắt của \"Bạc tẩy sỉu phé\" trong tiếng Quảng Đông. Bạc là \"trắng\". Tẩy là \"ly\". Sỉu là \"một chút\". Phé là \"cà phê\".  Bạc sỉu chính là \"Ly sữa trắng kèm một chút cà phê\".  Người lao động phổ thông khi xưa dùng sữa đặc pha với nước nóng để thay thế cho sữa tươi đắt đỏ trong thời điểm ấy. Tuy vậy, vị sữa đặc pha khá nồng, nên họ biến tấu chút cà phê vào cho ly sữa thêm thơm và hấp dẫn.  Người Sài Gòn \"chánh hiệu con mèo đen\" dùng Bạc sỉu nóng. Theo thời gian, người ta thêm đá vào ly “sữa cà phê” này để thưởng thức được cả trong những ngày oi bức.', 'coffeeBacSiu.jpg', 20, 29000, NULL, '2025-08-07 16:25:46'),
(5, 'Bánh Mì Gậy Gà Kim Quất', 3, 'Croissant trứng muối thơm lừng, bên ngoài vỏ bánh giòn hấp dẫn bên trong trứng muối vị ngon khó cưỡng.', 'banhKimQuat.jpg', 10, 25000, NULL, '2025-08-09 13:32:18'),
(6, 'Bánh Mì VN Thịt Nguội', 3, 'Gói gọn trong ổ bánh mì Việt Nam là từng lớp chả, từng lớp jambon hòa quyện cùng bơ và pate thơm lừng, thêm dưa rau cho bữa sáng đầy năng lượng. *Phần bánh sẽ ngon và đậm đà nhất khi kèm pate. Để đảm bảo hương vị được trọn vẹn, Nhà mong bạn thông cảm vì không thể thay đổi định lượng pate.', 'banhMiVN.jpg', 1, 35000, NULL, '2025-08-09 13:32:22'),
(7, 'Bánh Mì Que Pate Cay', 3, 'Nguồn gốc thú vị của chiếc bánh mì que  Bánh mì que hay còn có tên gọi khác là bánh mì gậy) là một loại bánh mì Pháp xuất xứ từ nước Pháp (một số nguồn cho rằng loại bánh này có nguồn gốc nguyên thủy là ở vùng Torino của Ý). Có tên gọi như vậy chủ yếu là vì hình dạng thon dài của loại bánh này. Ở Việt Nam, bánh mì que lại nổi tiếng theo vùng, với mỗi vùng lại có hương vị đặc trưng riêng, nổi tiếng nhất là bánh mì que Hải Phòng & Đà Nẵng. Trong khi bánh mì que Hải Phòng thành phần chính là pate thì bánh mì que Đà Nẵng lại có thêm dăm bông, thịt nguội bên cạnh pate.      Hương vị bánh mì que Nhà  Tại The Coffee House, bánh mì là loại bánh mì gần giống hương vị bánh mì que Hải Phòng. Với thành phần chính chủ yếu là pate. Vỏ bánh mì giòn tan, kết hợp với lớp nhân pate béo béo đậm đà sẽ là lựa chọn lý tưởng nhẹ nhàng để lấp đầy chiếc bụng đói.', 'banhMiQueCay.jpg', 1, 15000, NULL, '2025-08-09 13:32:23'),
(8, 'Mochi Kem Phúc Bồn Tử', 3, ' Nguồn gốc Nhật Bản  Theo wikipedia, Mochi là một loại bánh giầy nhân ngọt truyền thống của Nhật Bản. Mochi được làm từ bột gạo nếp. Không chỉ để ăn, Mochi còn được xem như là vật phẩm dâng lên thần linh và có ý nghĩa may mắn. Người Nhật tin rằng khi ăn bánh Mochi nướng tại lễ Dondo-yaki sẽ mang lại sức khỏe cho suốt cả năm. Bánh Mochi cũng có mặt trong lễ dựng nhà mới Choto-shiki của người Nhật.     Bánh Mochi tại the Coffee House  Bao bọc bởi lớp vỏ Mochi dẻo thơm, bên trong là lớp kem lạnh cùng các loại nhân độc đáo, đa dạng như việt quất, dừa dứa, matcha, phúc bồn tử, xoài. Mochi được ra mắt cùng Trà sữa đúng gu. Sự kết hợp này đã nhận được sự ủng hộ yêu thích nhiệt tình ngay từ những ngày đầu ra mắt. Vị mohci thơm ngọt mát lạnh, kết hợp vị trà sữa béo đặc trưng của Nhà có thể khiến bạn yêu ngay từ lần thử đầu .', 'banhMoChiVietQuat.jpg', 1, 19000, NULL, '2025-08-09 13:32:24'),
(9, 'Hi-tea Trà Xoài', 5, 'Vị ngọt thanh, thơm phức từ xoài chín mọng kết hợp cùng vị chua đặc trưng của trà hoa Hibiscus tự nhiên, sẽ khiến bạn khó lòng quên được thức uống “chân ái” mùa hè này. Đặc biệt, topping Aloe Vera tự nhiên không chỉ nhâm nhi vui miệng mà còn giúp bạn “nâng tầm nhan sắc”.', 'hiTeaXoai.jpg', 1, 55000, NULL, '2025-08-09 13:32:24'),
(10, 'Hi-tea Trà Vải', 5, 'Sự kết hợp ăn ý giữa Đào cùng trà hoa Hibiscus, tạo nên tổng thể hài hoà dễ gây “thương nhớ” cho team thích món thanh mát, có vị chua nhẹ.', 'hiTeaVai.jpg', 1, 59000, NULL, '2025-08-09 13:32:26');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `review_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL DEFAULT '',
  `content` text DEFAULT '0',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `avatar` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `verify_code` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `email`, `password`, `name`, `avatar`, `phone`, `address`, `updated_at`, `verify_code`, `active`) VALUES
(31, 'cocomelon293@gmail.com', '53a627fac6f4700e04f4d9508fab393a', 'Nguyễn Minh Tiền', NULL, '0765162701', 'TPHCM, Việt Nam', '2025-08-27 03:01:57', 111127377, 1),

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `FK_order_user` (`user_id`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`order_id`,`product_id`),
  ADD KEY `FK_order_item_product` (`product_id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `FK_product_category` (`category_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `FK__product` (`product_id`),
  ADD KEY `FK__user` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_order_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `FK_order_item_order` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_order_item_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_product_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `FK__product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK__user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

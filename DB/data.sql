USE [PURCHASE_SEWONINTECH]
GO
INSERT [dbo].[department] ([departID], [departName]) VALUES (N'1270a16b-08aa-ee11-a1ca-04d9f5c9d2eb', N'Assy')
INSERT [dbo].[department] ([departID], [departName]) VALUES (N'1370a16b-08aa-ee11-a1ca-04d9f5c9d2eb', N'인사/회계/전산(Per/Acc/IT)')
INSERT [dbo].[department] ([departID], [departName]) VALUES (N'1470a16b-08aa-ee11-a1ca-04d9f5c9d2eb', N'QC')
INSERT [dbo].[department] ([departID], [departName]) VALUES (N'1570a16b-08aa-ee11-a1ca-04d9f5c9d2eb', N'Rubber')
INSERT [dbo].[department] ([departID], [departName]) VALUES (N'1670a16b-08aa-ee11-a1ca-04d9f5c9d2eb', N'Injection')
INSERT [dbo].[department] ([departID], [departName]) VALUES (N'a6e750de-f5b0-ee11-a1ca-04d9f5c9d2eb', N'Mold')
GO
INSERT [dbo].[user] ([userID], [username], [password], [isManager], [created_at], [updated_at], [delete_at], [updated_by], [deleted_by], [isApprover], [email], [departmentID]) VALUES (N'58ac5fb3-08aa-ee11-a1ca-04d9f5c9d2eb', N'admin', N'$2b$10$ZcmO79s.BYP1z7V5NGV9VOknlMh7v2yxMrgeu1Jb.xfirZ/pLk8tq', 1, CAST(N'2024-01-03T14:21:25.090' AS DateTime), CAST(N'2024-01-03T14:21:25.090' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'1370a16b-08aa-ee11-a1ca-04d9f5c9d2eb')
INSERT [dbo].[user] ([userID], [username], [password], [isManager], [created_at], [updated_at], [delete_at], [updated_by], [deleted_by], [isApprover], [email], [departmentID]) VALUES (N'66ee41ac-37b1-ee11-a1ca-04d9f5c9d2eb', N'TuanIT', N'$2b$10$ZcmO79s.BYP1z7V5NGV9VOknlMh7v2yxMrgeu1Jb.xfirZ/pLk8tq', 0, CAST(N'2024-01-12T17:45:17.633' AS DateTime), CAST(N'2024-01-12T17:45:17.633' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'1370a16b-08aa-ee11-a1ca-04d9f5c9d2eb')
INSERT [dbo].[user] ([userID], [username], [password], [isManager], [created_at], [updated_at], [delete_at], [updated_by], [deleted_by], [isApprover], [email], [departmentID]) VALUES (N'aaae7d47-b8b1-ee11-a1ca-04d9f5c9d2eb', N'JUNGASSY', N'$2b$10$ZcmO79s.BYP1z7V5NGV9VOknlMh7v2yxMrgeu1Jb.xfirZ/pLk8tq', 1, CAST(N'2024-01-13T09:05:53.657' AS DateTime), CAST(N'2024-01-13T09:05:53.657' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[status] ([statusID], [statusName], [userID], [level]) VALUES (N'0e112e77-f3b0-ee11-a1ca-04d9f5c9d2eb', N'NEW', NULL, 1)
INSERT [dbo].[status] ([statusID], [statusName], [userID], [level]) VALUES (N'7d39e061-fbb0-ee11-a1ca-04d9f5c9d2eb', N'CANCEL', NULL, 0)
INSERT [dbo].[status] ([statusID], [statusName], [userID], [level]) VALUES (N'29c5bb2c-07b1-ee11-a1ca-04d9f5c9d2eb', N'MANAGER ACCEPTED', NULL, 2)
INSERT [dbo].[status] ([statusID], [statusName], [userID], [level]) VALUES (N'596560c7-bab1-ee11-a1ca-04d9f5c9d2eb', N'ACCEPTOR 1', N'aaae7d47-b8b1-ee11-a1ca-04d9f5c9d2eb', 3)
GO
INSERT [dbo].[order] ([orderID], [reciever], [address], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [userID], [note], [total], [code], [departmentID], [statusID], [cancel_at], [cancel_by]) VALUES (N'12e85a95-4ab0-ee11-a1ca-04d9f5c9d2eb', N'Tuan', N'IT', CAST(N'2024-01-09T13:28:08.487' AS DateTime), N'admin', CAST(N'2024-01-11T13:28:08.487' AS DateTime), NULL, NULL, NULL, N'58AC5FB3-08AA-EE11-A1CA-04D9F5C9D2EB', N'abcxyz', N'12500', N'OD-1704954488308', N'1370a16b-08aa-ee11-a1ca-04d9f5c9d2eb', N'0e112e77-f3b0-ee11-a1ca-04d9f5c9d2eb', NULL, NULL)
INSERT [dbo].[order] ([orderID], [reciever], [address], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [userID], [note], [total], [code], [departmentID], [statusID], [cancel_at], [cancel_by]) VALUES (N'472dc069-4db0-ee11-a1ca-04d9f5c9d2eb', N'linh', N'packing', CAST(N'2024-01-11T13:48:23.817' AS DateTime), N'admin', CAST(N'2024-01-11T13:48:23.817' AS DateTime), NULL, NULL, NULL, N'58AC5FB3-08AA-EE11-A1CA-04D9F5C9D2EB', N'order for packing sw', N'1260000', N'OD-1704955702682', N'1370a16b-08aa-ee11-a1ca-04d9f5c9d2eb', N'0e112e77-f3b0-ee11-a1ca-04d9f5c9d2eb', NULL, NULL)
INSERT [dbo].[order] ([orderID], [reciever], [address], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [userID], [note], [total], [code], [departmentID], [statusID], [cancel_at], [cancel_by]) VALUES (N'bc1db292-f6b0-ee11-a1ca-04d9f5c9d2eb', N'dang', N'mold', CAST(N'2024-01-12T09:59:17.460' AS DateTime), N'admin', CAST(N'2024-01-12T09:59:17.460' AS DateTime), NULL, NULL, NULL, N'58AC5FB3-08AA-EE11-A1CA-04D9F5C9D2EB', N'mua cho khhuoon', N'120000', N'OD-1705028357288', N'1370a16b-08aa-ee11-a1ca-04d9f5c9d2eb', N'0e112e77-f3b0-ee11-a1ca-04d9f5c9d2eb', NULL, NULL)
INSERT [dbo].[order] ([orderID], [reciever], [address], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [userID], [note], [total], [code], [departmentID], [statusID], [cancel_at], [cancel_by]) VALUES (N'ebdebd0c-ffb0-ee11-a1ca-04d9f5c9d2eb', N'yang si won', N'IT', CAST(N'2024-01-12T10:59:58.193' AS DateTime), N'admin', CAST(N'2024-01-12T10:59:58.193' AS DateTime), NULL, NULL, NULL, N'58AC5FB3-08AA-EE11-A1CA-04D9F5C9D2EB', N'test', N'4200000', N'OD-1705031997870', N'1370A16B-08AA-EE11-A1CA-04D9F5C9D2EB', N'0e112e77-f3b0-ee11-a1ca-04d9f5c9d2eb', NULL, NULL)
INSERT [dbo].[order] ([orderID], [reciever], [address], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [userID], [note], [total], [code], [departmentID], [statusID], [cancel_at], [cancel_by]) VALUES (N'4ceb127e-38b1-ee11-a1ca-04d9f5c9d2eb', N'TuanIT', N'IT', CAST(N'2024-01-12T17:51:09.650' AS DateTime), N'TuanIT', CAST(N'2024-01-13T11:19:02.303' AS DateTime), N'admin', NULL, NULL, N'66EE41AC-37B1-EE11-A1CA-04D9F5C9D2EB', N'', N'146000', N'OD-1705056669504', N'1370A16B-08AA-EE11-A1CA-04D9F5C9D2EB', N'7d39e061-fbb0-ee11-a1ca-04d9f5c9d2eb', CAST(N'2024-01-12T17:51:09.6500000' AS DateTime2), N'admin')
INSERT [dbo].[order] ([orderID], [reciever], [address], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [userID], [note], [total], [code], [departmentID], [statusID], [cancel_at], [cancel_by]) VALUES (N'd3a0a2a8-ceb1-ee11-a1ca-04d9f5c9d2eb', N'tuanIT', N'IT', CAST(N'2024-01-13T11:46:05.563' AS DateTime), N'TuanIT', CAST(N'2024-01-13T11:47:12.763' AS DateTime), N'admin', NULL, NULL, N'66EE41AC-37B1-EE11-A1CA-04D9F5C9D2EB', N'', N'308000', N'OD-1705121165117', N'1370A16B-08AA-EE11-A1CA-04D9F5C9D2EB', N'29c5bb2c-07b1-ee11-a1ca-04d9f5c9d2eb', CAST(N'2024-01-13T11:46:05.5633333' AS DateTime2), NULL)
GO
INSERT [dbo].[category] ([categoryID], [categoryName]) VALUES (N'688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'Văn phòng phẩm')
INSERT [dbo].[category] ([categoryID], [categoryName]) VALUES (N'698e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'Hàng quần áo')
INSERT [dbo].[category] ([categoryID], [categoryName]) VALUES (N'6a8e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'Nước uống')
GO
INSERT [dbo].[unit] ([unitID], [unitName]) VALUES (N'59381467-c3ae-ee11-a1ca-04d9f5c9d2eb', N'Bộ')
INSERT [dbo].[unit] ([unitID], [unitName]) VALUES (N'5b381467-c3ae-ee11-a1ca-04d9f5c9d2eb', N'Chai')
INSERT [dbo].[unit] ([unitID], [unitName]) VALUES (N'b4cf7b6e-c3ae-ee11-a1ca-04d9f5c9d2eb', N'Cái')
INSERT [dbo].[unit] ([unitID], [unitName]) VALUES (N'511ffe76-c3ae-ee11-a1ca-04d9f5c9d2eb', N'Bag')
INSERT [dbo].[unit] ([unitID], [unitName]) VALUES (N'521ffe76-c3ae-ee11-a1ca-04d9f5c9d2eb', N'Box')
INSERT [dbo].[unit] ([unitID], [unitName]) VALUES (N'779d298c-c3ae-ee11-a1ca-04d9f5c9d2eb', N'Can')
INSERT [dbo].[unit] ([unitID], [unitName]) VALUES (N'789d298c-c3ae-ee11-a1ca-04d9f5c9d2eb', N'Cây')
INSERT [dbo].[unit] ([unitID], [unitName]) VALUES (N'efd09796-c3ae-ee11-a1ca-04d9f5c9d2eb', N'Chiếc')
INSERT [dbo].[unit] ([unitID], [unitName]) VALUES (N'f0d09796-c3ae-ee11-a1ca-04d9f5c9d2eb', N'Cuộn')
INSERT [dbo].[unit] ([unitID], [unitName]) VALUES (N'e05ee29d-c3ae-ee11-a1ca-04d9f5c9d2eb', N'Đôi')
INSERT [dbo].[unit] ([unitID], [unitName]) VALUES (N'e15ee29d-c3ae-ee11-a1ca-04d9f5c9d2eb', N'EA')
INSERT [dbo].[unit] ([unitID], [unitName]) VALUES (N'e43148a9-c3ae-ee11-a1ca-04d9f5c9d2eb', N'KG')
INSERT [dbo].[unit] ([unitID], [unitName]) VALUES (N'e53148a9-c3ae-ee11-a1ca-04d9f5c9d2eb', N'Lọ')
INSERT [dbo].[unit] ([unitID], [unitName]) VALUES (N'846026b4-c3ae-ee11-a1ca-04d9f5c9d2eb', N'Lon')
INSERT [dbo].[unit] ([unitID], [unitName]) VALUES (N'856026b4-c3ae-ee11-a1ca-04d9f5c9d2eb', N'Mét')
INSERT [dbo].[unit] ([unitID], [unitName]) VALUES (N'866026b4-c3ae-ee11-a1ca-04d9f5c9d2eb', N'Miếng')
INSERT [dbo].[unit] ([unitID], [unitName]) VALUES (N'f26ac6bf-c3ae-ee11-a1ca-04d9f5c9d2eb', N'Pair')
INSERT [dbo].[unit] ([unitID], [unitName]) VALUES (N'0471f6c5-c3ae-ee11-a1ca-04d9f5c9d2eb', N'Quyển')
INSERT [dbo].[unit] ([unitID], [unitName]) VALUES (N'0571f6c5-c3ae-ee11-a1ca-04d9f5c9d2eb', N'Ram')
INSERT [dbo].[unit] ([unitID], [unitName]) VALUES (N'7e4d29e4-c3ae-ee11-a1ca-04d9f5c9d2eb', N'Sợi')
INSERT [dbo].[unit] ([unitID], [unitName]) VALUES (N'a1eefaed-c3ae-ee11-a1ca-04d9f5c9d2eb', N'Tấm')
INSERT [dbo].[unit] ([unitID], [unitName]) VALUES (N'a2eefaed-c3ae-ee11-a1ca-04d9f5c9d2eb', N'Tập')
INSERT [dbo].[unit] ([unitID], [unitName]) VALUES (N'a3eefaed-c3ae-ee11-a1ca-04d9f5c9d2eb', N'Thùng')
INSERT [dbo].[unit] ([unitID], [unitName]) VALUES (N'a4eefaed-c3ae-ee11-a1ca-04d9f5c9d2eb', N'Tếp')
INSERT [dbo].[unit] ([unitID], [unitName]) VALUES (N'a5eefaed-c3ae-ee11-a1ca-04d9f5c9d2eb', N'Tờ')
INSERT [dbo].[unit] ([unitID], [unitName]) VALUES (N'adce5cf4-c3ae-ee11-a1ca-04d9f5c9d2eb', N'Túi')
INSERT [dbo].[unit] ([unitID], [unitName]) VALUES (N'427529fb-c3ae-ee11-a1ca-04d9f5c9d2eb', N'Bì')
INSERT [dbo].[unit] ([unitID], [unitName]) VALUES (N'437529fb-c3ae-ee11-a1ca-04d9f5c9d2eb', N'Vỉ')
INSERT [dbo].[unit] ([unitID], [unitName]) VALUES (N'61baea24-c4ae-ee11-a1ca-04d9f5c9d2eb', N'Hộp')
GO
INSERT [dbo].[product] ([productID], [productName], [inventory], [description], [isShow], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [categoryID], [unitID], [price]) VALUES (N'f64197db-ceae-ee11-a1ca-04d9f5c9d2eb', N'101OMO ng mg chuyên dụng cửa trước 3.6kg/4', 15, N'Sử dụng 1 nắp đầy 65ml cho 1 lần giặt thông thường. Điều chỉnh lượng nước giặt tương ứng với lượng quần áo và vết bẩn. Thoa một lượng nhỏ nước giặt trực tiếp lên vết bẩn. Đổ phần nước giặt còn lại trong nắp vào máy giặt cùng với quần áo', 1, CAST(N'2024-01-09T16:09:57.563' AS DateTime), N'admin', CAST(N'2024-01-10T16:16:58.303' AS DateTime), N'admin', NULL, NULL, N'688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'adce5cf4-c3ae-ee11-a1ca-04d9f5c9d2eb', N'255000')
INSERT [dbo].[product] ([productID], [productName], [inventory], [description], [isShow], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [categoryID], [unitID], [price]) VALUES (N'774dac1d-d1ae-ee11-a1ca-04d9f5c9d2eb', N'OMO Nước giặt CF Tinh dầu thơm cửa trên 3.7kg/4', 15, N'Sản phẩm dùng cho máy giặt cửa trên

1. Đổ nước giặt OMO Matic vào nắp.

Dùng 1 nắp (65ml) cho một lần giặt thông thường. Điều chỉnh lượng nước giặt tương ứng với lượng quần áo và độ bẩn.

2. Xử lý dành cho vết bẩn cứng đầu.

- Chấm một ít nước giặt OMO Matic.

- Thoa nhẹ lên vết bẩn.

3. Đổ phần nước giặt còn lại vào máy giặt.', 1, CAST(N'2024-01-09T16:26:07.410' AS DateTime), N'admin', CAST(N'2024-01-10T16:16:51.443' AS DateTime), N'admin', NULL, NULL, N'688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'5b381467-c3ae-ee11-a1ca-04d9f5c9d2eb', N'255000')
INSERT [dbo].[product] ([productID], [productName], [inventory], [description], [isShow], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [categoryID], [unitID], [price]) VALUES (N'3913f756-d1ae-ee11-a1ca-04d9f5c9d2eb', N'LFB NRT bạc bảo vệ 450g/12', 20, N'Thương hiệu: Lifebuoy (Việt Nam)
Sản xuất tại: Việt Nam
Dạng sản phẩm: Rửa với nước
Công dụng: Công thức Activ+ giúp bảo vệ vượt trội và làm sạch đến 99,9% vi khuẩn gây bệnh và ngăn ngừa vi khuẩn lay lan trên da.', 1, CAST(N'2024-01-09T16:27:43.547' AS DateTime), N'admin', CAST(N'2024-01-10T16:16:34.063' AS DateTime), N'admin', NULL, NULL, N'688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'5b381467-c3ae-ee11-a1ca-04d9f5c9d2eb', N'244000')
INSERT [dbo].[product] ([productID], [productName], [inventory], [description], [isShow], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [categoryID], [unitID], [price]) VALUES (N'e5879ed3-d1ae-ee11-a1ca-04d9f5c9d2eb', N'A20UESM2N (Ổ cắm đôi đa năng)', 35, N'Kích thước: 120mm x 72mm

Chất liệu: nhựa PC chống cháy, chống va đập ', 1, CAST(N'2024-01-09T16:31:12.680' AS DateTime), N'admin', CAST(N'2024-01-10T16:16:10.213' AS DateTime), N'admin', NULL, NULL, N'688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'b4cf7b6e-c3ae-ee11-a1ca-04d9f5c9d2eb', N'47000')
INSERT [dbo].[product] ([productID], [productName], [inventory], [description], [isShow], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [categoryID], [unitID], [price]) VALUES (N'55035a03-d2ae-ee11-a1ca-04d9f5c9d2eb', N'Bàn lau sàn KT: 60cm * 20cm, vải không dệt, có khung', 30, N'Thông tin về sản phẩm:
Xuất xứ: Hàng nhập khẩu

Mã sản phẩm: Kitimop-60

Kích thước, chất liệu:

Phần cán dài 1,35m, chất liệu hợp kim nhôm.

Phần bàn lau: Kích thước (dài x rộng) 60cm x 20cm.

Khung bàn lau bằng kim loại.

Giẻ chất liệu vải sợi Microfiber', 1, CAST(N'2024-01-09T16:32:32.763' AS DateTime), N'admin', CAST(N'2024-01-10T16:16:01.863' AS DateTime), N'admin', NULL, NULL, N'688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'b4cf7b6e-c3ae-ee11-a1ca-04d9f5c9d2eb', N'56000')
INSERT [dbo].[product] ([productID], [productName], [inventory], [description], [isShow], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [categoryID], [unitID], [price]) VALUES (N'1f742632-d2ae-ee11-a1ca-04d9f5c9d2eb', N'Bàn Phím Fuhlen L411', 56, N'L411 được trang bị các phím nhấn khá sắc sảo, tạo cảm giác êm ái và giảm thiểu tiếng động khi đánh văn bản. Ngoài ra, các kí tự trên bàn phím được in to, rõ ràng, màu trắng nổi bật trên nền phím đen, rất dễ nhận biết. được thiết kế thân thiện với người sử dụng, phím bấm có độ nảy, rất nhạy.', 1, CAST(N'2024-01-09T16:33:51.280' AS DateTime), N'admin', CAST(N'2024-01-10T16:15:53.820' AS DateTime), N'admin', NULL, NULL, N'688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'b4cf7b6e-c3ae-ee11-a1ca-04d9f5c9d2eb', N'245000')
INSERT [dbo].[product] ([productID], [productName], [inventory], [description], [isShow], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [categoryID], [unitID], [price]) VALUES (N'7831ee7a-d2ae-ee11-a1ca-04d9f5c9d2eb', N'Băng dính ( Nano20Y)', 35, N'Băng keo điện 18mm x 20Y.
Nhãn hiệu Nano Electrical
Màng băng keo 125micromet.
Đóng gói : 10 cuộn / 1 cây , 50 cây / 1 thùng.
Đơn giá : Khách hàng vui lòng liên hệ để cập nhật giá mới nhất.
 Băng keo điện Nano 20Y :

 Được sản xuất từ màng PVC có lớp keo dính đặc biệt.
 Băng keo điện Nano 20Y có cấu tạo gồm 2 phần : lõi keo bằng giấy và các lớp băng keo Nano được quấn quanh đều, thẳng mép.
 Màu sắc : Đen, đỏ, vàng, trắng sữa, xanh...
 Tác dụng : Cách điện, cách nhiệt, chống cháy trong các công trình điện.', 1, CAST(N'2024-01-09T16:35:53.383' AS DateTime), N'admin', CAST(N'2024-01-10T16:15:40.313' AS DateTime), N'admin', NULL, NULL, N'688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'f0d09796-c3ae-ee11-a1ca-04d9f5c9d2eb', N'5000')
INSERT [dbo].[product] ([productID], [productName], [inventory], [description], [isShow], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [categoryID], [unitID], [price]) VALUES (N'002c94c3-d2ae-ee11-a1ca-04d9f5c9d2eb', N'Băng dính dán nền 48mm*33m, màu xanh lá', 69, N'– Dùng dán nền, phân chia khu vực nhà xưởng hoặc khu vực cần cảnh báo.

– Màu sắc: có nhiều màu sắc lựa chọn ( vàng, vàng sọc đen, đỏ, đỏ sọc trắng….)', 1, CAST(N'2024-01-09T16:37:55.270' AS DateTime), N'admin', CAST(N'2024-01-10T16:15:30.477' AS DateTime), N'admin', NULL, NULL, N'688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'f0d09796-c3ae-ee11-a1ca-04d9f5c9d2eb', N'33000')
INSERT [dbo].[product] ([productID], [productName], [inventory], [description], [isShow], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [categoryID], [unitID], [price]) VALUES (N'f714d3e0-d2ae-ee11-a1ca-04d9f5c9d2eb', N'Băng dính giấy màu đỏ 25mx1.8cm', 120, N'Sản phẩm băng dính giấy đỏ là sản phẩm mới của công ty Hanopro. Sản phẩm được thiết kế và sản xuất dựa trên nguyên liện đặc biệt nên là sản phẩm chất lượng cao của công ty.
Đặc tính:
– Sử dụng keo dính đặc biệt nên bóc không để lại vết keo.
– Chất liệu giấy đặc biệt nên có thể chịu được nhiệt độ đên 90*C
Băng dính giấy đỏ sử dụng được trên nhiều bề mặt, màu sắc đậm nét, khó bị phai màu, dễ dàng sử dụng.
– Sử dụng được ở môi trường ngoài trời
– Dùng để dán che phủ sơn ô tô
– Trong phòng có nhiệt độ cao
Vì chúng tôi là đơn vị trực tiếp sản xuất nên khi khách hàng có nhu cầu về sản phẩm băng dính giấy đỏ có thể liên lạc trực tiếp đặt hàng với số lượng không giới hạn với mọi loại kích thước sản phẩm tùy vào nhu cầu của khách hàng.
Hanopro cũng cam kết cới khách hàng khi đếm đến các sản phẩm băng dính giá rẻ nhất, tốt nhất trên thị trường.', 1, CAST(N'2024-01-09T16:38:44.333' AS DateTime), N'admin', CAST(N'2024-01-10T16:15:20.193' AS DateTime), N'admin', NULL, NULL, N'688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'f0d09796-c3ae-ee11-a1ca-04d9f5c9d2eb', N'10000')
INSERT [dbo].[product] ([productID], [productName], [inventory], [description], [isShow], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [categoryID], [unitID], [price]) VALUES (N'fc607de9-d3ae-ee11-a1ca-04d9f5c9d2eb', N'Băng keo chịu nhiệt teflon 50mm*10m*0.13mm', 150, N'Sản phẩm:Băng keo chịu nhiệt

Kích thước: 0.13mm*50mm*10m

Chất liệu: PTFE, sợi thủy tinh, keo silicone

Chịu được nhiệt độ: 260 độ C

Ngoài ra còn có các khổ chuẩn khác: 13mm, 19mm, 25mm, 30mm, 40mm, 60mm ... 500mm', 1, CAST(N'2024-01-09T16:46:08.367' AS DateTime), N'admin', CAST(N'2024-01-10T16:15:11.710' AS DateTime), N'admin', NULL, NULL, N'688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'f0d09796-c3ae-ee11-a1ca-04d9f5c9d2eb', N'125000')
INSERT [dbo].[product] ([productID], [productName], [inventory], [description], [isShow], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [categoryID], [unitID], [price]) VALUES (N'08acc30f-d4ae-ee11-a1ca-04d9f5c9d2eb', N'Băng keo giấy 50mm*18m', 58, N'[Đặc trưng]

- Màu cơ bản: Trắng ( White), Nâu (Brown), ngoài ra còn có màu vàng (Yellow), trắng (White), xanh da trời (Blue), xanh lá cây (Green), đen  (Black).

[Ứng dụng]

- Để sử dụng đóng gói, niên phong các hộp, thùng carton trong sản xuất công nghiệp

- Dùng để đóng gói, niêm phong các vật phẩm thông thường.

- Sử dụng cho với nhiều mục đích khác nhau trong ngành ô tô, xây dựng, nội thất, gỗ.

[Đóng gói]

- 12, 15, 18, 20, 24, 30, 36, 40, 50mm x 18m; 1000, 800, 700, 600, 500, 400, 300, 300, 200 cuộn/thùng.

Mọi chi tiết liên quan đến sản phẩm và báo giá xin vui lòng liên hệ Công ty TNHH Qualiserv (Việt Nam).

 ', 1, CAST(N'2024-01-09T16:47:12.580' AS DateTime), N'admin', CAST(N'2024-01-10T16:15:02.813' AS DateTime), N'admin', NULL, NULL, N'688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'f0d09796-c3ae-ee11-a1ca-04d9f5c9d2eb', N'11500')
INSERT [dbo].[product] ([productID], [productName], [inventory], [description], [isShow], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [categoryID], [unitID], [price]) VALUES (N'5fea952a-d4ae-ee11-a1ca-04d9f5c9d2eb', N'Băng keo OPP 5cm*80yard', 58, N'Đặc điểm sản phẩm: 

 

 

- Băng keo trong OPP 5F.80yds là sản phẩm băng keo được làm từ chất liệu OPP được sử dụng rộng rãi và thông dụng trên thị trường hiện nay

 

 

- Băng keo OPP được cấu tạo từ lớp màng đàn hồi trong suốt, 1 bề mặt của lớp màng này được tráng lên 1 lớp keo dính giúp bám dính tốt và bền lâu.

 

 

- Loại băng dính này được dùng rất nhiều để đóng gói sản phẩm trong công nghiệp, dùng để dán các thùng hàng hóa trước khi vận chuyển chúng ra khỏi nơi sản xuất.

      

 

Chất lượng:  - Có độ dính cao mới đảm bảo được khả năng chịu lực.

 

 

                       - Đạt được chỉ số độ dính phù hợp, góp phần tạo nên sản phẩm băng keo chất lượng như mong muốn của khách hàng.

 

 

Quy cách: 06 cuộn / 1 cây, rộng 4,8F, 80yards

 

 

Xuất xứ : Việt Nam', 1, CAST(N'2024-01-09T16:47:57.580' AS DateTime), N'admin', CAST(N'2024-01-10T16:14:52.730' AS DateTime), N'admin', NULL, NULL, N'698e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'f0d09796-c3ae-ee11-a1ca-04d9f5c9d2eb', N'8600')
INSERT [dbo].[product] ([productID], [productName], [inventory], [description], [isShow], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [categoryID], [unitID], [price]) VALUES (N'aad58176-d4ae-ee11-a1ca-04d9f5c9d2eb', N'Băng keo PVC 4.8cm * 17m', 15, N'Băng keo PVC 4.8cm * 17m được chế tạo bởi vinyl, cao su, mastic, và cambric varnished, chủ yếu sử dụng cho mục đích cách điện, cách nhiện. Từ khi được Snell, Oace và Eastwold của 3M phát minh vào tháng 01 năm 1946, trải qua hơn 60 năm, băng dính điện ngày nay đã trở thành sản phẩm thiết yếu được ứng dụng rộng rãi trong đời sống và sản xuất.', 1, CAST(N'2024-01-09T16:50:04.957' AS DateTime), N'admin', CAST(N'2024-01-10T16:14:43.080' AS DateTime), N'admin', NULL, NULL, N'688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'f0d09796-c3ae-ee11-a1ca-04d9f5c9d2eb', N'14500')
INSERT [dbo].[product] ([productID], [productName], [inventory], [description], [isShow], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [categoryID], [unitID], [price]) VALUES (N'a8f5bcaa-d4ae-ee11-a1ca-04d9f5c9d2eb', N'Bao ngón chống tĩnh điện', 65, N'Các thông số kỹ thuật bao ngón tay cao su sần màu cam chống tĩnh điện
– Màu sắc: màu cam

– Kích thước: đủ size S, M, L

– Trọng lượng siêu nhẹ chỉ 42g

– Chất liệu: cao su thiên nhiên 100% với độ đàn hồi lên đến 600%

– Điện trở bề mặt: 10^6 đến 10^9 Ohm

– Đạt tiêu chuẩn ISO 9000-14000, thông tư ASTMD 257

– Đóng gói 1440 chiếc/túi, 20 túi/carton', 1, CAST(N'2024-01-09T16:51:32.587' AS DateTime), N'admin', CAST(N'2024-01-10T16:14:36.170' AS DateTime), N'admin', NULL, NULL, N'688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'adce5cf4-c3ae-ee11-a1ca-04d9f5c9d2eb', N'83000')
INSERT [dbo].[product] ([productID], [productName], [inventory], [description], [isShow], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [categoryID], [unitID], [price]) VALUES (N'9c6a35cc-d4ae-ee11-a1ca-04d9f5c9d2eb', N'Bìa A4', 35, N'Giấy bìa A4 Coin 180gsm là loại giấy màu cứng chất lượng cao của Thái Lan được nhiều cơ sở in ấn, cá nhân và doanh nghiệp đánh giá cao. Giấy bìa màu A4 IK Plus có tính ứng dụng cao tạo ra sản phẩm in đẹp, những tác phẩm thủ công đặc sắc… Sản phẩm có bề mặt bóng mịn, an toàn lý tưởng để bạn lựa chọn cho công việc.', 1, CAST(N'2024-01-09T16:52:28.740' AS DateTime), N'admin', CAST(N'2024-01-10T16:14:28.477' AS DateTime), N'admin', NULL, NULL, N'688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'0571f6c5-c3ae-ee11-a1ca-04d9f5c9d2eb', N'69000')
INSERT [dbo].[product] ([productID], [productName], [inventory], [description], [isShow], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [categoryID], [unitID], [price]) VALUES (N'e898712d-d5ae-ee11-a1ca-04d9f5c9d2eb', N'Bình tia 500ml', 150, N'Bình tia hay bình rửa dụng cụ (bình xịt có vòi) là một dạng chai bằng nhựa với nắp vặn, phần nắp có vòi cong ra cho đường nước dạng tia thẳng. Bình tia chứa nước được dùng để rửa dụng cụ, các mảnh thủy tinh và hóa chất còn sót lại sau quá trình thí nghiệm. Ngoài ra bình tia còn dùng để chứa dung dịch và dùng để thao tác trong quá trình thí nghiệm (như chứa cồn, nước cất, Aceton, Ethanol, Methanol, Natri hypochlorite, Isopropanol).', 1, CAST(N'2024-01-09T16:55:11.873' AS DateTime), N'admin', CAST(N'2024-01-10T16:14:21.427' AS DateTime), N'admin', NULL, NULL, N'688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'efd09796-c3ae-ee11-a1ca-04d9f5c9d2eb', N'30000')
INSERT [dbo].[product] ([productID], [productName], [inventory], [description], [isShow], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [categoryID], [unitID], [price]) VALUES (N'6c2ed04a-d5ae-ee11-a1ca-04d9f5c9d2eb', N'Bộ đặt thời gian LE4S', 5, N'Bộ đặt thời gian AUTONICS dòng LE4S:
- Có sẵn chế độ cài đặt từng giá trị và phạm vi thời gian riêng biệt khi chọn chế độ đầu ra Flicker (FK, FK I) hoặc ON-OFF Delay (ON OFF D, ON OFF D I).
- Thêm chế độ Flicker 1 (LE4SA).
- Có thể cài đặt thời gian đầu ra một lần (từ 0.01 đến 99.99 giây) (chế độ hiện có: cố định 0,5 giây).
- Khoảng thời gian cấu hình (thêm 9.999 giây): có thể cài đặt theo đơn vị 0,001 giây.
- Thời gian đầu vào tối thiểu có thể lựa chọn: 1 mili giây hoặc 20 mili giây (LE4S).
- Cài đặt lùi thời gian được cải thiện: 100 mili giây.
- Tính năng ON/OFF (BẬT/MỞ) đèn nền.
- Phạm vi thời gian (từ 0,01 giây đến 9999 giờ).
- Chức năng khóa cài đặt để lưu dữ liệu cài đặt.
- Nút nhấn cài đặt mềm.
- Màn hình với đèn nền có khả năng hiển thị cao.
Ứng dụng: Bộ đặt thời gian AUTONICS dòng LE4S dùng để cài đặt thời gian trong ngành thép, xi măng; công nghiệp gỗ, giấy, nhựa; linh kiện điện tử.', 1, CAST(N'2024-01-09T16:56:01.147' AS DateTime), N'admin', CAST(N'2024-01-10T16:13:50.963' AS DateTime), N'admin', NULL, NULL, N'688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'b4cf7b6e-c3ae-ee11-a1ca-04d9f5c9d2eb', N'985000')
INSERT [dbo].[product] ([productID], [productName], [inventory], [description], [isShow], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [categoryID], [unitID], [price]) VALUES (N'f2fa5a67-d5ae-ee11-a1ca-04d9f5c9d2eb', N'Bộ nối nhanh', 36, N'Thông số kỹ thuật:
-Kểu khớp nối dây
-Chất liệu: thép mạ chrome
-Áp suất làm việc: 15mpa
-Áp suất khí ra: 20mpa
-Nhiệt độ làm việc -20 độ C – +80 độ C
-Suất sứ: Trung Quốc', 1, CAST(N'2024-01-09T16:56:49.033' AS DateTime), N'admin', CAST(N'2024-01-10T16:13:41.770' AS DateTime), N'admin', NULL, NULL, N'688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'59381467-c3ae-ee11-a1ca-04d9f5c9d2eb', N'9500')
INSERT [dbo].[product] ([productID], [productName], [inventory], [description], [isShow], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [categoryID], [unitID], [price]) VALUES (N'71c0a482-d5ae-ee11-a1ca-04d9f5c9d2eb', N'Bọc tóc con sâu', 3500, N'Nón trùm tóc con sâu (hay còn gọi: nón sâu, bao trùm tóc, nón trùm đầu, mũ trùm tóc, mũ trùm đầu, bao trùm đầu, bao trùm tóc..) được sử dụng rộng rãi trong y tế, bệnh viện, chế biến thực phẩm, phòng thí nghiệm, phòng sạch,...', 1, CAST(N'2024-01-09T16:57:34.817' AS DateTime), N'admin', CAST(N'2024-01-10T16:13:31.410' AS DateTime), N'admin', NULL, NULL, N'688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'efd09796-c3ae-ee11-a1ca-04d9f5c9d2eb', N'335')
INSERT [dbo].[product] ([productID], [productName], [inventory], [description], [isShow], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [categoryID], [unitID], [price]) VALUES (N'b49c63ab-d5ae-ee11-a1ca-04d9f5c9d2eb', N'Bóng Led Tube T8 1200/20W', 52, N'Công suất:	20W
Điện áp hoạt động:	(150-250)V/(50-60)Hz
Màu ánh sáng:	6500K/5000K/4000K/3000K
Quang thông:	2300lm
Tuổi thọ:	30.000 giờ
Kích thước(ØxL):	(28x1213)mm
Sử dụng chip LED Hàn Quốc chất lượng cao, tuổi thọ và hiệu suất sáng cao, tiết kiệm điện
Chỉ số hoàn màu cao (CRI=82), cho màu sắc trung thực, không chói, không nhấp nháy
Dải điện áp hoạt động rộng (150–250)V
Kết cấu vững chắc, vỏ nhôm sơn tĩnh điện tản nhiệt tốt, độ bền cao, chịu va đập
Dễ dàng thay thế đèn huỳnh quang, phù hợp với mọi loại máng đèn, chỉ cần tháo bỏ tắc te đối với máng đèn sử dụng ballast sắt từ', 1, CAST(N'2024-01-09T16:58:43.173' AS DateTime), N'admin', CAST(N'2024-01-10T16:13:19.733' AS DateTime), N'admin', NULL, NULL, N'688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'b4cf7b6e-c3ae-ee11-a1ca-04d9f5c9d2eb', N'110000')
INSERT [dbo].[product] ([productID], [productName], [inventory], [description], [isShow], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [categoryID], [unitID], [price]) VALUES (N'6c5652f4-d5ae-ee11-a1ca-04d9f5c9d2eb', N'Bông lọc bụi  KT (2m*20.5m*10mm)', 12, N'Sản phẩm được 2G sản xuất chuyên dùng cho lọc bụi công nghiệp, lọc bụi AHU, lọc bụi sơn, … vật liệu sản xuất là sợi polyetser tổng hợp có độ thoáng khí cao và khả năng bẫy bụi tốt.', 1, CAST(N'2024-01-09T17:00:45.533' AS DateTime), N'admin', CAST(N'2024-01-10T16:13:10.753' AS DateTime), N'admin', NULL, NULL, N'688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'f0d09796-c3ae-ee11-a1ca-04d9f5c9d2eb', N'1500000')
INSERT [dbo].[product] ([productID], [productName], [inventory], [description], [isShow], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [categoryID], [unitID], [price]) VALUES (N'9dd3fb86-d6ae-ee11-a1ca-04d9f5c9d2eb', N'Bút bi FO-03/VN đen', 89, N'- Cán bút trong suốt bằng nhựa PS, cán bút được in PAD và dán tem barcode
- Cấu tạo 3 cạnh dễ cắm , chắc tay
- Nút cò cùng màu mực.
- Ống ruột màu, xoắn trắng.
- Đầu bi 0.5mm, viết trơn êm, màu mực đậm tươi, mực ra đều và liên tục.
- Chiều dai viết được ít nhất 1.000m.', 1, CAST(N'2024-01-09T17:04:51.593' AS DateTime), N'admin', CAST(N'2024-01-10T16:13:02.240' AS DateTime), N'admin', NULL, NULL, N'688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'61baea24-c4ae-ee11-a1ca-04d9f5c9d2eb', N'42000')
INSERT [dbo].[product] ([productID], [productName], [inventory], [description], [isShow], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [categoryID], [unitID], [price]) VALUES (N'5110f9be-d6ae-ee11-a1ca-04d9f5c9d2eb', N'Bút chì khúc PC09', 50, N'Đặc điểm:
- Thân tròn, ruột 11 khúc chì, có nắp đậy,
- Trên nắp có gôm, có thể thay được ruột chì, lon nhựa PVC.
Bảo quản:
- Tránh va đập mạnh làm gãy chì
- Tránh xa nguồn nhiệt.', 1, CAST(N'2024-01-09T17:06:25.527' AS DateTime), N'admin', CAST(N'2024-01-10T16:12:41.043' AS DateTime), N'admin', NULL, NULL, N'688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'b4cf7b6e-c3ae-ee11-a1ca-04d9f5c9d2eb', N'5300')
INSERT [dbo].[product] ([productID], [productName], [inventory], [description], [isShow], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [categoryID], [unitID], [price]) VALUES (N'5419c1f3-d6ae-ee11-a1ca-04d9f5c9d2eb', N'Bút dính bàn đôi xanh', 20, N'Bút cắm bàn đôi Thiên Long PH-02

Kích thước đầu bút: 0.7 mm

Chiều dài viết được: 900-1200 m

Số lượng bút: 2

– Bút chuyên để trên bàn làm việc nơi đông người như bàn tiếp tân, bưu điện, ngân hàng, siêu thị…
– Có băng keo 2 mặt phía dưới đế cắm, giúp giữ sản phẩm không xê dịch khi viết.
– Mực ra đều, bền màu, không lem, sử dụng được trên nhiều loại giấy', 1, CAST(N'2024-01-09T17:07:54.080' AS DateTime), N'admin', CAST(N'2024-01-10T16:12:31.827' AS DateTime), N'admin', NULL, NULL, N'688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'437529fb-c3ae-ee11-a1ca-04d9f5c9d2eb', N'15000')
INSERT [dbo].[product] ([productID], [productName], [inventory], [description], [isShow], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [categoryID], [unitID], [price]) VALUES (N'3d8cb518-d7ae-ee11-a1ca-04d9f5c9d2eb', N'Bút lông dầu PM-04 hộp 10 xanh', 35, N'Những đặc điểm nổi bật:
- Sản phẩm có kiểu dáng hiện đại gồm 2 đầu bút khác nhau: đầu nhỏ và đầu lớn giúp đa dạng nét viết, thuận tiện khi sử dụng.
- Màu mực đậm tươi, mực ra đều và liên tục.
- Độ bám dính của mực tốt trên các vật liệu: Giấy, gỗ, da, nhựa, thủy tinh, kim loại, gốm, sứ, đĩa CD...
- Phù hợp cho: Nhân viên văn phòng, học sinh, sinh viên.
- 2 đầu bút kích thước: 0.4 mm và 1 mm
- Mực không độc hại', 1, CAST(N'2024-01-09T17:08:56.080' AS DateTime), N'admin', CAST(N'2024-01-10T16:12:19.887' AS DateTime), N'admin', NULL, NULL, N'688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'789d298c-c3ae-ee11-a1ca-04d9f5c9d2eb', N'6500')
INSERT [dbo].[product] ([productID], [productName], [inventory], [description], [isShow], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [categoryID], [unitID], [price]) VALUES (N'0f19a148-d7ae-ee11-a1ca-04d9f5c9d2eb', N'Bút UV', 65, N'Bút phát sáng UV Artline EPF-700UV có khả năng phản quang dưới tia sáng UV, đèn cực tím UV, đèn sân khấu và đặc biệt trong các quán bar club là phát sáng rực rỡ.

Bút chống thấm nước và nhanh khô tức thì.

Mã hàng: EPF-700UV
Ngòi bút: 1.0 mm
Hộp có 12 cây
Màu sắc: Glow Yellow, Glow Pink, Glow Orange, Glow Blue, Glow Green
Xuất xứ: Nhật Bản', 1, CAST(N'2024-01-09T17:10:16.477' AS DateTime), N'admin', CAST(N'2024-01-10T16:12:04.287' AS DateTime), N'admin', NULL, NULL, N'688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'b4cf7b6e-c3ae-ee11-a1ca-04d9f5c9d2eb', N'14500')
INSERT [dbo].[product] ([productID], [productName], [inventory], [description], [isShow], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [categoryID], [unitID], [price]) VALUES (N'40bde16b-d7ae-ee11-a1ca-04d9f5c9d2eb', N'Cà phê g7 3 in 1 hộp 18', 36, N'Cafe G7 3in1 hộp 18 gói. Chiết xuất trực tiếp từ những hạt cà phê xanh, sạch, thuần khiết từ vùng đất bazan huyền thoại Buôn Ma Thuột. Kết hợp bí quyết khác biệt của cà phê tươi và công nghệ sản xuất hiện đại nhất Việt Nam. Trung Nguyên đem đến cho bạn sản phẩm cà phê hòa tan G7 thơm ngon và đậm đà.

 

Cà phê hòa tan G7 là sản phẩm cà phê hòa tan duy nhất được chọn phục vụ các nguyên thủ quốc gia tại ASEM5.Thích hợp khi uống đá.

 

Cà phê hòa tan G7 hội tụ những yếu tố đặc biêt nhất thế giới. Nguyên liệu tốt nhất, công nghệ sản xuất hiện đại, bí quyết Phương Đông độc đáo.', 1, CAST(N'2024-01-09T17:11:15.620' AS DateTime), N'admin', CAST(N'2024-01-10T16:11:48.217' AS DateTime), N'admin', NULL, NULL, N'688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'61baea24-c4ae-ee11-a1ca-04d9f5c9d2eb', N'51000')
INSERT [dbo].[product] ([productID], [productName], [inventory], [description], [isShow], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [categoryID], [unitID], [price]) VALUES (N'40bddd89-d7ae-ee11-a1ca-04d9f5c9d2eb', N'Cafe hòa tan ice Maxim 1430g 100 gói/hộp', 39, N'Cà phê Hòa Tan Maxim Hộp 100 Gói 12G có hương vị mocha thơm ngon được làm từ những hạt cafe tinh túy nhất kết hợp với tỉ lệ vàng pha trộn giữa cà phê, sữa không béo, đường và polyphenol, tất cả hòa quyện cùng nhau mang đến người dùng cảm giác tuyệt vời khi thưởng thức.

Cà phê Hòa Tan Maxim giúp bạn không chỉ thưởng thức vị cà phê đặc trưng, giúp tỉnh táo, tập trung hơn khi làm việc mà còn bổ sung thêm năng lượng và dinh dưỡng như một bữa ăn nhẹ trong ngày.

Sản phẩm đóng hộp tiện lợi, có nhiều gói nhỏ bên trong dễ dàng sử dụng và bảo quản. Thích hợp dùng cho gia đình, văn phòng công sở, cơ quan,..', 1, CAST(N'2024-01-09T17:12:05.927' AS DateTime), N'admin', CAST(N'2024-01-10T16:11:38.310' AS DateTime), N'admin', NULL, NULL, N'688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'61baea24-c4ae-ee11-a1ca-04d9f5c9d2eb', N'450000')
INSERT [dbo].[product] ([productID], [productName], [inventory], [description], [isShow], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [categoryID], [unitID], [price]) VALUES (N'286de9b6-d7ae-ee11-a1ca-04d9f5c9d2eb', N'Cán chổi lau sàn', 20, N'Hàng chuyên dụng chất lượng cao, siêu bền sử dụng dài lâu.
Cả khả năng thấm hút nước tốt, làm sạch vết bẩn, nước bẩn siêu nhanh và hiệu quả.
Thiết kế thông minh xoay 360 độ giúp người dùng luồn được nhiều vị trí, làm sạch sàn tốt hơn.
Tháo lắp giẻ ra vệ sinh hay thay thế giẻ mới thật dễ dàng.
Có đầy đủ linh phụ kiện sơ cua thay thế từ nhà sản xuất.
Cam kết hàng uy tín, chất lượng giá bán trực tiếp từ nhà sản xuất.', 1, CAST(N'2024-01-09T17:13:21.500' AS DateTime), N'admin', CAST(N'2024-01-10T16:11:30.517' AS DateTime), N'admin', NULL, NULL, N'688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'b4cf7b6e-c3ae-ee11-a1ca-04d9f5c9d2eb', N'20000')
INSERT [dbo].[product] ([productID], [productName], [inventory], [description], [isShow], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [categoryID], [unitID], [price]) VALUES (N'8b06caf6-d7ae-ee11-a1ca-04d9f5c9d2eb', N'Căn lá thép BLUTEC 0.2*5M', 3, N'sản phẩm thước lá thép 1000mm Bluetec của chúng tôi thì bạn chỉ việc quan tâm đến mình sẽ sử dụng chúng vào mục đích gì còn về an toàn sản phẩm đã có chúng tôi đảm bảo thay cho bạn.', 1, CAST(N'2024-01-09T17:15:08.667' AS DateTime), N'admin', CAST(N'2024-01-10T16:11:21.520' AS DateTime), N'admin', NULL, NULL, N'688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'b4cf7b6e-c3ae-ee11-a1ca-04d9f5c9d2eb', N'400000')
INSERT [dbo].[product] ([productID], [productName], [inventory], [description], [isShow], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [categoryID], [unitID], [price]) VALUES (N'4f856f12-d8ae-ee11-a1ca-04d9f5c9d2eb', N'Card case A4 trung', 35, N'Card Case A4 TL-804 (mỏng)
- Chất liệu nhựa PVC trong suốt
- Độ dày: 25C (0,25mm)
- Dùng để kẹp và treo tài liệu bằng Vòng Inox Card ring rất tiện lợi
- Có thể bấm lỗ tròn bằng Kìm bấm 1 lỗ tròn KW-TriO 9717 hoặc lỗ hình Oval bằng Kìm bấm 1 lỗ hình Oval KW-TriO 9772
- Kích thước: khổ A4 (297 x 210 mm)
- Quy cách: Tập 20c
- Trọng lượng: 1kg/tập
', 1, CAST(N'2024-01-09T17:15:55.053' AS DateTime), N'admin', CAST(N'2024-01-10T16:11:13.710' AS DateTime), N'admin', NULL, NULL, N'688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'b4cf7b6e-c3ae-ee11-a1ca-04d9f5c9d2eb', N'6200')
INSERT [dbo].[product] ([productID], [productName], [inventory], [description], [isShow], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [categoryID], [unitID], [price]) VALUES (N'32050c2b-d8ae-ee11-a1ca-04d9f5c9d2eb', N'Chổi nhựa', 5, N'Chổi quét nhà – Chổi cước vệ sinh -Chổi cước là dụng cụ vệ sinh không thể thiếu trong mỗi gia đình, cơ quan làm việc, quán ăn, nhà hàng,
Đầu chổi là các lông sợi nhỏ li ti giúp loại bỏ vết bẩn, rác, hạt cát một cách dễ dàng
Với chất liệu bền, thiết kế đẹp, cán chổi có độ dài phù hợp,
Sản xuất 100% nhựa PP nguyên chất,
Với độ dày và thiết kế đặc biệt giúp cho sản phẩm có độ bền lâu khi sử dụng Cán tuýp: 105 cm, chiều dài cả chổi 127 cm, Chiều rộng chổi cước 36cm
So với chổi quét nhà thông thường, chổi cước có đầu chổi làn bằng những sợi cước mềm mại nhưng cứng cáp, chúng không thấm nước nên loại bỏ chất bẩn ướt trên sàn nhà dễ dàng.
Ngoài ra đối với các vết bẩn ướt, thức ăn, nước uống, chuổi cước còn có công năng như một bàn chải để làm sạch vết bẩn dễ dàng.', 1, CAST(N'2024-01-09T17:16:36.340' AS DateTime), N'admin', CAST(N'2024-01-10T16:11:00.677' AS DateTime), N'admin', NULL, NULL, N'688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'efd09796-c3ae-ee11-a1ca-04d9f5c9d2eb', N'21000')
INSERT [dbo].[product] ([productID], [productName], [inventory], [description], [isShow], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [categoryID], [unitID], [price]) VALUES (N'cfb70247-d8ae-ee11-a1ca-04d9f5c9d2eb', N'Chổi Sơn', 10, N'Cọ quét sơn 10cm là một loại dụng cụ xây dựng cầm tay tiện lợi, không thể thiếu trong túi đồ nghề của dân xây dựng.

Kích thước: 10cm', 1, CAST(N'2024-01-09T17:17:23.257' AS DateTime), N'admin', CAST(N'2024-01-10T16:10:52.210' AS DateTime), N'admin', NULL, NULL, N'688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'b4cf7b6e-c3ae-ee11-a1ca-04d9f5c9d2eb', N'25000')
INSERT [dbo].[product] ([productID], [productName], [inventory], [description], [isShow], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [categoryID], [unitID], [price]) VALUES (N'd560cd84-d8ae-ee11-a1ca-04d9f5c9d2eb', N'Chuột Fuhlen A09', 56, N'Với cảm biến quang học 1000 DPI, Chuột Fuhlen A09B dễ dàng đáp ứng được các thao tác công việc cần tốc độ nhanh, đồng thời có thể sử dụng trên nhiều loại bề mặt khác nhau, rất thích hợp cho công việc văn phòng
', 1, CAST(N'2024-01-09T17:19:06.927' AS DateTime), N'admin', CAST(N'2024-01-10T16:10:39.267' AS DateTime), N'admin', NULL, NULL, N'688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'efd09796-c3ae-ee11-a1ca-04d9f5c9d2eb', N'145000')
INSERT [dbo].[product] ([productID], [productName], [inventory], [description], [isShow], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [categoryID], [unitID], [price]) VALUES (N'31d2bfa9-d8ae-ee11-a1ca-04d9f5c9d2eb', N'Cốc giấy 7 OZ', 156, N'– Tên sản phẩm: cốc giấy 7oz.

– Dung tích: 210ml

– Chất liệu:

Giấy PO tinh khiết 230gsm
PE: 1 lớp 18gsm
– Kích thước:

Đường kính miệng: 75mm
Đường kính đáy: 53mm
Chiều cao: 84mm
– Mực in: mực đậu nành thân thiện với môi trường

– Bao bì: đóng túi PE, thùng carton 5 lớp Minh Đức

– Quy cách đóng gói: 50 chiếc/túi. 1000 chiếc/thùng

– Hạn sử dụng: 48 tháng kể từ ngày sản xuất

– Tiêu chuẩn ATVSTP bộ y tế số: 10/KL/2018', 1, CAST(N'2024-01-09T17:20:08.913' AS DateTime), N'admin', CAST(N'2024-01-10T16:10:21.193' AS DateTime), N'admin', NULL, NULL, N'688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'efd09796-c3ae-ee11-a1ca-04d9f5c9d2eb', N'500')
INSERT [dbo].[product] ([productID], [productName], [inventory], [description], [isShow], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [categoryID], [unitID], [price]) VALUES (N'71bd91d9-d8ae-ee11-a1ca-04d9f5c9d2eb', N'Con lăn dính bụi 4 inch', 22, N'Chất liệu: Polyethylene & Acrylic
Màu: Trắng
Tính năng: Dính bụi phòng sạch
Kích thước: 4 inch, 6 inch, 8 inch, 12 inch
Đóng gói: 100 cuộn / 1 Thùng
Thời gian: Tùy theo đơn đặt hàng', 1, CAST(N'2024-01-09T17:21:29.143' AS DateTime), N'admin', CAST(N'2024-01-10T16:08:30.967' AS DateTime), N'admin', NULL, NULL, N'688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'f0d09796-c3ae-ee11-a1ca-04d9f5c9d2eb', N'35000')
INSERT [dbo].[product] ([productID], [productName], [inventory], [description], [isShow], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [categoryID], [unitID], [price]) VALUES (N'e4727927-d9ae-ee11-a1ca-04d9f5c9d2eb', N'Cồn 90 độ ( chai 500ml)', 30, N'Công dụng của Cồn Ngân Hà 90 độ
Cồn Ngân Hà 90 độ dùng để sát khuẩn dụng cụ y tế, tẩy rửa, chất đốt.
Cách dùng Cồn Ngân Hà 90 độ
Dùng gạc, bông thấm cồn rồi xoa lên bề mặt dụng cụ cần tiệt trùng.
Tác dụng phụ
Chưa có thông báo về tác dụng phụ của sản phẩm.', 1, CAST(N'2024-01-09T17:23:39.843' AS DateTime), N'admin', CAST(N'2024-01-10T16:04:54.560' AS DateTime), N'admin', NULL, NULL, N'688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'5b381467-c3ae-ee11-a1ca-04d9f5c9d2eb', N'20000')
INSERT [dbo].[product] ([productID], [productName], [inventory], [description], [isShow], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [categoryID], [unitID], [price]) VALUES (N'396c3f5d-d9ae-ee11-a1ca-04d9f5c9d2eb', N'Công tắc 1 chiều S18CCS/S', 33, N'Công tắc ổ cắm SINO phím lớn
Hạt công tắc 1 chiều size S dùng cho hệ S18CC, S98CC, S18CCS
Màu trắng tinh tế, sang trọng.
Dòng công tắc ổ cắm phím lớn.
Dùng cho mặt chữ nhật', 1, CAST(N'2024-01-09T17:25:10.060' AS DateTime), N'admin', CAST(N'2024-01-10T16:04:39.570' AS DateTime), N'admin', NULL, NULL, N'688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'b4cf7b6e-c3ae-ee11-a1ca-04d9f5c9d2eb', N'45000')
INSERT [dbo].[product] ([productID], [productName], [inventory], [description], [isShow], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [categoryID], [unitID], [price]) VALUES (N'6243859e-d9ae-ee11-a1ca-04d9f5c9d2eb', N'Công tắc 2 chiều S18CCM/S', 13, N'Công tắc ổ cắm SINO phím lớn
Hạt công tắc có đèn báo, 2 chiều size S dùng cho hệ S18CC, S98CC, S18CCS
Màu trắng tinh tế, sang trọng.
Dòng công tắc ổ cắm phím lớn.
Dùng cho mặt chữ nhật', 1, CAST(N'2024-01-09T17:26:59.573' AS DateTime), N'admin', CAST(N'2024-01-10T16:03:06.530' AS DateTime), N'admin', NULL, NULL, N'688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'b4cf7b6e-c3ae-ee11-a1ca-04d9f5c9d2eb', N' 45000')
INSERT [dbo].[product] ([productID], [productName], [inventory], [description], [isShow], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [categoryID], [unitID], [price]) VALUES (N'72a72bc1-d9ae-ee11-a1ca-04d9f5c9d2eb', N'Công tắc D có đèn báo - WEV5033-7SW', 3, N'1. Công tắc 2 tiếp điểm Panasonic WEV5033-7SW với thiết kế đơn giản và hiện đại cùng mới màu sắc tinh tế và mang tính thẩm mỹ cao giúp cho khách hàng có được sự lựa chọn.

2. Cùng với đó là cơ chế hoạt động của sản phẩm cũng không quá khó khăn khi lắp đặt. Chỉ với dung cụ tua vis thì bất kì ai cũng có thể lắp đặt được ngay và tiết kiệm được chi phí rất cao.

3. Công tắc Panasonic WEV5033-7SW là một sản phẩm có tuổi thọ rất cao, cùng với việc bảo hành sản phẩm của công ty khi sản phẩm gặp vấn đề hư hỏng và đổi mới sản phẩm nếu lỗi của sản phẩm là do của nhà sản xuất hay do vận chuyển hàng của nhà sản xuất.

4. Công tắc 2 tiếp điểm Panasonic WEV5033-7SW được hoạt động theo mức điện áp là 250VAC và cường độ dòng điện là 20A.

5. Nhờ vào mức điện áp được cấu tạo ở sản phẩm đã giúp cho hệ thống dòng điện luôn được ổn định hơn và đảm bảo được an toàn, không xảy ra các lỗi thường gặp.', 1, CAST(N'2024-01-09T17:27:57.703' AS DateTime), N'admin', CAST(N'2024-01-12T10:29:21.430' AS DateTime), N'admin', NULL, NULL, N'688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'b4cf7b6e-c3ae-ee11-a1ca-04d9f5c9d2eb', N' 78000')
INSERT [dbo].[product] ([productID], [productName], [inventory], [description], [isShow], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [categoryID], [unitID], [price]) VALUES (N'528143e6-d9ae-ee11-a1ca-04d9f5c9d2eb', N'Cuộn xốp hơi khổ 1.2 dài 100m nặng 6.5kg', 39, N'Cuộn xốp nổ 1.2m x 100m với khổ rộng 1m2 dài 100m là loại kích thước phù hợp với nhiều loại hàng hóa, sản phẩm khác nhau. Với khổ rộng 1m2, người sử dụng có thể sẽ tiết kiệm được chi phí đóng gói hơn nhưng tốn diện tích lưu trữ, cuộn xốp hơi 1.2m cũng khá cồng kềnh, nếu sử dụng xe gắn máy để vận chuyển cũng tương đối khó khăn.', 1, CAST(N'2024-01-09T17:28:59.937' AS DateTime), N'admin', CAST(N'2024-01-10T16:01:40.883' AS DateTime), N'admin', NULL, NULL, N'688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'f0d09796-c3ae-ee11-a1ca-04d9f5c9d2eb', N' 620000 ')
INSERT [dbo].[product] ([productID], [productName], [inventory], [description], [isShow], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [categoryID], [unitID], [price]) VALUES (N'63acc10c-daae-ee11-a1ca-04d9f5c9d2eb', N'Đạn ghim 23/13', 36, N'– Kim bấm KW-Trio 23/13 ( 100 tờ ) được làm từ nguyên liệu thép cao cấp bóng sáng, độ cứng cao, ngăn ngừa gỉ sét hiệu quả, không làm ảnh hưởng đến giấy tờ, văn bản.

– Kim bấm chắc, không gãy kim hay làm bung, rách giấy

– Thanh ghim dài chứa nhiều ghim thuận lợi cho quá trình dập liên tục.

– Đạn ghim KW-trio 23/13 (100 tờ) bấm tối đa 1 lúc được 100 tờ, tạo thuận lợi cho quá trình bấm liên tục, bấm 1 lúc được nhiều giấy mà vẫn giữ được giấy chặt, chắc chắn

– Độ dày: 13mm

– Số lượng trang giấy: tối đa 100 tờ giấy định lượng 70

– Hãng sản xuất: KW-TRIO', 1, CAST(N'2024-01-09T17:30:04.517' AS DateTime), N'admin', CAST(N'2024-01-10T16:01:25.827' AS DateTime), N'admin', NULL, NULL, N'688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'61baea24-c4ae-ee11-a1ca-04d9f5c9d2eb', N' 20000 ')
INSERT [dbo].[product] ([productID], [productName], [inventory], [description], [isShow], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [categoryID], [unitID], [price]) VALUES (N'c5cb5877-daae-ee11-a1ca-04d9f5c9d2eb', N'Đạn ghim số 10 plus', 35, N'Dao rọc giấy Deli 2034 với Lưỡi dao 30 độ giúp tăng độ sắc bén, chính xác và dễ dàng gọt, cắt

Kích thước dao: 168×51×9mm

Kích thước lưỡi dao: 0.4×9×70mm

', 1, CAST(N'2024-01-09T17:33:03.347' AS DateTime), N'admin', CAST(N'2024-01-10T16:01:14.920' AS DateTime), N'admin', NULL, NULL, N'688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'efd09796-c3ae-ee11-a1ca-04d9f5c9d2eb', N' 3000')
INSERT [dbo].[product] ([productID], [productName], [inventory], [description], [isShow], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [categoryID], [unitID], [price]) VALUES (N'7c0f99a4-daae-ee11-a1ca-04d9f5c9d2eb', N'Dao nhỏ', 25, N'Thiết kế lưỡi dao bản lớn cứng cáp, chắc chắn và sắc bén giúp bạn cắt, rọc giấy thật dễ dàng, tạo hình giấy chuẩn xác hơn.

Tay cầm dao lớn có độ cong hợp lý dễ cầm nắm. Dao có màu nổi bật và trẻ trung cho bạn lựa chọn để phù hợp với không gian bày biện nơi bàn học, làm việc của mình.

Sản phẩm chế tác lưỡi dao từ chất liệu hợp kim thép cao cấp cho độ bền, sắc bén và độ khía sâu hoàn hảo. Chất liệu này cũng giữ cho đường rọc trở nên trơn tru, chính xác hơn. Lưỡi dao', 1, CAST(N'2024-01-09T17:34:19.263' AS DateTime), N'admin', CAST(N'2024-01-10T16:00:52.597' AS DateTime), N'admin', NULL, NULL, N'688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'b4cf7b6e-c3ae-ee11-a1ca-04d9f5c9d2eb', N' 9500 ')
INSERT [dbo].[product] ([productID], [productName], [inventory], [description], [isShow], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [categoryID], [unitID], [price]) VALUES (N'fa57a4cf-daae-ee11-a1ca-04d9f5c9d2eb', N'Dấu 524D', 2, N'Dấu tròn có đường kính Ø 24mm

Khắc dấu tiêu đề công ty, logo...

R524D là dấu có nội dung và ngày tháng năm đi kèm theo

Mặt dấu bằng cao su dẻo polymer sắc nét, rõ ràng, bền

Thẻ mực: R-524-7

Màu sắc mực: xanh dương, đỏ, đen

Dấu thực hiện theo mẫu khách hàng, khách hàng vui lòng liên hệ với chúng tôi để được tư vấn những giải pháp hợp lý, tối ưu, phù hợp với nhu cầu.', 1, CAST(N'2024-01-09T17:35:31.480' AS DateTime), N'admin', CAST(N'2024-01-10T16:00:41.450' AS DateTime), N'admin', NULL, NULL, N'688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'b4cf7b6e-c3ae-ee11-a1ca-04d9f5c9d2eb', N' 425000 ')
INSERT [dbo].[product] ([productID], [productName], [inventory], [description], [isShow], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [categoryID], [unitID], [price]) VALUES (N'e380a35f-56af-ee11-a1ca-04d9f5c9d2eb', N'Đầu nối T2 đầu 8 giữa 10', 25, N'Tên gọi: Đầu nối chữ T- Ren ngoài bên giữa
Các loại ống kết nối: ống PU, PA, PE ( xem các loại ống kết nối tại: https://tdkmart.com/ong-khi-nen )

Nhiệt độ tối đa: 80 độ C

Áp suất tối đa: 13 bar

Vật liệu co nối: Đồng và nhựa chuyên dụng

Tồn kho: hàng thường xuyên có sẵn

Cách lắp đặt Nối chữ T- Ren ngoài bên giữa: đây là loại co chữ T có 2 đầu kết nối nhanh với 2 đầu ống và 1 đầu kết nối ren theo hình chữ T. 

Tham khảo các dạng đầu nối nhan chữ T ren ngoài bên giữa khác tại đường link: https://tdkmart.com/dau-noi-nhanh-khi-nen', 1, CAST(N'2024-01-10T08:20:01.163' AS DateTime), N'admin', CAST(N'2024-01-10T16:00:27.187' AS DateTime), N'admin', NULL, NULL, N'688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'b4cf7b6e-c3ae-ee11-a1ca-04d9f5c9d2eb', N' 25000')
INSERT [dbo].[product] ([productID], [productName], [inventory], [description], [isShow], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [categoryID], [unitID], [price]) VALUES (N'ae529b8d-9daf-ee11-a1ca-04d9f5c9d2eb', N'Dây bọc dẹt 2x1.5', 20, N'kiểu: mềm
- Kích thước: 2x1,5
- Hãng sản xuất: Trần Phú
- Bảo hành: 10 năm
- Phân phối, bán lẻ: Công ty TNHH Đầu Tư Sản Xuất Và Thương Mại Hòa Phát   
 Ngoài sản phẩm dây điện đôi 2x1.5 Trần Phú chính hãng 41 Phương Liệt, Điện Nước Hòa Phát còn phân phối các đồ gia dụng khác như:', 1, CAST(N'2024-01-10T16:49:32.547' AS DateTime), N'admin', CAST(N'2024-01-10T16:49:32.547' AS DateTime), NULL, NULL, NULL, N'688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'856026b4-c3ae-ee11-a1ca-04d9f5c9d2eb', N'12000')
INSERT [dbo].[product] ([productID], [productName], [inventory], [description], [isShow], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [categoryID], [unitID], [price]) VALUES (N'954514df-9daf-ee11-a1ca-04d9f5c9d2eb', N'Dây bọc tròn 1x4', 100, N' Quy cách: Cu/XLPE/PVC
+ Ruột dẫn: Đồng 99,99%.
+ Số lõi: 2,3,4,5
+ Kết cấu: Nhiều sợi bện tròn/Tròn có ép nén cấp 2.
+ Mặt cắt danh định: Từ 0,75 mm2 đến 800 mm2
+ Điện áp danh định: 0,6/1 kV
+ Nhiệt độ làm việc dài hạn cho phép tối đa: 900C
+ Nhiệt độ cực đại cho phép khi ngắn mạch với thời gian không quá 5 giây: 250 oC
+ Dạng mẫu mã: Hình tròn
+ Quy cách đóng gói: Đóng lô hoặc đóng cuộn theo yêu cầu của khách hàng.
Ứng dụng: Cáp điện lực 1 đến 5 lõi , ruột đồng, cách điện XLPE, vỏ bằng nhựa PVC, dùng để truyền tải, phân phối điện trong công nghiệp, tần số 50Hz, lắp đặt cố định
Ghi chú: Ngoài các quy cách nêu trên, CADI-SUN có thể đáp ứng các yêu cầu khác của khách hàng.', 1, CAST(N'2024-01-10T16:51:49.243' AS DateTime), N'admin', CAST(N'2024-01-10T16:51:49.243' AS DateTime), NULL, NULL, NULL, N'688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'856026b4-c3ae-ee11-a1ca-04d9f5c9d2eb', N'11500')
INSERT [dbo].[product] ([productID], [productName], [inventory], [description], [isShow], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [categoryID], [unitID], [price]) VALUES (N'cd28c511-9eaf-ee11-a1ca-04d9f5c9d2eb', N'Dây cấp', 56, N'Thương hiệu : Eurolife - Việt Nam
Chất liệu : Vỏ Inox 304 bện, ruột cao su EDPM
Chiều dài : 50cm hoặc 60cm, 2 đầu ren chờ 21mm.
Dùng cho việc kết nối vòi rửa, máy nước nóng,...
Tích hợp đai vặn thuận tiện, không cần dụng cụ khi lắp đặt.
Bảo hành : 2 năm', 1, CAST(N'2024-01-10T16:53:14.287' AS DateTime), N'admin', CAST(N'2024-01-10T16:53:14.287' AS DateTime), NULL, NULL, NULL, N'688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'b4cf7b6e-c3ae-ee11-a1ca-04d9f5c9d2eb', N'235000')
INSERT [dbo].[product] ([productID], [productName], [inventory], [description], [isShow], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [categoryID], [unitID], [price]) VALUES (N'd292b047-9eaf-ee11-a1ca-04d9f5c9d2eb', N'Dây cu/pvc 1x2,5', 56, N'Ruột dẫn: Đồng ủ mềm trong môi trường khí trơ.
Số lõi: 1 lõi
Kết cấu: 50 sợi có đường kính khoảng 0.24mm bện tròn với nhau
Mặt cắt danh định: 2.5mm2
Điện áp danh định: 450/750V
Dạng mẫu mã: Hình tròn.
Đóng gói: Đóng cuộn.', 1, CAST(N'2024-01-10T16:54:44.750' AS DateTime), N'admin', CAST(N'2024-01-10T16:54:44.750' AS DateTime), NULL, NULL, NULL, N'688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'856026b4-c3ae-ee11-a1ca-04d9f5c9d2eb', N'7800')
INSERT [dbo].[product] ([productID], [productName], [inventory], [description], [isShow], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [categoryID], [unitID], [price]) VALUES (N'8a54cf88-9eaf-ee11-a1ca-04d9f5c9d2eb', N'Dây culoa B73', 45, N'Thương hiệu:
BANDO
Xuất xứ thương hiệu:
Nhật Bản
Sản xuất:
Thái Lan
Bản rộng:
16.7mm
Chu vi:
73 inch
Mã sản phẩm:
B73', 1, CAST(N'2024-01-10T16:56:34.003' AS DateTime), N'admin', CAST(N'2024-01-10T16:56:34.003' AS DateTime), NULL, NULL, NULL, N'688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'7e4d29e4-c3ae-ee11-a1ca-04d9f5c9d2eb', N'73000')
INSERT [dbo].[product] ([productID], [productName], [inventory], [description], [isShow], [created_at], [created_by], [updated_at], [updated_by], [delete_at], [deleted_by], [categoryID], [unitID], [price]) VALUES (N'20eac6cc-9eaf-ee11-a1ca-04d9f5c9d2eb', N'Dây curoa B104', 5, N'Bando đã phát triển trở thành nhà cung cấp băng tải và dây đai truyền lực toàn cầu.
Dựa trên công nghệ xử lý cao su và chất đàn hồi của chúng tôi.', 1, CAST(N'2024-01-10T16:58:28.033' AS DateTime), N'admin', CAST(N'2024-01-10T16:58:28.033' AS DateTime), NULL, NULL, NULL, N'688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb', N'7e4d29e4-c3ae-ee11-a1ca-04d9f5c9d2eb', N'73000')
GO
INSERT [dbo].[order_detail] ([quantity], [price], [unit], [orderDetailID], [orderID], [productID]) VALUES (1, N' 9500 ', N'Cái', N'13e85a95-4ab0-ee11-a1ca-04d9f5c9d2eb', N'12e85a95-4ab0-ee11-a1ca-04d9f5c9d2eb', N'7c0f99a4-daae-ee11-a1ca-04d9f5c9d2eb')
INSERT [dbo].[order_detail] ([quantity], [price], [unit], [orderDetailID], [orderID], [productID]) VALUES (1, N' 3000', N'Chiếc', N'14e85a95-4ab0-ee11-a1ca-04d9f5c9d2eb', N'12e85a95-4ab0-ee11-a1ca-04d9f5c9d2eb', N'c5cb5877-daae-ee11-a1ca-04d9f5c9d2eb')
INSERT [dbo].[order_detail] ([quantity], [price], [unit], [orderDetailID], [orderID], [productID]) VALUES (1, N' 20000 ', N'Hộp', N'482dc069-4db0-ee11-a1ca-04d9f5c9d2eb', N'472dc069-4db0-ee11-a1ca-04d9f5c9d2eb', N'63acc10c-daae-ee11-a1ca-04d9f5c9d2eb')
INSERT [dbo].[order_detail] ([quantity], [price], [unit], [orderDetailID], [orderID], [productID]) VALUES (2, N' 620000 ', N'Cuộn', N'492dc069-4db0-ee11-a1ca-04d9f5c9d2eb', N'472dc069-4db0-ee11-a1ca-04d9f5c9d2eb', N'528143e6-d9ae-ee11-a1ca-04d9f5c9d2eb')
INSERT [dbo].[order_detail] ([quantity], [price], [unit], [orderDetailID], [orderID], [productID]) VALUES (1, N' 75000', N'Cái', N'bd1db292-f6b0-ee11-a1ca-04d9f5c9d2eb', N'bc1db292-f6b0-ee11-a1ca-04d9f5c9d2eb', N'72a72bc1-d9ae-ee11-a1ca-04d9f5c9d2eb')
INSERT [dbo].[order_detail] ([quantity], [price], [unit], [orderDetailID], [orderID], [productID]) VALUES (1, N' 45000', N'Cái', N'be1db292-f6b0-ee11-a1ca-04d9f5c9d2eb', N'bc1db292-f6b0-ee11-a1ca-04d9f5c9d2eb', N'6243859e-d9ae-ee11-a1ca-04d9f5c9d2eb')
INSERT [dbo].[order_detail] ([quantity], [price], [unit], [orderDetailID], [orderID], [productID]) VALUES (200, N'21000', N'Chiếc', N'ecdebd0c-ffb0-ee11-a1ca-04d9f5c9d2eb', N'ebdebd0c-ffb0-ee11-a1ca-04d9f5c9d2eb', N'32050c2b-d8ae-ee11-a1ca-04d9f5c9d2eb')
INSERT [dbo].[order_detail] ([quantity], [price], [unit], [orderDetailID], [orderID], [productID]) VALUES (1, N'73000', N'Sợi', N'4deb127e-38b1-ee11-a1ca-04d9f5c9d2eb', N'4ceb127e-38b1-ee11-a1ca-04d9f5c9d2eb', N'8a54cf88-9eaf-ee11-a1ca-04d9f5c9d2eb')
INSERT [dbo].[order_detail] ([quantity], [price], [unit], [orderDetailID], [orderID], [productID]) VALUES (1, N'73000', N'Sợi', N'4eeb127e-38b1-ee11-a1ca-04d9f5c9d2eb', N'4ceb127e-38b1-ee11-a1ca-04d9f5c9d2eb', N'20eac6cc-9eaf-ee11-a1ca-04d9f5c9d2eb')
INSERT [dbo].[order_detail] ([quantity], [price], [unit], [orderDetailID], [orderID], [productID]) VALUES (1, N'73000', N'Sợi', N'd4a0a2a8-ceb1-ee11-a1ca-04d9f5c9d2eb', N'd3a0a2a8-ceb1-ee11-a1ca-04d9f5c9d2eb', N'20eac6cc-9eaf-ee11-a1ca-04d9f5c9d2eb')
INSERT [dbo].[order_detail] ([quantity], [price], [unit], [orderDetailID], [orderID], [productID]) VALUES (1, N'235000', N'Cái', N'd5a0a2a8-ceb1-ee11-a1ca-04d9f5c9d2eb', N'd3a0a2a8-ceb1-ee11-a1ca-04d9f5c9d2eb', N'cd28c511-9eaf-ee11-a1ca-04d9f5c9d2eb')
GO
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'f74197db-ceae-ee11-a1ca-04d9f5c9d2eb', N'912024-525918222-omo.jpg', N'omo.jpg', N'f64197db-ceae-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'784dac1d-d1ae-ee11-a1ca-04d9f5c9d2eb', N'912024-844200708-omoChai.jpg', N'omoChai.jpg', N'774dac1d-d1ae-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'3a13f756-d1ae-ee11-a1ca-04d9f5c9d2eb', N'912024-79963318-lifeBoy.jpg', N'lifeBoy.jpg', N'3913f756-d1ae-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'e6879ed3-d1ae-ee11-a1ca-04d9f5c9d2eb', N'912024-186367141-o_cam.jpg', N'o_cam.jpg', N'e5879ed3-d1ae-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'56035a03-d2ae-ee11-a1ca-04d9f5c9d2eb', N'912024-701691572-cay-lau-san-kho-60cm.jpg', N'cay-lau-san-kho-60cm.jpg', N'55035a03-d2ae-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'20742632-d2ae-ee11-a1ca-04d9f5c9d2eb', N'912024-664241816-banphim.jpg', N'banphim.jpg', N'1f742632-d2ae-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'7931ee7a-d2ae-ee11-a1ca-04d9f5c9d2eb', N'912024-700823863-bang-keo-dien-nano-20y-den.jpg', N'bang-keo-dien-nano-20y-den.jpg', N'7831ee7a-d2ae-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'012c94c3-d2ae-ee11-a1ca-04d9f5c9d2eb', N'912024-469696090-bang-keo-dan-nen-cac-mau.jpg', N'bang-keo-dan-nen-cac-mau.jpg', N'002c94c3-d2ae-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'f814d3e0-d2ae-ee11-a1ca-04d9f5c9d2eb', N'912024-364552687-Bang-keo-giay-mau-do.jpg', N'Bang-keo-giay-mau-do.jpg', N'f714d3e0-d2ae-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'fd607de9-d3ae-ee11-a1ca-04d9f5c9d2eb', N'912024-424423371-bang-keo-teflon.jpg', N'bang-keo-teflon.jpg', N'fc607de9-d3ae-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'09acc30f-d4ae-ee11-a1ca-04d9f5c9d2eb', N'912024-49247413-bang_keo_giay.jpg', N'bang_keo_giay.jpg', N'08acc30f-d4ae-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'60ea952a-d4ae-ee11-a1ca-04d9f5c9d2eb', N'912024-284948964-bang-keo-trong.jpg', N'bang-keo-trong.jpg', N'5fea952a-d4ae-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'abd58176-d4ae-ee11-a1ca-04d9f5c9d2eb', N'912024-608294353-bang_keo_pvc.jpg', N'bang_keo_pvc.jpg', N'aad58176-d4ae-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'a9f5bcaa-d4ae-ee11-a1ca-04d9f5c9d2eb', N'912024-115153170-bao_ngon_co_vanh__5_(1).jpg', N'bao_ngon_co_vanh__5_(1).jpg', N'a8f5bcaa-d4ae-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'9d6a35cc-d4ae-ee11-a1ca-04d9f5c9d2eb', N'912024-451371903-giay-bia-ik-plus-a.jpg', N'giay-bia-ik-plus-a.jpg', N'9c6a35cc-d4ae-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'e998712d-d5ae-ee11-a1ca-04d9f5c9d2eb', N'912024-798770742-BiÌnh-tia-nhuÌÌ£a.jpg', N'BiÌnh-tia-nhuÌÌ£a.jpg', N'e898712d-d5ae-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'6d2ed04a-d5ae-ee11-a1ca-04d9f5c9d2eb', N'912024-129146769-bo_dat_thoi_gian.jpg', N'bo_dat_thoi_gian.jpg', N'6c2ed04a-d5ae-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'f3fa5a67-d5ae-ee11-a1ca-04d9f5c9d2eb', N'912024-566994010-bo_noi_nhanh.jpg', N'bo_noi_nhanh.jpg', N'f2fa5a67-d5ae-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'72c0a482-d5ae-ee11-a1ca-04d9f5c9d2eb', N'912024-512756610-boc-toc-con-sau.jpg', N'boc-toc-con-sau.jpg', N'71c0a482-d5ae-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'b59c63ab-d5ae-ee11-a1ca-04d9f5c9d2eb', N'912024-742290339-bong_tuyt.jpg', N'bong_tuyt.jpg', N'b49c63ab-d5ae-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'6d5652f4-d5ae-ee11-a1ca-04d9f5c9d2eb', N'912024-489004885-bong_loc_bui.jpeg', N'bong_loc_bui.jpeg', N'6c5652f4-d5ae-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'9ed3fb86-d6ae-ee11-a1ca-04d9f5c9d2eb', N'912024-172465069-but_bi_den.jpg', N'but_bi_den.jpg', N'9dd3fb86-d6ae-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'5210f9be-d6ae-ee11-a1ca-04d9f5c9d2eb', N'912024-918360201-but_chi_c9.jpg', N'but_chi_c9.jpg', N'5110f9be-d6ae-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'5310f9be-d6ae-ee11-a1ca-04d9f5c9d2eb', N'912024-395870523-but_chi_khuc_thien_long_pc09__7__grande.jpg', N'but_chi_khuc_thien_long_pc09__7__grande.jpg', N'5110f9be-d6ae-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'5410f9be-d6ae-ee11-a1ca-04d9f5c9d2eb', N'912024-957290468-but_chi_khuc_thien_long_pc09__10__grande.jpg', N'but_chi_khuc_thien_long_pc09__10__grande.jpg', N'5110f9be-d6ae-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'5519c1f3-d6ae-ee11-a1ca-04d9f5c9d2eb', N'912024-961688447-but_dinh_ban.jpg', N'but_dinh_ban.jpg', N'5419c1f3-d6ae-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'3e8cb518-d7ae-ee11-a1ca-04d9f5c9d2eb', N'912024-60056096-but-long-dau.jpg', N'but-long-dau.jpg', N'3d8cb518-d7ae-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'1019a148-d7ae-ee11-a1ca-04d9f5c9d2eb', N'912024-806028630-But-phat-sang-uv-epf-700uv-glow-pink-min-100x100.jpg', N'But-phat-sang-uv-epf-700uv-glow-pink-min-100x100.jpg', N'0f19a148-d7ae-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'41bde16b-d7ae-ee11-a1ca-04d9f5c9d2eb', N'912024-6404609-cafeG7.jpg', N'cafeG7.jpg', N'40bde16b-d7ae-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'41bddd89-d7ae-ee11-a1ca-04d9f5c9d2eb', N'912024-438451499-cafe-maxim-vang-100goi-1.jpg', N'cafe-maxim-vang-100goi-1.jpg', N'40bddd89-d7ae-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'296de9b6-d7ae-ee11-a1ca-04d9f5c9d2eb', N'912024-254731320-can_choi_lau_nha.jpg', N'can_choi_lau_nha.jpg', N'286de9b6-d7ae-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'8c06caf6-d7ae-ee11-a1ca-04d9f5c9d2eb', N'912024-83333509-Bo-Can-la.jpg', N'Bo-Can-la.jpg', N'8b06caf6-d7ae-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'50856f12-d8ae-ee11-a1ca-04d9f5c9d2eb', N'912024-721722594-card_case_a4.jpg', N'card_case_a4.jpg', N'4f856f12-d8ae-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'33050c2b-d8ae-ee11-a1ca-04d9f5c9d2eb', N'912024-422182292-choi-nhua-quet-nha.jpg', N'choi-nhua-quet-nha.jpg', N'32050c2b-d8ae-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'd0b70247-d8ae-ee11-a1ca-04d9f5c9d2eb', N'912024-125088090-Choi_son.jpg', N'Choi_son.jpg', N'cfb70247-d8ae-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'd660cd84-d8ae-ee11-a1ca-04d9f5c9d2eb', N'912024-960663048-chuot_fulhen.jpg', N'chuot_fulhen.jpg', N'd560cd84-d8ae-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'32d2bfa9-d8ae-ee11-a1ca-04d9f5c9d2eb', N'912024-969588778-coc-giay-7oz-2.jpg', N'coc-giay-7oz-2.jpg', N'31d2bfa9-d8ae-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'72bd91d9-d8ae-ee11-a1ca-04d9f5c9d2eb', N'912024-733597483-con-lan-dinh-bui-phong-sach-pe.jpg', N'con-lan-dinh-bui-phong-sach-pe.jpg', N'71bd91d9-d8ae-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'e5727927-d9ae-ee11-a1ca-04d9f5c9d2eb', N'912024-350519669-con_90_do.png', N'con_90_do.png', N'e4727927-d9ae-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'3a6c3f5d-d9ae-ee11-a1ca-04d9f5c9d2eb', N'912024-802653692-cong_tac_mot_chieu.jpg', N'cong_tac_mot_chieu.jpg', N'396c3f5d-d9ae-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'6343859e-d9ae-ee11-a1ca-04d9f5c9d2eb', N'912024-741589685-cong_tac_2_chieu.jpg', N'cong_tac_2_chieu.jpg', N'6243859e-d9ae-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'73a72bc1-d9ae-ee11-a1ca-04d9f5c9d2eb', N'912024-10566288-cong-tac-2-tiep-diem-panasonic-wev5033-7sw-co-den-bao-wide.jpg', N'cong-tac-2-tiep-diem-panasonic-wev5033-7sw-co-den-bao-wide.jpg', N'72a72bc1-d9ae-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'538143e6-d9ae-ee11-a1ca-04d9f5c9d2eb', N'912024-839128067-cuon-xop-hoi-kho-rong-1m2x100m-2.jpg', N'cuon-xop-hoi-kho-rong-1m2x100m-2.jpg', N'528143e6-d9ae-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'64acc10c-daae-ee11-a1ca-04d9f5c9d2eb', N'912024-934786586-Dan-ghim-23-13-600x800-1.jpg', N'Dan-ghim-23-13-600x800-1.jpg', N'63acc10c-daae-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'c6cb5877-daae-ee11-a1ca-04d9f5c9d2eb', N'912024-194460992-dao.jpg', N'dao.jpg', N'c5cb5877-daae-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'7d0f99a4-daae-ee11-a1ca-04d9f5c9d2eb', N'912024-370903075-image_195509_1_45792.jpg', N'image_195509_1_45792.jpg', N'7c0f99a4-daae-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'e480a35f-56af-ee11-a1ca-04d9f5c9d2eb', N'1012024-250186808-5-e685ba65-39eb-4e60-be4d-4bed0652d5c8.jpg', N'5-e685ba65-39eb-4e60-be4d-4bed0652d5c8.jpg', N'e380a35f-56af-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'6478f692-59af-ee11-a1ca-04d9f5c9d2eb', N'1012024-710940302-unnamed_8.jpg', N'unnamed_8.jpg', N'fa57a4cf-daae-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'af529b8d-9daf-ee11-a1ca-04d9f5c9d2eb', N'1012024-413117566-184_dyini1.5TrnPhchnhhng41PhngLit.jpg', N'184_dyini1.5TrnPhchnhhng41PhngLit.jpg', N'ae529b8d-9daf-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'964514df-9daf-ee11-a1ca-04d9f5c9d2eb', N'1012024-943831099-1422680446cap-dong-boc-XLPE-PVC.png', N'1422680446cap-dong-boc-XLPE-PVC.png', N'954514df-9daf-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'ce28c511-9eaf-ee11-a1ca-04d9f5c9d2eb', N'1012024-917532140-mau-day-cap-inox.jpg', N'mau-day-cap-inox.jpg', N'cd28c511-9eaf-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'd392b047-9eaf-ee11-a1ca-04d9f5c9d2eb', N'1012024-490576077-day-dien-cadisun-cu-pvc-1x2-5mm2.jpg', N'day-dien-cadisun-cu-pvc-1x2-5mm2.jpg', N'd292b047-9eaf-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'8b54cf88-9eaf-ee11-a1ca-04d9f5c9d2eb', N'1012024-301812512-mitsuboshi-day-e1556699558751.jpg', N'mitsuboshi-day-e1556699558751.jpg', N'8a54cf88-9eaf-ee11-a1ca-04d9f5c9d2eb', 1)
INSERT [dbo].[image] ([imageID], [url], [title], [productID], [isShow]) VALUES (N'21eac6cc-9eaf-ee11-a1ca-04d9f5c9d2eb', N'1012024-244787342-Day-Curoa-B104-BANDO.jpg', N'Day-Curoa-B104-BANDO.jpg', N'20eac6cc-9eaf-ee11-a1ca-04d9f5c9d2eb', 1)
GO

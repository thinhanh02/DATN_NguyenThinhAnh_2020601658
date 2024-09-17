﻿using System;
using YoloEcommerce.DTO.Order;
using YoloEcommerce.Entities;
using YoloEcommerce.Interface.Order;
using System.Linq;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
namespace YoloEcommerce.Services.Order
{
    public class OrderServices : IOrderServices
    {
        public readonly MyDbContext _context;
        public OrderServices(MyDbContext context)
        {
            _context = context;
        }
        public string CreateOrder(OrderDTO dto)
        {
            if (dto == null)
            {
                return "Không có đơn hàng";
            }
            else
            {
                var newOrder = new Entities.Order();
                newOrder.Code = dto.Code;
                newOrder.TotalPrice =(int) dto.TotalPrice;
                newOrder.Quantiny = (int)dto.Quantiny;
                newOrder.CustomerName = dto.CustomerName;
                newOrder.CustomerPhone = dto.CustomerPhone;
                newOrder.Address = dto.Address;
                newOrder.CreatedBy = DateTime.Now;
                newOrder.Status = 1;
                newOrder.IdUser =(int) dto.IdUser;
                newOrder.TypePay = (int)dto.TypePay;
                _context.Orders.Add(newOrder);
                _context.SaveChanges();

                if (dto.OrderDetails.Count>0)
                {
                    foreach(var item in dto.OrderDetails)
                    {
                        var newOrderDetail = new Entities.OrderDetail();
                        newOrderDetail.Quantiny =(int) item.Quantiny;
                        newOrderDetail.Price = (int)item.Price;
                        newOrderDetail.TotalPrice = (int)item.TotalPrice;
                        newOrderDetail.IdProduct =(int)item.IdProduct;
                        newOrderDetail.IdOrder = newOrder.Id;
                        newOrderDetail.IdSize =(int) item.IdSize;
                        newOrderDetail.IdColor  = (int)item.IdColor;
                        _context.OrderDetails.Add(newOrderDetail);
                    }
                    _context.SaveChanges();
                }
                return "Thêm thành công đơn hàng mới";
            }
        }
        public List<OrderDTO> GetAllOrder (OrderParamsDTO dto)
            {
            List<OrderDTO> query = null;
            if (dto.status!=null&&dto.status.Count>0)
                {
                     query = (from c in _context.Orders
                                 where dto.status.Contains(c.Status)
                                 select new OrderDTO
                                 {
                                     Id = c.Id,
                                     Code = c.Code,
                                     Address = c.Address,
                                     CustomerName = c.CustomerName,
                                     CustomerPhone = c.CustomerPhone,
                                     TypePay = c.TypePay,
                                     TotalPrice = c.TotalPrice,
                                     Quantiny = c.Quantiny,
                                     CreatedBy = c.CreatedBy,
                                     DeliveryDate = c.DeliveryDate,
                                     Status = c.Status,
                                     IdUser = c.IdUser,
                                     ListProducts = (from d in _context.OrderDetails
                                                     join p in _context.Products on d.IdProduct equals p.Id
                                                     join cl in _context.Colors on d.IdColor equals cl.Id
                                                     join s in _context.Sizes on d.IdSize equals s.Id
                                                     where d.IdOrder == c.Id
                                                     select new ProductViewDTO
                                                     {
                                                         Name = p.Name,
                                                         Price = d.TotalPrice,
                                                         Quantiny = d.Quantiny,
                                                         Color = cl.Name,
                                                         Size = s.Name,
                                                         NamePath = (from i in _context.ProductImages
                                                                     where i.IdProduct == p.Id
                                                                     select "https://localhost:44324/UploadedImages/" + i.Path).ToList()
                                                     }
                                                     ).ToList()

                                 }).ToList();
                }
                else
                {
                     query = (from c in _context.Orders
                                 select new OrderDTO
                                 {
                                     Id = c.Id,
                                     Code = c.Code,
                                     Address = c.Address,
                                     CustomerName = c.CustomerName,
                                     CustomerPhone = c.CustomerPhone,
                                     TypePay = c.TypePay,
                                     TotalPrice = c.TotalPrice,
                                     Quantiny = c.Quantiny,
                                     CreatedBy = c.CreatedBy,
                                     DeliveryDate = c.DeliveryDate,
                                     Status = c.Status,
                                     IdUser = c.IdUser,
                                     ListProducts = (from d in _context.OrderDetails
                                                     join p in _context.Products on d.IdProduct equals p.Id
                                                     join cl in _context.Colors on d.IdColor equals cl.Id
                                                     join s in _context.Sizes on d.IdSize equals s.Id
                                                     where d.IdOrder == c.Id
                                                     select new ProductViewDTO
                                                     {
                                                         Name = p.Name,
                                                         Price = d.TotalPrice,
                                                         Quantiny = d.Quantiny,
                                                         Color = cl.Name,
                                                         NamePath = (from i in _context.ProductImages
                                                                     where i.IdProduct == p.Id
                                                                     select "https://localhost:44324/UploadedImages/" + i.Path).ToList(),
                                                         Size = s.Name
                                                     }
                                                     ).ToList()

                                 }).ToList();
                }
        
                if (dto.idOrder.HasValue)
                {
                    query = query.Where(x => x.Id == dto.idOrder).ToList();
                }
                if (dto.id.HasValue)
                {
                    query = query.Where(x => x.IdUser == dto.id).ToList();
                }
                return query;

            }
        public bool ConfirmOrder(int id)
        {
            var query = _context.Orders.SingleOrDefault(x => x.Id == id);
            if(query == null)
            {
                return false;
            }
            else
            {
                //chuyển sang trạng thái nhận đơn
                query.Status = 2;
                query.DeliveryDate = DateTime.Now;
                _context.SaveChanges();
                return true;
            }
        }
        public bool CancelOrder(int id, string lyDo)
        {
            var query = _context.Orders.SingleOrDefault(x => x.Id == id);
            if (query == null)
            {
                return false;
            }
            else
            {
                //chuyển sang trạng thái nhận đơn
                query.Status = 5;
                query.RejectionReason = lyDo;
                query.DeliveryDate = DateTime.Now;
                _context.SaveChanges();
                return true;
            }
        }
        public bool DeliveredOrder(int id)
        {
            var query = _context.Orders.SingleOrDefault(x => x.Id == id);
            if (query == null)
            {
                return false;
            }
            else
            {
                //chuyển sang trạng thái giao hàng
                query.Status = 3;
                query.DeliveryDate = DateTime.Now;
                _context.SaveChanges();
                return true;
            }
        }
        public bool SuccessOrder(int id)
        {
            var query = _context.Orders.SingleOrDefault(x => x.Id == id);
            if (query == null)
            {
                return false;
            }
            else
            {
                //chuyển sang trạng thái giao hàng thành công
                query.Status = 4;
                query.DeliveryDate = DateTime.Now;
                _context.SaveChanges();
                return true;
            }
        }
        public bool RefundOrder(int id)
        {
            var query = _context.Orders.SingleOrDefault(x => x.Id == id);
            if (query == null)
            {
                return false;
            }
            else
            {
                //chuyển sang trạng thái đơn hàng bị hoàn
                query.Status = 6;
                query.DeliveryDate = DateTime.Now;
                _context.SaveChanges();
                return true;
            }
        }

        public List<OrderDTO> GetOrderById(OrderParamsDTO dto)
        {
            var query = (from c in _context.Orders
                         where dto.status.Contains(c.Status)
                         select new OrderDTO
                         {
                             Id = c.Id,
                             Code = c.Code,
                             Address = c.Address,
                             CustomerName = c.CustomerName,
                             CustomerPhone = c.CustomerPhone,
                             TypePay = c.TypePay,
                             TotalPrice = c.TotalPrice,
                             Quantiny = c.Quantiny,
                             CreatedBy = c.CreatedBy,
                             DeliveryDate = c.DeliveryDate,
                             Status = c.Status,
                             IdUser = c.IdUser,
                             ListProducts = (from d in _context.OrderDetails
                                             join p in _context.Products on d.IdProduct equals p.Id
                                             join cl in _context.Colors on d.IdColor equals cl.Id
                                             join s in _context.Sizes on d.IdSize equals s.Id
                                             where d.IdOrder == c.Id
                                             select new ProductViewDTO
                                             {
                                                 Name = p.Name,
                                                 Price = d.TotalPrice,
                                                 Quantiny = d.Quantiny,
                                                 Color = cl.Name,
                                                 Size = s.Name
                                             }
                                             ).ToList()

                         }).ToList();
            if (dto.id.HasValue)
            {
                query = query.Where(x => x.IdUser == dto.id).ToList();
            }
            return query;

        }
        public List<ThongKeDTO> ThongKeSoLuongDon(string period)
        {
            DateTime startDate;
            DateTime endDate = DateTime.Today;

            switch (period.ToLower())
            {
                case "today":
                    startDate = DateTime.Today;
                    break;
                case "week":
                    // Tìm ngày đầu tuần hiện tại (giả sử tuần bắt đầu vào thứ Hai)
                    int daysToMonday = ((int)DateTime.Today.DayOfWeek - 1 + 7) % 7;
                    DateTime currentWeekStart = DateTime.Today.AddDays(-daysToMonday);
                    startDate = currentWeekStart.AddDays(-7); // Bắt đầu từ thứ Hai tuần trước
                    endDate = currentWeekStart.AddDays(-1);  // Kết thúc vào Chủ nhật tuần trước
                    break;
                case "month":
                    var firstDayOfCurrentMonth = new DateTime(DateTime.Today.Year, DateTime.Today.Month, 1);
                    startDate = firstDayOfCurrentMonth.AddMonths(-1);
                    endDate = firstDayOfCurrentMonth.AddDays(-1);
                    break;
                default:
                    return null;
            }

            // Tạo danh sách tất cả các ngày trong khoảng thời gian yêu cầu
            var allDates = Enumerable.Range(0, (endDate - startDate).Days + 1)
                                     .Select(offset => startDate.AddDays(offset))
                                     .ToList();

            // Truy vấn số lượng đơn hàng theo ngày
            var dailyOrderCounts = _context.Orders
                .Where(o => o.CreatedBy >= startDate && o.CreatedBy <= endDate)
                .GroupBy(o => o.CreatedBy.Date)
                .Select(g => new
                {
                    Date = g.Key,
                    TotalSuccessAmount = g.Where(o => o.Status == 4).Sum(o => o.TotalPrice), // Tổng tiền cho đơn thành công
                    TotalRefundAmount = g.Where(o => o.Status == 6).Sum(o => o.TotalPrice), //Tổng tiền cho đơn hàng bị hoàn
                    TotalWaitAmount = g.Where(o=>o.Status==1||o.Status==2||o.Status==3).Sum(o=>o.TotalPrice)
                })
                .ToList();

            // Hợp nhất kết quả truy vấn với danh sách ngày
            var result = allDates.GroupJoin(
                dailyOrderCounts,
                date => date,
                order => order.Date,
                (date, orders) => new ThongKeDTO
                {
                    Ngay = date.ToString("dd/MM/yyyy"),
                    TongTienThanhCong = orders.Sum(o => o.TotalSuccessAmount),
                    TongTienHoan = orders.Sum(o => o.TotalRefundAmount),
                    TongTienChoThanhToan = orders.Sum(o => o.TotalWaitAmount),
                })
                .ToList();

            return result;
        } 
    }
}

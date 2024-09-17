// src/components/Chart.js
import React, { useState, useEffect } from "react";
import Highcharts from "highcharts";
import HighchartsReact from "highcharts-react-official";
import { Button, Form, Space, Tooltip, Dropdown, Menu } from "antd";
import { ThongKeOrder } from "../../api/api";
const Chart = () => {
  const [recordChange, setRecordChange] = useState(null);
  useEffect(async () => {
    await ThongKeOrder();
  }, []);
  const [day, setDay] = useState([]);
  const [prodiStatic, setProdiStatic] = useState("today");
  const [totalRefunds, setTotalRefunds] = useState(0);
  const [totalSuccess, setTotalSuccess] = useState(0);
  const [totalWait, setTotalWait] = useState(0);
  useEffect(async () => {
    getThongKe(prodiStatic);
  }, []);
  const options = {
    chart: {
      type: "column",
    },
    title: {
      text: "Biểu đồ cột thống kê",
    },
    xAxis: {
      categories: day,
    },
    yAxis: {
      title: {
        text: "Số lượng",
      },
    },
    series: [
      {
        name: "Tổng tiền đã thanh toán",
        data: totalSuccess,
      },
      {
        name: "Tổng tiền bị hoàn",
        data: totalRefunds,
      },
      {
        name: "Tổng tiền chờ thanh toán",
        data: totalWait,
      },
    ],
  };

  const getMenuItems = () => [
    {
      label: "Hôm nay",
      key: "today",
    },
    {
      label: "Tuần trước",
      key: "week",
    },
    {
      label: "Tháng trước",
      key: "month",
    },
  ];
  const getThongKe = async (prodi) => {
    await ThongKeOrder(prodi).then((res) => {
      let setDayNew = [];
      let setRefund = [];
      let setSuccess = [];
      let setWait = [];
      res.map((item) => {
        setDayNew.push(item.ngay);
        setRefund.push(item.tongTienHoan);
        setSuccess.push(item.tongTienThanhCong);
        setWait.push(item.tongTienChoThanhToan);
      });
      setDay(setDayNew);
      setTotalRefunds(setRefund);
      setTotalSuccess(setSuccess);
      setTotalWait(setWait);
      console.log(setDayNew);
    });
  };
  const handleSelect = (status) => {
    switch (status) {
      case 2:
        return "Hôm nay";
      case 3:
        return "Tuần trước";
      case 4:
        return "Tháng trước";
      default:
        return "Không xác định";
    }
  };
  const handleMenuClick = async (e) => {
    console.log(e.key);
    getThongKe(e.key);
    // const updatedOrders = orders.map((order) =>
    //   order.id === recordChange.id
    //     ? { ...order, status: parseInt(e.key) }
    //     : order
    // );
    // setOrders(updatedOrders);
    // console.log(e);
    // if (e.key === "3") {
    //   await DeliveredOrder(recordChange.id);
    //   getOrderProcess();
    // }
    // if (e.key === "4") {
    //   await SuccessdOrder(recordChange.id);
    //   getOrderProcess();
    // }
    // if (e.key === "5") {
    //   await RefundOrder(recordChange.id);
    //   getOrderProcess();
    // }
  };
  const handleMenuClickButton = () => {};
  const getMenuProps = () => ({
    items: getMenuItems(),
    onClick: handleMenuClick,
  });
  return (
    <div>
      <Dropdown menu={getMenuProps()}>
        <Button>
          <Space>{handleSelect(2)}</Space>
        </Button>
      </Dropdown>
      <HighchartsReact highcharts={Highcharts} options={options} />
    </div>
  );
};

export default Chart;

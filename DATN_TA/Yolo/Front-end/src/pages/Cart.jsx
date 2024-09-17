import React, { useState, useEffect } from "react";

import { useSelector } from "react-redux";

import Helmet from "../components/Helmet";
import CartItem from "../components/CartItem";
import numberWithCommas from "../utils/numberWithCommas";

import Button from "../components/Button";
import { Link } from "react-router-dom";
import { getProductBySlug } from "../api/product.js";
import { getProductById } from "../api/api.js";
import { Payment } from "../api/api.js";
import { CreateOrder } from "../api/api.js";
import { useHistory } from "react-router-dom";
import { useDispatch } from "react-redux";
import { removeAllItems } from "../redux/shopping-cart/cartItemSlices.js";
import { Alert, Tabs } from "antd";
import CustomerOrder from "../components/CustomerOrder/AdminOrder.js";

const getProduct = async (id) => {

  const dataGet = { id: id }
  const response = await fetch('https://localhost:44324/api/Product/GetProductById', {
    method: 'POST', // Phương thức POST
    headers: {
      'Content-Type': 'application/json', // Loại dữ liệu gửi lên
    },
    body: JSON.stringify(dataGet) // Chuyển đổi dữ liệu thành chuỗi JSON
  });
  const result = await response.json();
  return result;

}

const compareQuantities = async (data) => {
  let idTrue = []
  let idFalse = []
  await Promise.all(data.map(async (item) => {

    const apiQuantity = await getProduct(item.idProduct).quantiny;
    if (apiQuantity < item.quantity) {
      idFalse.push(item.idProduct);
    } else {
      idTrue.push(item.idProduct);
    }
  }));

  return { idTrue, idFalse }

};

async function updateProductQuantity(productId, quantity) {
  const url = `https://localhost:44324/api/Product/UpdateProductQuantity/${productId}/quantity`;

  try {
    const response = await fetch(url, {
      method: 'PATCH',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(quantity), // Chuyển đổi số lượng thành JSON
    });

    if (!response.ok) {
      throw new Error('Network response was not ok');
    }

    if (response.status === 204) {
      console.log('Product quantity updated successfully');
    } else {
      console.error('Failed to update product quantity');
    }
  } catch (error) {
    console.error('Error:', error);
  }
}



const Cart = () => {


  const [formData, setFormData] = useState({
    fullName: "",
    phoneNumber: "",
    ward: "",
    road: "",
    country: "",
    typePay: "",
    district: "",
  });
  const dispatch = useDispatch();
  const [checkActive, setCheckActive] = useState(false);
  const [checkActiveCOD, setCheckActiveCOD] = useState(false);
  const [messageIsEmpty, setMessageIsEmpty] = useState("");
  const handleChange = (e) => {
    setFormData({ ...formData, [e.target.name]: e.target.value });
  };
  const history = useHistory();
  const cartItems = useSelector((state) => state.cartItems.value);
  console.log('xxxxxxxxxxxxx', cartItems);

  const handleSubmit = (e) => {
    e.preventDefault();
    // Handle form submission logic here
    console.log(formData);
  };
  const handleConfirm = async () => {
    console.log(formData);
    if (formData.fullName === "") {
      setMessageIsEmpty("Vui lòng nhập họ và tên người nhận");
    } else if (formData.phoneNumber === "") {
      setMessageIsEmpty("Vui lòng nhập số điện thoại nhận hàng");
    } else if (formData.road === "") {
      setMessageIsEmpty("Vui lòng nhập thôn/ đường/ phố");
    } else if (formData.ward === "") {
      setMessageIsEmpty("Vui lòng nhập xã/ phường");
    } else if (formData.district === "") {
      setMessageIsEmpty("Vui lòng nhập quận/ huyện");
    } else if (formData.country === "") {
      setMessageIsEmpty("Vui lòng nhập tỉnh/ thành phố");
    } else if (formData.typePay === "") {
      setMessageIsEmpty("Vui lòng chọn phương thức thanh toán");
    } else {
      setMessageIsEmpty("");
    }
    const check = await compareQuantities(cartItems)

    const {idFalse,idTrue} = check
    if(idFalse.length > 0) {
      const matchingObjects = cartItems.filter(obj => idFalse.includes(obj.idProduct));
      matchingObjects.forEach(obj => {
        alert(`Sản phẩm ${obj.name} trong kho không đủ, vui lòng kiểm tra lại!`);
      });
      return;
    }


    const matchingObjectsTrue = cartItems.filter(obj => idTrue.includes(obj.idProduct));
    const updateQuantitiesForTrueProducts = async (data) => {
      await Promise.all(idTrue.map(async (idProduct) => {
        // Lấy thông tin sản phẩm từ API
        const product = await getProduct(idProduct);
        console.log("id updated", product);
        
        // Tìm item tương ứng trong data
        const item = data.find(item => item.idProduct === idProduct);
        const productQuantity = Number(product.quantity);
        const itemQuantity = Number(item.quantity);
        let newQuantity = productQuantity - itemQuantity;
        // Tính quantity mới (quantity ban đầu trừ đi quantity trong data)
        newQuantity = Math.floor(newQuantity);
        console.log("newQuantity: ",newQuantity);
        
        await updateProductQuantity(idProduct, newQuantity);
      }));
    };

    if (messageIsEmpty === "" && formData.typePay === "Vnpay") {
      console.log("okeee");
      const address =
        formData.road +
        ", " +
        formData.ward +
        ", " +
        formData.district +
        ", " +
        formData.country;
      sessionStorage.setItem("totalProduct", totalProducts);
      sessionStorage.setItem("totalPrice", totalPrice);
      sessionStorage.setItem("nameOrder", formData.fullName);
      sessionStorage.setItem("phoneOrder", formData.phoneNumber);
      sessionStorage.setItem("addressOrder", address);
      const data = {
        orderId: Math.floor(Math.random() * (100000 - 1000 + 1)) + 1000,
        fullName: formData.fullName,
        description: "Thanh toán cho đơn hàng",
        amount: totalPrice,
        createDate: new Date(),
      };
      await Payment(data).then((res) => {
        updateQuantitiesForTrueProducts(cartItems);  
        window.location.assign(res);
      });
    }
    if (messageIsEmpty === "" && formData.typePay === "Cod") {
      const address =
        formData.road +
        ", " +
        formData.ward +
        ", " +
        formData.district +
        ", " +
        formData.country;

      const dataProduct = cartItems.map((item) => {
        const totalprice = Number(item.quantity * item.price);
        console.log(totalprice);
        return {
          quantiny: item.quantity,
          price: item.price,
          totalPrice: totalprice,
          idProduct: item.idProduct,
          idColor: item.idColor,
          idSize: item.idSize,
        };
      });
      const data = {
        code: (
          Math.floor(Math.random() * (100000 - 1000 + 1)) + 1000
        ).toString(),
        totalPrice: totalPrice,
        quantiny: totalProducts,
        customerName: formData.fullName,
        customerPhone: formData.phoneNumber,
        address: address,
        createBy: new Date(),
        status: 1,
        idUser: sessionStorage.getItem("id"),
        orderDetails: dataProduct,
        typePay: 2,
      };
      await CreateOrder(data).then((res) => {
        updateQuantitiesForTrueProducts(cartItems);  
        dispatch(removeAllItems());
        history.push("/successcod");
      });
    }
  };

  const [cartProducts, setCartProducts] = useState([]);
  const [username, setUsername] = useState(sessionStorage.getItem("user"));
  const [totalProducts, setTotalProducts] = useState(0);
  console.log("Username from sessionStorage: ", username);
  const [totalPrice, setTotalPrice] = useState(0);
  const getCartItemsDetal = async (cartItems) => {
    const promises = cartItems.map(async (e) => {
      const data = {
        id: e.idProduct,
      };
      const productSlug = await getProductById(data);
      return {
        ...e,
        product: productSlug,
      };
    });

    return Promise.all(promises);
  };
  useEffect(() => {
    async function updateCart() {
      const updatedCart = await getCartItemsDetal(cartItems);
      setCartProducts(updatedCart);

      const totalProducts = updatedCart.reduce(
        (total, item) => total + Number(item.quantity),
        0
      );
      setTotalProducts(totalProducts);

      const totalPrice = updatedCart.reduce(
        (total, item) =>
          total + Number(item.product.price) * Number(item.quantity),
        0
      );
      setTotalPrice(totalPrice);
    }

    updateCart();
  }, [cartItems]);
  const handleVNPay = () => {
    setCheckActive(true);
    setCheckActiveCOD(false);
    setFormData({ ...formData, typePay: "Vnpay" });
  };
  const handleCod = () => {
    setCheckActiveCOD(true);
    setCheckActive(false);
    console.log(checkActiveCOD);
    setFormData({ ...formData, typePay: "Cod" });
  };
  return (
    <div>
      {username ? (
        <Tabs defaultActiveKey="1">
          <Tabs.TabPane tab="Đặt hàng" key="1">
            <Helmet title="Giỏ hàng">
              <div className="cart">
                <div className="cart__info">
                  <div className="payment-form-container">
                    <label
                      htmlFor="title"
                      style={{ textAlign: "center", fontSize: "20px" }}
                    >
                      Thông tin đặt hàng
                    </label>
                    <form onSubmit={handleSubmit}>
                      <div className="form-group">
                        <label htmlFor="fullName">Họ và tên</label>
                        <input
                          type="text"
                          id="fullName"
                          name="fullName"
                          value={formData.fullName}
                          onChange={handleChange}
                        />
                      </div>

                      <div className="form-group">
                        <label htmlFor="phoneNumber">Số điện thoại</label>
                        <input
                          type="tel"
                          id="phoneNumber"
                          name="phoneNumber"
                          value={formData.phoneNumber}
                          onChange={handleChange}
                        />
                      </div>
                      <div className="form-group">
                        <label htmlFor="road">Địa chỉ nhận hàng</label>
                        <input
                          type="text"
                          id="road"
                          name="road"
                          placeholder="Thôn/ Đường/ Phố"
                          value={formData.road}
                          onChange={handleChange}
                          style={{ marginBottom: "10px" }}
                        />
                        <input
                          type="text"
                          id="ward"
                          name="ward"
                          value={formData.ward}
                          placeholder="Xã/ Phường"
                          onChange={handleChange}
                          style={{ marginBottom: "10px" }}
                        />
                        <input
                          type="text"
                          id="district"
                          name="district"
                          value={formData.district}
                          placeholder="Quận/ Huyện"
                          onChange={handleChange}
                          style={{ marginBottom: "10px" }}
                        />
                        <input
                          type="text"
                          id="country"
                          name="country"
                          value={formData.country}
                          placeholder="Tỉnh/ Thành phố"
                          onChange={handleChange}
                          style={{ marginBottom: "10px" }}
                        />
                      </div>
                      {/* ...other address fields... */}
                      <div className="form-group payment-buttons">
                        <label htmlFor="address1">Hình thức thanh toán</label>
                        <button
                          type="button"
                          className={`vnpay-btn ${checkActive ? "activepay" : ""
                            }`}
                          onClick={handleVNPay}
                        >
                          VNPay
                        </button>
                        <button
                          type="button"
                          className={`cod-btn ${checkActiveCOD ? "activepay" : ""
                            }`}
                          onClick={handleCod}
                        >
                          COD
                        </button>
                      </div>
                    </form>
                  </div>
                  {messageIsEmpty && (
                    <div
                      className="errorSignUp"
                      style={{ marginBottom: "10px" }}
                    >
                      {messageIsEmpty}
                    </div>
                  )}
                  <div className="cart__info__txt">
                    <p>Bạn đang có {totalProducts} sản phẩm trong giỏ hàng</p>
                    <div className="cart__info__txt__price">
                      <span>Thành tiền </span>
                      <span>{numberWithCommas(totalPrice)}</span>
                    </div>
                  </div>
                  <div className="cart__info__btn">
                    {/* <Link to="/thanhtoan">
                 
                </Link> */}
                    <Button onClick={handleConfirm} size="block">
                      Đặt hàng
                    </Button>
                    <br />
                    <Link to="/catalog">
                      <Button size="block">Tiếp tục mua hàng</Button>
                    </Link>
                  </div>
                </div>
                <div className="cart__list">
                  {cartProducts.map((item, index) => (
                    <CartItem item={item} index={index} key={index} />
                  ))}
                </div>
              </div>
            </Helmet>
          </Tabs.TabPane>
          <Tabs.TabPane tab="Đơn hàng của tôi" key="2">
            <CustomerOrder />
          </Tabs.TabPane>
        </Tabs>
      ) : (
        <div>
          <h1>Vui lòng đăng nhập để xem giỏ hàng</h1>
          <Link to="/login">
            <Button size="block">Đăng nhập</Button>
          </Link>
        </div>
      )}
    </div>
  );
};
export default Cart;

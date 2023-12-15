package kr.co.itwill.cart;

public class CartDTO {

    private int cartno;
    private int product_code;
    private int price;
    private int qty;
    private String id;
    private String regdate;
	
    public CartDTO() {}

	public int getCartno() {
		return cartno;
	}

	public void setCartno(int cartno) {
		this.cartno = cartno;
	}

	public int getProduct_code() {
		return product_code;
	}

	public void setProduct_code(int product_code) {
		this.product_code = product_code;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "CartDTO [cartno=" + cartno + ", product_code=" + product_code + ", price=" + price + ", qty=" + qty
				+ ", id=" + id + ", regdate=" + regdate + "]";
	}
}//class end
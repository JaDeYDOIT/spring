package kr.co.itwill.cart;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAO {
	
	public CartDAO() {
		System.out.println("-----CartDAO()객체 생성됨");
	}//end
	
	@Autowired
	SqlSession sqlSession;
	
	public int cartInsert(CartDTO dto) {
		return sqlSession.insert("cart.insert", dto);
	}//insert() end
	
	
	public List<CartDTO> cartList(String id){
		return sqlSession.selectList("cart.list", id);
	}//list() end
	
	/* 내가 한 거
	 * public int cartDelete(int cartno) { return sqlSession.delete("cart.delete",
	 * cartno); }//delete() end
	 */	
	
	public int cartDelete(HashMap<String, Object> map) {
		return sqlSession.delete("cart.delete", map);
	}//delete() end
	
}//class end
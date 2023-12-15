package kr.co.itwill.cart;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/cart")
public class CartCont {

	public CartCont() {
		System.out.println("-----CartCont()객체 생성됨");
	}//end
	
	
	@Autowired
	CartDAO cartDao;
	
	
	@PostMapping("/insert")
	public String cartInsert(@ModelAttribute CartDTO cartDto, HttpSession session) {
		//로그인 기능을 구현했다면 session.Arribute() 활용
		//cartDto.setId(session.Arribute("s_id"));
		cartDto.setId("itwill");//여기서는 임시로 "itwill"
		cartDao.cartInsert(cartDto);
		return "redirect:/cart/list";//장바구니 목록페이지 호출
	}//cartInsert() end
	
	
	@RequestMapping("/list")
	public ModelAndView list(HttpSession session) {
		//로그인 했다면
		//String s_id = session.getAttribute("s_id")
		String s_id = "itwill";//테스트용 임시 아이디 "itwill"

		ModelAndView mav = new ModelAndView();
		mav.setViewName("cart/list"); //WEB-INF/views/cart/list.jsp
		mav.addObject("list",cartDao.cartList(s_id));
		return mav;
	}//list() end
	
	
	/* 내가 한 거
	 * @PostMapping("/delete/{cartno}")
	 * 
	 * @ResponseBody public int mcartDelete(@PathVariable int cartno) throws
	 * Exception { int cnt = cartDao.cartDelete(cartno); return cnt; }//cartDelete()
	 * end
	 */	
	
	//강사님 삭제 풀이
	@GetMapping("/delete")
	public String delete(int cartno, HttpSession session) {
		//delete from cart where cartno=? and id=?
		/* 강사님 삭제 풀이 1번
		CartDTO cartDto = new CartDTO();
		cartDto.setCartno(cartno);
		cartDto.setId(session.getAttribute("세션변수명"));
		cartDao.cartDelete(cartDto);
		*/
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("no", cartno);
		//map.put("s_id", session.getAttribute("세션변수명"));
		map.put("s_id", "itwill");
		cartDao.cartDelete(map);
		return "redirect:/cart/list";
	}//delete() end
}//class end
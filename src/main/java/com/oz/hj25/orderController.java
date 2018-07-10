package com.oz.hj25;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.oz.hj25.biz.CartBizImpl;
import com.oz.hj25.biz.GoodsBiz;
import com.oz.hj25.biz.OrdersBizImpl;
import com.oz.hj25.biz.SaleBizImpl;
import com.oz.hj25.biz.StockBizImpl;
import com.oz.hj25.dto.CartDto;
import com.oz.hj25.dto.OrdersDto;
import com.oz.hj25.dto.SaleDto;

@Controller
public class orderController {
	
	@Autowired
	private CartBizImpl cartBiz;
	
	@Autowired
	private OrdersBizImpl ordersBiz;
	
	@Autowired
	private StockBizImpl stockBiz;
	
	@Autowired
	private SaleBizImpl saleBiz;
	
	@Autowired
	private GoodsBiz goodsBiz;
	
	@RequestMapping("userMain.order")
	public String userMain() {
		return "userMain";
	}
	
	@RequestMapping("orderGoodsList.order")
	public String orderGoodsList() {
		return "orderGoodsList";
	}
	
	@RequestMapping("saleList.order")
	public String saleList(Model model, @ModelAttribute SaleDto dto) {
		
		model.addAttribute("saleList", saleBiz.selectAll(dto));
		model.addAttribute("saleDate", dto.getSal_date());
		return "saleList";
	}
	
	@RequestMapping("orderList.order")
	public String orderList(Model model, String i_id, String o_inputDate) {
		model.addAttribute("orderList", ordersBiz.ordersId(i_id, o_inputDate));
		model.addAttribute("o_inputDate", o_inputDate);
		return "orderList";
	}
	
	@RequestMapping("stockList.order")
	public String stockList(Model model, String i_id) {
		model.addAttribute("stockList", stockBiz.stockList(i_id));
		return "stockList";
	}
	
	@RequestMapping("orderCart.order")
	public String orderCart(Model model, @RequestParam("i_id") String i_id, String o_inputDate) {
		model.addAttribute("cartInfo",  cartBiz.selectAll(i_id));
		model.addAttribute("orderList", ordersBiz.ordersId(i_id, o_inputDate));
		return "orderCart";
	}
	
	@RequestMapping(value="orderCartUpdate.order")
	public void orderCartUpdate(Model model, int c_no, int c_amt, HttpServletResponse response) {
		CartDto dto = new CartDto();
		dto.setC_no(c_no);
		dto.setC_amt(c_amt);
		
		int res = cartBiz.update(dto);
		
		if(res>0) {
			try {
				response.getWriter().print("수정완료");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				response.getWriter().print("수정 실패. 다시 시도해주세요.");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	@RequestMapping(value="orderCartDelete.order")
	public void orderCartDelete(Model model, int c_no, HttpServletResponse response) {
		
		int res = cartBiz.delete(c_no);
		
		if(res>0) {
			try {
				response.getWriter().print("삭제 완료");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				response.getWriter().print("삭제 실패. 다시 시도해주세요.");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	@RequestMapping(value="orderCartSelectOne.order")
	public void orderCartSelectOne(Model model, @ModelAttribute CartDto dto, HttpServletResponse response) {
		CartDto cDto = cartBiz.selectOne(dto);
		
		if(cDto != null) {
			try {
				response.getWriter().print("장바구니에 이미 상품이 담겨있습니다.");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			int res = cartBiz.insert(dto);
			
			if(res>0) {
				try {
					response.getWriter().print("장바구니에 상품을 담았습니다.");
				} catch (IOException e) {
					e.printStackTrace();
				}
			} else {
				try {
					response.getWriter().print("장바구니 담기에 실패했습니다. 다시 시도해주세요.");
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
	}
	
	@RequestMapping("ordersInsert.order")
	public String ordersInsert(Model model, String i_id, int[] g_no, int[] o_amt) {
		
		for(int i=0 ; i<g_no.length ; i++) {
			OrdersDto dto = new OrdersDto();
			dto.setI_id(i_id);
			dto.setG_no(g_no[i]);
			dto.setO_amt(o_amt[i]);
			
			int res = ordersBiz.ordersInsert(dto);
			if(res<=0) {
				model.addAttribute("msg", "발주 실패");
				model.addAttribute("cartInfo",  cartBiz.selectAll(i_id));
				return "orderCart";
			}
		}
		
		cartBiz.allDelete(i_id);
		model.addAttribute("msg", "발주 완료");
		return "userMain";
	}
	
	@RequestMapping("ordersOneDelete.order")
	public void orderOneDelete(@ModelAttribute OrdersDto dto, HttpServletResponse response) {
		int res = ordersBiz.orderOneDelete(dto);
		if(res>0) {
			try {
				response.getWriter().print("삭제 성공");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				response.getWriter().print("삭제 실패");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	@RequestMapping("ordersDelete.order")
	public void ordersDelete(Model model, String i_id, HttpServletResponse response) {
		int res = ordersBiz.orderDelete(i_id);
		if(res>0) {
			try {
				response.getWriter().print("success");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				response.getWriter().print("error");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	@RequestMapping("ordersUpdate.order")
	public void ordersUpdate(@ModelAttribute OrdersDto dto, HttpServletResponse response) {
		int res = ordersBiz.ordersUpdate(dto);
		if(res>0) {
			try {
				response.getWriter().print("수정 성공");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				response.getWriter().print("수정 실패");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	@RequestMapping("stockDelete.order")
	public void stockDelete(int s_no, HttpServletResponse response) {
		
		int res = stockBiz.stockDelete(s_no);
		
		if(res>0) {
			try {
				response.getWriter().print("삭제 완료");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				response.getWriter().print("삭제 실패. 다시 시도해주세요.");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	@RequestMapping("saleAnalysis.order")
	public String saleAnalysis(Model model, String i_id, String g_name, String startDate, String endDate) {
		List<SaleDto> anaList = saleBiz.goodsSearchList(i_id, g_name, startDate, endDate);
		model.addAttribute("anaList", anaList);
		model.addAttribute("g_name", g_name);
		return "saleAnalysis";
	}
	
	@RequestMapping("myStoreAnalysis.order")
	public void myStoreAnalysis(String i_id, String g_name, String startDate, String endDate, HttpServletResponse response) {
		List<SaleDto> anaList = saleBiz.goodsSearchList(i_id, g_name, startDate, endDate);
		try {
			response.getWriter().print(anaList);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("localStoreAnalysis.order")
	public void localStoreAnalysis(String i_id, String g_name, String startDate, String endDate, HttpServletResponse response) {
		List<SaleDto> anaList = saleBiz.addrSearchList(g_name, i_id, startDate, endDate);
		try {
			response.getWriter().print(anaList);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("autoOrderSearshList.order")
	public void autoOrderSearshList(String i_id, HttpServletResponse response) {
		List<SaleDto> list = saleBiz.autoOrderSearshList(i_id);
		
		if(list != null) {
			cartBiz.allDelete(i_id);
			
				for(int i=0 ; i<list.size() ; i++) {
					CartDto dto = new CartDto();
					dto.setI_id(i_id);
					dto.setg_no(list.get(i).getG_no());
					dto.setC_amt(Integer.parseInt(list.get(i).getSearch_avg()));
					int cartRes = cartBiz.insert(dto);
					if(cartRes<=0) {
						try {
							response.getWriter().print("자동 장바구니 넣기 실패");
						} catch (IOException e) {
							e.printStackTrace();
						}
						break;
					}
				}
		} else {
			try {
				response.getWriter().print("자동 분석 실패");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} 
			try {
				response.getWriter().print("자동 장바구니 넣기 성공");
			} catch (IOException e) {
				e.printStackTrace();
			}
		
		
	}
	
	@RequestMapping(value="stockList.do")
	public String StockList(Model model,@RequestParam("i_id")String i_id) {
		model.addAttribute("List", stockBiz.stockList(i_id));
		return"stockList";
	}
	@RequestMapping(value="orderGoodsList.do")
	public String orderGoodsList(Model model) {
		return"orderGoodsList";
	}
	@RequestMapping(value="orderCategorieList.do")
	public String orderList(Model model,@RequestParam("ct_no") int ct_no) {
		model.addAttribute("List",goodsBiz.goodsList(ct_no));
		return"orderGoodsList";
	}
	@RequestMapping(value="orderName.do")
	public String orderName(Model model, @RequestParam("o_inputName")String o_inputName) {
		model.addAttribute("List",goodsBiz.goodsName(o_inputName));
		return "orderGoodsList";
	}
	@RequestMapping(value="orderList.do")
	public String orderList(Model model) {
		return"orderList";
	}
	@RequestMapping(value="orderSearch.do")
	public String orderSerarch(Model model,@RequestParam("i_id")String i_id,@RequestParam("o_inputDate")String o_inputDate) {
		model.addAttribute("List", ordersBiz.ordersId(i_id, o_inputDate));
		return "orderList";
	}
	
}

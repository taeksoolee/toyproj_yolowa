package site.yolowa.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import site.yolowa.dao.WishlistDAO;
import site.yolowa.dto.Wishlist;

@Service
public class WishlistServiceImpl implements WishlistService{
	
	@Autowired
	private WishlistDAO wishlistDAO;
	
	@Override
	public int addWishlist(Map<String, Object> map) {
		return wishlistDAO.insertWishlist(map);
	}

	@Override
	public int removeWishlist(Map<String, Object> map) {
		return wishlistDAO.deleteWishlist(map);
	}

	@Override
	public List<Map<String, Object>> getSelectMainWishlist(int memberNo) {
		return wishlistDAO.selectMainWishlist(memberNo);
	}

	@Override
	public Wishlist getMainWishlistSave(Wishlist wishlist) {
		return wishlistDAO.selectMainWishlistSave(wishlist);
	}
	
	

}

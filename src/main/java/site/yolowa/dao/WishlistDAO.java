package site.yolowa.dao;

import java.util.List;
import java.util.Map;

import site.yolowa.dto.Wishlist;

public interface WishlistDAO {
	int insertWishlist(Map<String, Object>map);
	int deleteWishlist(Map<String, Object>map);
	List<Map<String, Object>> selectMainWishlist(int memberNo);
	Wishlist selectMainWishlistSave(Wishlist wishlist);
	
}

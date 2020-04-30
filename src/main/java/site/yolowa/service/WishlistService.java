package site.yolowa.service;

import java.util.List;
import java.util.Map;

import site.yolowa.dto.Wishlist;

public interface WishlistService {
	int addWishlist(Map<String, Object>map);
	int removeWishlist(Map<String, Object>map);
	List<Map<String, Object>> getSelectMainWishlist(int memberNo);
	Wishlist getMainWishlistSave(Wishlist wishlist);
}

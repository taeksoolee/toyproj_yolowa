package site.yolowa.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import site.yolowa.dto.Wishlist;
import site.yolowa.mapper.MainWishlistMapper;

@Repository
public class WishlistDAOImpl implements WishlistDAO{
	@Autowired
	public SqlSession sqlSession;

	@Override
	public int insertWishlist(Map<String, Object> map) {
		return sqlSession.getMapper(MainWishlistMapper.class).insertWishlist(map);
	}

	@Override
	public int deleteWishlist(Map<String, Object> map) {
		return sqlSession.getMapper(MainWishlistMapper.class).deleteWishlist(map);
	}
	
	@Override
	public List<Map<String, Object>> selectMainWishlist(int memberNo) {
		return sqlSession.getMapper(MainWishlistMapper.class).selectMainWishlist(memberNo);
	}

	@Override
	public Wishlist selectMainWishlistSave(Wishlist wishlist) {
		return sqlSession.getMapper(MainWishlistMapper.class).selectMainWishlistSave(wishlist);
	}
}


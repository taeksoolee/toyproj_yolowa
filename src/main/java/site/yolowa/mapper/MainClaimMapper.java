package site.yolowa.mapper;

import site.yolowa.dto.Claim;

public interface MainClaimMapper {
	int insertClaimDetail(Claim claim);
	int insertClaimGuest(Claim claim);
}

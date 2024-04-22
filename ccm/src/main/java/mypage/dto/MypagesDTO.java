package mypage.dto;

import java.util.HashMap;
import java.util.List;

import favorite.dto.Favorite;

public class MypagesDTO {

	private UserProfileDTO userProfileDTO; //유저 프로필 
	private List<MyRecipeDTO> myRecipeDTO; // 내가 작성한 레시피 (+이미지)
	private HashMap<Integer, Favorite> favoriteListDTO; //즐겨찾기 목록 (+이미지)
	private List<HealthLightDTO> healthLightDTO; // 카페인 캘린더 
	
	public MypagesDTO(UserProfileDTO userProfileDTO, List<MyRecipeDTO> myRecipeDTO, HashMap<Integer, Favorite> favoriteListDTO, List<HealthLightDTO> healthLightDTO ) {
		this.userProfileDTO = userProfileDTO;
		this.myRecipeDTO = myRecipeDTO;
		this.favoriteListDTO = favoriteListDTO;
		this.healthLightDTO = healthLightDTO;
	}

	public UserProfileDTO getUserProfileDTO() {
		return userProfileDTO;
	}

	public void setUserProfileDTO(UserProfileDTO userProfileDTO) {
		this.userProfileDTO = userProfileDTO;
	}
	
	public List<MyRecipeDTO> getMyRecipeDTO() {
		return myRecipeDTO;
	}

	public void setMyRecipeDTO(List<MyRecipeDTO> myRecipeDTO) {
		this.myRecipeDTO = myRecipeDTO;
	}

	public HashMap<Integer, Favorite> getFavoriteListDTO() {
		return favoriteListDTO;
	}

	public void setFavoriteListDTO(List<FavoriteListDTO> favoriteListDTO) {
		this.favoriteListDTO = (HashMap<Integer, Favorite>) favoriteListDTO;
	}

	public List<HealthLightDTO> getHealthLightDTO() {
		return healthLightDTO;
	}

	public void setHealthLightDTO(List<HealthLightDTO> healthLightDTO) {
		this.healthLightDTO = healthLightDTO;
	}

	@Override
	public String toString() {
		return "MypagesDTO [userProfileDTO=" + userProfileDTO + ", myRecipeDTO=" + myRecipeDTO + ", favoriteListDTO="
				+ favoriteListDTO + ", healthLightDTO=" + healthLightDTO + "]";
	}

}

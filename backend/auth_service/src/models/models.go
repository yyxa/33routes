package models

type UserRegisterInfo struct {
	Username string `json:"username"`
	Name     string `json:"name"`
	Email    string `json:"email"`
	Password string `json:"password"`
}

type UserRegisterResponse struct {
	User_id uint   `json:"user_id"`
	Token   string `json:"token"`
}

type UserLogin struct {
	Email    string `json:"email"`
	Password string `json:"password"`
}

type UserLoginResponse struct {
	Token string `json:"token"`
}

type TokenCheck struct {
	User_id uint `json:"user_id"`
}

type TokenCheckResponse struct {
	User_id uint `json:"user_id"`
}

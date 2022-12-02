import {User} from "./userModel";

export class AuthenticationService {

    public isAuthenticationWithMailValid = async (email: string, password: string): Promise<boolean> => {
        const res = await User.findOne({
                where: {
                    email: email,
                    password: password
                }
            }
        )
        return res !== null
    }
}
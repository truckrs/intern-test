import {AuthenticationService} from "./authenticationService";

export class Controller {

    private readonly authenticationService: AuthenticationService;

    constructor() {
        this.authenticationService = new AuthenticationService()
    }

    authenticate = async (req: any, res: any) => {
        const login = req.params.login
        const password = req.params.password
        if (login && password && await this.authenticationService.isAuthenticationWithMailValid(login, password)) {
            res.json({'authenticated': true})
        } else {
            res.status(401)
            res.json({'authenticated': false})
        }
    }
}
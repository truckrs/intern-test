import {Controller} from "./controller";

exports.route = (app : any) => {
    const controller = new Controller()

    app.get('/', (req : any, res : any) => {
        res.send('Truckrs Back Server');
    });

    app.route('/authentication/:email/:password')
        .post(controller.authenticate);

}
import {v4 as uuidv4} from 'uuid';

const generateUuid = (request: any, response: any) => {

    let myuuid = uuidv4();

    console.info(`Generated uuid!!! -> ${myuuid}`);

    response.status(200).json([
        {
            id: 1,
            name: myuuid
        }
    ]);
}

export default {
    generateUuid
}
import { formatParams } from '../Utils';

const principalUrl = 'http://localhost:3001/api/';

export const getJsonFromGet = async (apiMethod: string, objParams: any) => {
    const url = principalUrl + apiMethod + formatParams(objParams)
    const response = await fetch(url, {
        method: 'GET',
        headers: {
            "Content-Type": "application/json"
        }
    });
    if (response.ok) {
        const result = await response.json();
        return result;
    } else {
        return [];
    }
};

export const getJsonFromPost = async (apiMethod: string, objParams: any) => {
    const url = principalUrl + apiMethod;
    const response = await fetch(url, {
        method: 'POST',
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(objParams)
    });
    if (response.ok) {
        const result = await response.json();
        return result;
    }
}
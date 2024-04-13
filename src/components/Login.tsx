import GoogleButton from 'react-google-button';
import { getAuth, signInWithPopup } from "firebase/auth";
import { appFirebase, provider } from "../firebase/credentials";
const auth = getAuth(appFirebase)

interface LoginProps {
    updateLoggedUser:(valueUser: string) => void
}

const Login = ({ updateLoggedUser }: LoginProps) => {
    const authentication = async () => {
        try {
            signInWithPopup(auth, provider).then((data) => {
                localStorage.setItem("email", data.user.email);
                updateLoggedUser(data.user.email);
            })
        } catch (error) {
            console.log(error);
        }
    }

    return (
        <div className="container">
            <div className="row">
                <div className='col-4'></div>
                <div className="col-4">
                    <GoogleButton
                      onClick={() => { authentication() }}
                    />
                </div>
                <div className='col-4'></div>
            </div>
        </div>
    )
}

export default Login;
import { NextPage } from "next";
import { StoreLoginHeader } from "../../components/base/StoreLoginHeader";
import { LoginForm } from "../../components/page/store/LoginForm";

const Login: NextPage = () => {
  return (
    <>
      <StoreLoginHeader />
      <LoginForm />
    </>
  );
};

export default Login;

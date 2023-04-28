import { Button } from "@mui/material";
import { NextPage } from "next";
import Router from "next/router";
import { StoreHeader } from "../../components/base/StoreHeader";
import { storeSessionDeleteApi } from "../../libs/storeSessionApi";

const Home: NextPage = () => {
  const logoutRequest = async () => {
    try {
      const response = await storeSessionDeleteApi();
      console.log(response);
      Router.push("/store/login");
    } catch (error) {
      console.log(error);
    }
  };

  return (
    <>
      <StoreHeader />
      <h1>勤怠ホーム画面</h1>
      <Button
        onClick={() => {
          logoutRequest();
        }}
      >
        ログアウト
      </Button>
      <br />
      <Button variant="contained">出勤</Button>
      <Button variant="contained">退勤</Button>
      <br />
      <Button variant="contained">休憩開始</Button>
      <Button variant="contained">休憩終了</Button>
    </>
  );
};

export default Home;

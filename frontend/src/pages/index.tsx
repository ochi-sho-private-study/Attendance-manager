import { Button } from "@mui/material";
import { NextPage } from "next";
import Link from "next/link";

const Home: NextPage = () => {
  return (
    <Link href="/store/login">
      <Button variant="contained" color="warning">
        店舗ログイン画面はこちら
      </Button>
    </Link>
  );
};

export default Home;

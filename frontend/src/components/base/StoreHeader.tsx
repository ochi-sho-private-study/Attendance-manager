import { useRouter } from "next/router";
import { useEffect, useState } from "react";
import { storeSessionFetchApi } from "../../libs/storeSessionApi";
import { StoreLoggedInHeader } from "./StoreLoggedInHeader";
import { StoreLoginHeader } from "./StoreLoginHeader";

const NO_SESSION_PATHS = ["/", "/store/login", "/store/password_reissue"];

export const StoreHeader = () => {
  const [isLoggedIn, setIsLoggedIn] = useState<boolean>(false);
  const [storeName, setStoreName] = useState<string>("");
  const router = useRouter();

  useEffect(() => {
    if (NO_SESSION_PATHS.includes(router.pathname)) {
      setIsLoggedIn(false);
      return;
    }

    storeSessionFetchApi()
      .then((response) => {
        console.log(response);
        setStoreName(response.data.name);
        // NOTE: isLoggedInのbooleanでヘッダーの出し分けを行う。
        setIsLoggedIn(true);
      })
      .catch(() => {
        router.push("/");
      });
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [router.pathname]);

  if (isLoggedIn === true) {
    return <StoreLoggedInHeader name={storeName} />;
  }
  return <StoreLoginHeader />;
};

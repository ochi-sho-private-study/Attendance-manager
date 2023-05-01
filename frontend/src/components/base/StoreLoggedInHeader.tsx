import { css } from "@emotion/react";
import Head from "next/head";
import Image from "next/image";
import { DigitalClock } from "../ui/DigitalClock";

type Props = {
  name: string;
};

export const StoreLoggedInHeader = (props: Props) => {
  return (
    <>
      <Head>
        <title>勤怠管理くん</title>
        <link rel="icon" href="/convenience_store.png" />
      </Head>
      <div css={styles.mainHeaderWrapper}>
        <Image
          src="/convenience_store.png"
          width={90}
          height={90}
          alt="勤怠管理くんのアイコン"
        />
        <div css={styles.headerTitleWrapper}>
          <div css={styles.appNameWrapper}>勤怠管理くん</div>
          <div css={styles.storeNameWrapper}>{props.name}</div>
        </div>
        <DigitalClock />
      </div>
    </>
  );
};

const styles = {
  mainHeaderWrapper: css`
    display: flex;
    padding: 5px;
    text-align: left;
    color: black;
    background-color: #ddd;
    height: 130px;
  `,
  headerTitleWrapper: css`
    padding: 3px;
  `,
  appNameWrapper: css`
    font-size: 35px;
  `,
  storeNameWrapper: css`
    font-size: 20px;
  `,
};

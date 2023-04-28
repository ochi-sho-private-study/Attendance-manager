import { css } from "@emotion/react";
import Head from "next/head";
import Image from "next/image";
import Link from "next/link";

export const StoreLoginHeader = () => {
  return (
    <>
      <Head>
        <title>勤怠管理くん</title>
        <link rel="icon" href="/convenience_store.png" />
      </Head>
      <div css={styles.mainHeaderWrapper}>
        <Image
          src="/convenience_store.png"
          width={60}
          height={60}
          alt="勤怠管理くんのアイコン"
        />
        <div css={styles.headerTitleWrapper}>勤怠管理くん</div>
      </div>
      <ul css={styles.ulWrapper}>
        <li css={styles.firstLiWrapper}>
          <Link href="/">Topページ</Link>
        </li>
        <li css={styles.liWrapper}>
          <Link href="/store/login">店舗ログイン</Link>
        </li>
        <li css={styles.liWrapper}>
          <Link href="#">従業員ログイン</Link>
        </li>
      </ul>
    </>
  );
};

const styles = {
  ulWrapper: css`
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    color: #fff;
    background-color: #333;
  `,
  liWrapper: css`
    padding: 15px 20px;
    float: left;
    margin-left: 20px;
    &:hover {
      color: #333;
      background-color: #ddd;
    }
  `,
  firstLiWrapper: css`
    padding: 15px 20px;
    float: left;
    text-align: left;
    margin-right: auto;
    &:hover {
      color: #333;
      background-color: #ddd;
    }
  `,
  mainHeaderWrapper: css`
    display: flex;
    padding: 5px;
    text-align: left;
    color: black;
    background-color: #ddd;
  `,
  headerTitleWrapper: css`
    padding: 3px;
    font-size: 35px;
  `,
};

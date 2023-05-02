import { css } from "@emotion/react";
import { NextPage } from "next";
import { useState, useEffect } from "react";
import { StoreHeader } from "../../components/base/StoreHeader";
import { positionsfetchApi } from "../../libs/positionApi";
import { PositionMasterProps } from "../../types/PositionMasterProps";

const PositionMaster: NextPage = () => {
  const [positionMasters, setPositionMasters] = useState([]);
  const [isLoading, setIsLoading] = useState<boolean>(true);

  useEffect(() => {
    setIsLoading(true);
    positionsfetchApi()
      .then((response) => {
        setPositionMasters(response.data.positions);
        setIsLoading(false);
      })
      .catch(() => {
        console.log("error");
      });
  }, []);

  return isLoading ? (
    <>
      <StoreHeader />
      <h1>部署一覧</h1>
    </>
  ) : (
    <>
      <StoreHeader />
      <h1>部署一覧</h1>
      <br />
      <table css={styles.TableEntire}>
        <thead>
          <tr css={styles.TrWrapper}>
            <th css={styles.ThWrapper}>部署ID</th>
            <th css={styles.ThWrapper}>部署名</th>
          </tr>
        </thead>
        {positionMasters.map((positionMaster: PositionMasterProps) => (
          <tbody key="{positionMaster}" css={styles.TbodyTrWrapper}>
            <tr css={styles.TrWrapper}>
              <td css={styles.TdWrapper}>{positionMaster.id}</td>
              <td css={styles.TdWrapper}>{positionMaster.name}</td>
            </tr>
          </tbody>
        ))}
      </table>
    </>
  );
};

export default PositionMaster;

const styles = {
  TableEntire: css`
    border-collapse: collapse;
    width: 100%;
    max-width: 800px;
    margin: 0 auto;
    background-color: #fff;
    color: #333;
    font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
  `,
  TrWrapper: css`
    text-align: left;
    border: 1px solid #ccc;
  `,
  ThWrapper: css`
    padding: 0.8rem;
    background-color: #a9a9a9;
    font-weight: bold;
    text-transform: uppercase;
  `,
  TdWrapper: css`
    padding: 0.8rem;
  `,
  TbodyTrWrapper: css`
    &:hover {
      background-color: #ddd;
    }
  `,
};

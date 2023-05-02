import { NextPage } from "next";
import { useState, useEffect } from "react";
import { StoreHeader } from "../../components/base/StoreHeader";
import { positionsfetchApi } from "../../libs/positionApi";
import { PositionMasterProps } from "../../types/positionMasterProps";

const PositionMaster: NextPage = () => {
  const [positionMasters, setPositionMasters] = useState([]);
  const [isLoading, setIsLoading] = useState<boolean>(true);

  useEffect(() => {
    setIsLoading(true);
    positionsfetchApi()
      .then((response) => {
        // console.log(response.data.positions);
        // console.log(Array.isArray(response.data.positions));
        setPositionMasters(response.data.positions);
        console.log(response.data.positions[0]);
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
      <table>
        <thead>
          <tr>
            <th>部署ID</th>
            <th>部署名</th>
          </tr>
        </thead>
        {positionMasters.map((positionMaster: PositionMasterProps) => (
          <tbody key="{positionMaster}">
            <tr>
              <td>{positionMaster.id}</td>
              <td>{positionMaster.name}</td>
            </tr>
          </tbody>
        ))}
      </table>
    </>
  );
};

export default PositionMaster;

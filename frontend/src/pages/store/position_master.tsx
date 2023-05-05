import { css } from "@emotion/react";
import { Button } from "@mui/material";
import { NextPage } from "next";
import { useState, useEffect } from "react";
import { SubmitHandler, useForm } from "react-hook-form";
import { StoreHeader } from "../../components/base/StoreHeader";
import { StringTextForm } from "../../components/ui/Form/StringTextForm";
import { positionsfetchApi, positionUpdateApi } from "../../libs/positionApi";
import { PositionMasterProps } from "../../types/PositionMasterProps";

const PositionMaster: NextPage = () => {
  const [positionMasters, setPositionMasters] = useState([]);
  const [isLoading, setIsLoading] = useState<boolean>(true);
  const [show, setShow] = useState(false);
  const [editTargetPosition, setEditTargetPosition] = useState({});

  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm<PositionMasterProps>({ shouldFocusError: false });

  const onSubmit: SubmitHandler<PositionMasterProps> = (data) => {
    console.log(11111);
    console.log(editTargetPosition);
    console.log(data);
    positionUpdateApi(editTargetPosition.id, data.name)
      .then((response) => {
        console.log(response);
        window.location.reload();
      })
      .catch(() => {
        console.log("error");
      })
      .finally(() => {
        setShow(false);
      });
  };

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

  function EditModal({ show, setShow }) {
    if (show) {
      return (
        <div css={styles.Overlay}>
          <div css={styles.ModalContent}>
            <h3>編集モーダル</h3>
            <form css={styles.FormEntire} onSubmit={handleSubmit(onSubmit)}>
              <StringTextForm
                label="部署名"
                errors={errors.name}
                register={register("name", { required: true })}
                errorMessage="部署名は必須です。"
              />
              <Button
                variant="contained"
                sx={{
                  background: "black",
                  color: "white",
                  ":hover": { background: "black" },
                }}
                type="submit"
              >
                更新
              </Button>
            </form>
            <button onClick={() => setShow(false)}>×</button>
          </div>
        </div>
      );
    } else {
    }
  }

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
            <th css={styles.ThWrapper}>操作</th>
          </tr>
        </thead>
        {positionMasters.map((positionMaster: PositionMasterProps) => (
          <tbody key="{positionMaster}" css={styles.TbodyTrWrapper}>
            <tr css={styles.TrWrapper}>
              <td css={styles.TdWrapper}>{positionMaster.id}</td>
              <td css={styles.TdWrapper}>{positionMaster.name}</td>
              <td css={styles.TdWrapper}>
                <button
                  css={styles.EditButton}
                  onClick={() => {
                    setShow(true);
                    setEditTargetPosition(positionMaster);
                  }}
                >
                  編集
                </button>
              </td>
            </tr>
          </tbody>
        ))}
      </table>
      <EditModal show={show} setShow={setShow} />
    </>
  );
};

export default PositionMaster;

const styles = {
  TableEntire: css`
    border-collapse: separate;
    overflow: hidden;
    border: 1px solid #aaa;
    border-spacing: 0;
    width: 100%;
    max-width: 800px;
    margin: 0 auto;
    background-color: #fff;
    color: #333;
    font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
    border-radius: 10px;
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
    border-bottom: 1px solid #aaa;
  `,
  TdWrapper: css`
    padding: 0.8rem;
    border-bottom: 1px solid #aaa;
  `,
  TbodyTrWrapper: css`
    &:hover {
      background-color: #ddd;
    }
  `,
  Overlay: css`
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    display: flex;
    align-items: center;
    justify-content: center;
  `,
  EditButton: css`
    display: inline-block;
    padding: 8px 16px;
    background-color: #fff;
    color: #333;
    border-radius: 4px;
    border: 1px solid #333;
    font-size: 14px;
    cursor: pointer;
    transition: all 0.2s ease-in-out;
  `,
  ModalContent: css`
    z-index: 2;
    width: 50%;
    padding: 1em;
    background: #fff;
  `,
  FormEntire: css`
    width: fit-content;
    margin: auto;
  `,
  ButtonWrapper: css`
    margin: 20px;
    text-align: center;
  `,
};

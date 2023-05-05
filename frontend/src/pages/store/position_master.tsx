import { css } from "@emotion/react";
import CancelIcon from "@mui/icons-material/Cancel";
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
  const [editTargetPosition, setEditTargetPosition] = useState<{
    id: number;
    name: string;
  }>({ id: 0, name: "" });
  const [positionMasterReloadTrigger, setPositionMasterReloadTrigger] =
    useState<boolean>(false);

  const {
    register,
    handleSubmit,
    setValue,
    formState: { errors },
  } = useForm<PositionMasterProps>({ shouldFocusError: false });

  const onSubmit: SubmitHandler<PositionMasterProps> = (data) => {
    console.log(data);
    positionUpdateApi(editTargetPosition.id, data.name)
      .then((response) => {
        console.log(response);
        setPositionMasterReloadTrigger(true);
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
      })
      .finally(() => {
        setPositionMasterReloadTrigger(false);
      });
  }, [positionMasterReloadTrigger]);

  const EditModal: React.FC<{ show: boolean; setShow: boolean }> = ({
    show,
    setShow,
  }) => {
    if (show) {
      return (
        <div css={styles.Overlay}>
          <div css={styles.ModalContent}>
            <div css={styles.CloseButtonWrapper}>
              <CancelIcon onClick={() => setShow(false)}></CancelIcon>
            </div>
            <h3>編集モーダル</h3>
            <form onSubmit={handleSubmit(onSubmit)}>
              <div css={styles.FormWrapper}>
                <StringTextForm
                  label="部署名"
                  errors={errors.name}
                  register={register("name", { required: true })}
                  errorMessage="部署名は必須です。"
                />
              </div>
              <div css={styles.SaveButtonWrapper}>
                <Button
                  css={styles.SaveButtonWrapper}
                  variant="contained"
                  sx={{
                    background: "black",
                    color: "white",
                    ":hover": { background: "black" },
                  }}
                  type="submit"
                >
                  保存
                </Button>
              </div>
            </form>
          </div>
        </div>
      );
    } else {
    }
  };

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
                    setValue("name", positionMaster.name);
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
    height: 40%;
    width: 35%;
    padding: 3em;
    background: #fff;
  `,
  CloseButtonWrapper: css`
    display: flex;
    justify-content: right;
  `,
  FormWrapper: css`
    width: fit-content;
    margin: auto;
  `,
  ButtonWrapper: css`
    margin: 20px;
    text-align: center;
  `,
  SaveButtonWrapper: css`
    display: flex;
    justify-content: right;
  `,
};

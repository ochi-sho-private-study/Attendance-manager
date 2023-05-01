import { css } from "@emotion/react";
import { Button } from "@mui/material";
import Link from "next/link";
import Router from "next/router";
import { useState } from "react";
import { SubmitHandler, useForm } from "react-hook-form";
import { storeSessionCreateApi } from "../../../libs/storeSessionApi";
import { StoreLoginProps } from "../../../types/StoreLoginProps";
import { PasswordForm } from "../../ui/Form/Login/PasswordForm";
import { TextForm } from "../../ui/Form/Login/TextForm";

export const LoginForm: React.FC = () => {
  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm<StoreLoginProps>({ shouldFocusError: false });

  const [errorMessage, setErrorMessage] = useState("");

  const onSubmit: SubmitHandler<StoreLoginProps> = (data) => {
    console.log(data);
    storeSessionCreateApi(data)
      .then((response) => {
        console.log(response);
        Router.push("/store/home");
      })
      .catch(() => {
        setErrorMessage("ログインに失敗しました。");
        console.log(errorMessage);
      });
  };

  return (
    <div>
      <h1>店舗ログイン画面</h1>
      <h2>{errorMessage}</h2>
      <form css={styles.FormEntire} onSubmit={handleSubmit(onSubmit)}>
        <TextForm
          label="店舗ID（半角数字）"
          errors={errors.storeId}
          register={register("storeId", { required: true })}
          errorMessage="店舗IDは必須です。"
        />
        <PasswordForm
          label="パスワード（半角英数字記号 8文字以上）"
          errors={errors}
          register={register("password", { required: true })}
        />
        <div css={styles.ButtonWrapper}>
          <Button
            type="submit"
            variant="contained"
            color="warning"
            size="large"
          >
            ログイン
          </Button>
        </div>
        <div css={styles.ButtonWrapper}>
          <Link href="/store/password_reissue">
            <Button
              type="submit"
              variant="outlined"
              color="warning"
              size="large"
            >
              パスワードを忘れた方はこちら
            </Button>
          </Link>
        </div>
      </form>
    </div>
  );
};

const styles = {
  FormEntire: css`
    width: fit-content;
    margin: auto;
  `,
  ButtonWrapper: css`
    margin: 20px;
    text-align: center;
  `,
};

import { css } from "@emotion/react";
import { Button } from "@mui/material";
import { NextPage } from "next";
import { useForm } from "react-hook-form";
import { PasswordForm } from "../../components/ui/Form/Login/PasswordForm";

const PasswordReissue: NextPage = () => {
  const {
    register,
    formState: { errors },
  } = useForm<{ password: string }>({ shouldFocusError: false });

  return (
    <>
      <h1>パスワード再発行画面</h1>
      <form css={styles.FormEntire}>
        <div>
          <PasswordForm
            label="パスワード"
            errors={errors}
            register={register("password", { required: true })}
          />
        </div>
        <div>
          <PasswordForm
            label="パスワード再確認"
            errors={errors}
            register={register("password", { required: true })}
          />
        </div>
        <div css={styles.ButtonWrapper}>
          <Button type="submit" variant="contained">
            パスワードを再発行する
          </Button>
        </div>
      </form>
    </>
  );
};

export default PasswordReissue;

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

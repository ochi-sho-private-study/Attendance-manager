import { css } from "@emotion/react";
import { UseFormRegisterReturn, FieldErrorsImpl } from "react-hook-form";

type PasswordFormProps = {
  label: string;
  errors: Partial<FieldErrorsImpl<{ password: string }>>;
  register: UseFormRegisterReturn<string>;
};

export const PasswordForm: React.FC<PasswordFormProps> = (
  props: PasswordFormProps
) => (
  <div css={styles.FormWrapper}>
    <label css={styles.FormLabel}>{props.label}</label>
    <input type="password" css={styles.FormInput} {...props.register} />
    {props.errors.password && <p>パスワードは必須です。</p>}
  </div>
);

const styles = {
  FormInput: css`
    background: linear-gradient(0deg, #a7daef, #a7daef),
      linear-gradient(0deg, #cac7c7, #cac7c7);
    height: 50px;
    width: 504px;
    left: 348px;
    top: 160px;
    border-radius: 0px;
    font-size: 20px;
    margin: 20px;
    border: 2px solid gray;
  `,
  FormLabel: css`
    display: block;
  `,
  FormWrapper: css`
    margin: 30px;
  `,
};

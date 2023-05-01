import { css } from "@emotion/react";
import { useCurrentDatetime } from "../../features/hooks/useCurrentDatetime";

export const DigitalClock = () => {
  const { date, time } = useCurrentDatetime();

  return (
    <>
      <div css={styles.digitalClockWrapper}>
        <span css={styles.dateWrapper}>{date}</span>{" "}
        <p css={styles.timeWrapper}>{time}</p>
      </div>
    </>
  );
};

const styles = {
  digitalClockWrapper: css`
    position: absolute;
    left: 40%;
    text-align: center;
    margin: 0px;
    background-color: white;
  `,
  dateWrapper: css`
    font-size: 30px;
    font-family: "arial black", "arial narrow", sans-serif;
    color: #808080;
  `,
  timeWrapper: css`
    font-size: 52px;
    margin: 0px;
    font-weight: bold;
    font-family: "arial black", "arial narrow", sans-serif;
  `,
};

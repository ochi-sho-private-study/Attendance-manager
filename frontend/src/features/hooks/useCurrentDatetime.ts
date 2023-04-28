import { useState, useEffect } from "react";
const weekdays = ["日", "月", "火", "水", "木", "金", "土"];

type Response = {
  date: string;
  time: string;
};

export const useCurrentDatetime = (): Response => {
  const [date, setDate] = useState<string>("----年--月--日(-)");
  const [time, setTime] = useState<string>("--:--:--");

  const formatDate = (date: Date) => {
    const year = date.getFullYear();
    const month = (date.getMonth() + 1).toString().padStart(2, "0");
    const day = date.getDate().toString().padStart(2, "0");
    const weekday = weekdays[date.getDay()];
    return `${year}年${month}月${day}日 (${weekday})`;
  };

  const formatTime = (date: Date) => {
    const hour = date.getHours().toString().padStart(2, "0");
    const minute = date.getMinutes().toString().padStart(2, "0");
    const seconds = date.getSeconds().toString().padStart(2, "0");
    return `${hour}:${minute}:${seconds}`;
  };

  useEffect(() => {
    const digitalTimer = setInterval(() => {
      let currentDate = new Date();
      const formattedDate = formatDate(currentDate);
      const formattedTime = formatTime(currentDate);
      setDate(formattedDate);
      setTime(formattedTime);
    }, 1000);
    return () => clearInterval(digitalTimer);
  }, []);

  return { date, time };
};

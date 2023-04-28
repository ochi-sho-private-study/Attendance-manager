import Axios, { AxiosResponse, AxiosError } from "axios";

export const ApiClient = Axios.create({
  baseURL: `http://localhost:3101`,
  withCredentials: true,
});

ApiClient.interceptors.response.use(
  (response: AxiosResponse<unknown>): AxiosResponse<unknown> => response,
  (error: AxiosError): Promise<never> => Promise.reject(error)
);
